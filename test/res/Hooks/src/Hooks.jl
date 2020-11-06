module Hooks

println("INCLUDED ONCE")

export @hook, @hookable, CallbackResult

__noop__ = (args...) -> nothing

@enum CallbackResult RETURN_TRUE RETURN_FALSE RETURN_ANY

mutable struct Hookable
    main::Function
    beforehooks::Vector{Function}
    Hookable() = new(__noop__, Vector{Function}())
    Hookable(main::Function) = new(main, Vector{Function}())
    Hookable(hookable::Hookable, main::Function) = new(main, hookable.beforehooks)
end

__jhooks__ = Vector{Function}()
global __hookables__ = Dict{Symbol, Hookable}()
__hookables__[:abc] = Hookable(() -> println("YAY"))

function __init__()
    println("INIT HOOKS ", __hookables__)
    # hookablemap_sym = gensym()
    # @eval(Main, $hookablemap_sym = $((@__MODULE__).__hookables__))
end


function (cb::Hookable)(args...)
    for hook = cb.beforehooks
        result = hook(args...)
        if (result == RETURN_TRUE)
            return true
        elseif (result == RETURN_FALSE)
            return false
        elseif (result isa Tuple{CallbackResult, Any})
            return result[2]
        end
    end
    return cb.main(args...)
end

getorcreatehookable!(symbol::Symbol) = get!(() -> Hookable(), __hookables__, symbol)

macro hookable(callback::Expr)
    __hookables__[:abc] = Hookable(() -> println("NAY"))
    println("HERE 1")
    @assert callback.head == :function "@hookable can only be applied to a function"
    signature = callback.args[1]
    name::Symbol = signature.args[1]
    println("HERE 2")
    hookable = getorcreatehookable!(name)
    println(hookable, " ", typeof(hookable))
    @assert hookable.main === __noop__ "$name has already been declared @hookable. Use @hook instead"
    hookable.main = eval(:(local $callback))
    __hookables__[name] = hookable
    println("HERE 3 ", name, " ", hookable)
    res = :(global $name = $hookable)
    println(res)
    # return res
    return :(println("nice ", $__hookables__, " ", Hooks.__hookables__))
end

macro hook(callback::Expr)
    @assert callback.head == :function "@hook can only be applied to a function"

    signature, body = callback.args
    hookName = get(signature.args, 1, nothing)
    @assert hookName isa Symbol "missing hookable name"


    hookable = getorcreatehookable!(hookName)
    hook = @eval local $callback
    push!(hookable.beforehooks, hook)

    if (!isdefined(__module__, hookName))
        return :(global $hookName = $hook)
    end
end

macro hook(originalFunction::Symbol, callback::Expr)
    @assert callback.head == :function "@hook can only be applied to a function"
    @assert originalFunction isa Symbol "missing hookable name"

    hookable = getorcreatehookable!(originalFunction)
    hook = @eval local $callback
    push!(hookable.beforehooks, hook)

    signature, body = callback.args
    hookName = get(signature.args, 1, nothing)
    if (hookName isa Symbol && !isdefined(__module__, hookName))
        return :(global $hookName = $hook)
    end
end

end # module

# module __Test__
#     println("Running tests")
#     import ..Hooks
#
#     ### TEST ORDER ###
#     results = Vector{String}()
#     @Hooks.hookable function f(a::Integer, results::Vector{String})
#         push!(results, "main $a")
#         return "OK"
#     end
#
#     @Hooks.hook function f(a::Integer, results::Vector{String})
#         push!(results, "hook $a")
#     end
#
#     @Hooks.hook f function f(a::Integer, results::Vector{String})
#         push!(results, "hook explicit $a")
#     end
#
#     @Hooks.hook f function g(a::Integer, results::Vector{String})
#         push!(results, "hook explicit unique $a")
#         if (a == -1)
#             return Hooks.RETURN_ANY, "ABORT"
#         end
#     end
#
#     module D
#         import ..Hooks
#
#         @Hooks.hook f function f(a::Integer, results::Vector{String})
#             push!(results, "module hook explicit $a")
#         end
#
#         @Hooks.hook function f(a::Integer, results::Vector{String})
#             push!(results, "module hook $a")
#         end
#
#         @Hooks.hook f function g(a::Integer, results::Vector{String})
#             push!(results, "module hook explicit unique $a")
#         end
#     end
#
#     const expectedResult = [
#         "hook 15",
#         "hook explicit 15",
#         "hook explicit unique 15",
#         "module hook explicit 15",
#         "module hook 15",
#         "module hook explicit unique 15",
#         "main 15"
#     ]
#
#     @assert f(15, results) == "OK"
#     @assert results == expectedResult
#     @assert f(-1, Vector{String}()) == "ABORT"
#
#     ### TEST NO HOOK
#     @Hooks.hook function test_nohook(r)
#         push!(r, "hook 1")
#     end
#     @Hooks.hook function test_nohook(r)
#         push!(r, "hook 2")
#     end
#     @Hooks.hook test_nohook function(r)
#         push!(r, "hook 3")
#     end
#
#     @Hooks.hook test_nohook function test_nohook_tmp(r)
#         push!(r, "hook 4")
#     end
#
#     res_nohook = []
#     Hooks.__hookables__[:test_nohook](res_nohook)
#     @assert res_nohook == ["hook 1", "hook 2", "hook 3", "hook 4"]
#
#     ### TEST MAIN AFTER HOOK
#     @Hooks.hook function test_main_last(r)
#         push!(r, "hook 1")
#     end
#     @Hooks.hookable function test_main_last(r)
#         push!(r, "main")
#     end
#     @Hooks.hook function test_main_last(r)
#         push!(r, "hook 2")
#     end
#
#     res_main_last = []
#     Hooks.__hookables__[:test_main_last](res_main_last)
#     @assert res_main_last == ["hook 1", "hook 2", "main"]
# end
