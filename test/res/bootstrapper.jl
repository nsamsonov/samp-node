push!(LOAD_PATH, pwd())

module bootstrapper
import Hooks


# packages = Vector{Module}()
#
# function loadpackage(package::Symbol)
#     push!(packages, package)
# end

function getMethods(m::Module)
    ns = names(m, all = true)
    callables = filter(n -> getproperty(JulesRP, n) |> methods |> !isempty, ns)
end

function loadScript(msym::Symbol)
end

function loadMain(msym::Symbol)
    m = Base.require(bootstrapper, msym)
end

function registerNative(nativesym::Symbol)

end
