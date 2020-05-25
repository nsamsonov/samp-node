gm = include("./testgm.jl")

println("post import")


println(isdefined(gm, :test))
gm.onGameModeInit()
println(isdefined(gm, :test))
map()
