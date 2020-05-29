
println("INCLUDED ONCE")

__jhooks__ = Vector{Function}()

macro hook_before(originalFunction, hookFunction::Expr)
    show(__module__)
    println()
    show(Meta.show_sexpr(originalFunction))
    println()
    show(Meta.show_sexpr(hookFunction))
    println()
    show(typeof(originalFunction))
    show(typeof(hookFunction))
    return quote
        begin
            println("EVALED HERE TOO")
            local function createWrapper()
                global $originalFunction
                hook = $hookFunction
                original = $originalFunction
                local function wrapper(args...)
                    result = hook(args...)
                    if (isnothing)
                        original(args...)
                    end
                    return result
                end
                original = wrapper
            end

            push!(__jhooks__, createWrapper)
        end
    end
end

@hook_before OnPlayerCommandText function foo()
    println("foo hook!")
end

function __init__()
    println("INIT!!")
    for hook in __jhooks__
        hook()
    end
end
