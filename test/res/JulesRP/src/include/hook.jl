println("INCLUDED ONCE ORIG")

# module HooksInit
__jhooks__ = Vector{Function}()
function __init__()
    println("INIT HOOKS ORIG")
    for hook in __jhooks__
        hook()
    end
end
# end

@enum CallbackResult RETURN_TRUE RETURN_FALSE RETURN_ANY

struct Hookable
    main::Function
    beforehooks::Vector{Function}
    Hookable(main::Function) = new(main, Vector())
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

macro hookable(callback::Expr)
    @assert callback.head == :function "@public can only be applied to a function"
    signature = callback.args[1]
    name = signature.args[1]
    signature.args[1] = gensym()
    return :(begin global $name = Hookable(local $callback) end)
end

macro hookable(originalFunction, callback::Expr)
    res = quote
        begin
            global $originalFunction = Hookable(local $callback)
        end
    end
    return res
end

macro hook(originalFunction, hookFunction::Expr)
    res = quote
        begin
            push!(__jhooks__, () -> begin
                if (!@isdefined $originalFunction)
                    global $originalFunction = Hookable((args...) -> nothing)
                end
                @assert $originalFunction isa Hookable "@hook can only be applied to a function marked as @hookable"
                push!($originalFunction.beforehooks, local $hookFunction)
            end)
        end
    end
    return res
end

@hook OnGameModeInit123 function()
    println("PRE INIT")
end
