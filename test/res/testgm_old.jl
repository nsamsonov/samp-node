module testgm

include("include/natives.jl")

# println("Print global gm")

function OnGameModeInit()
    # global test = x -> 2*x
    println("Game mode init!")
    SetGameModeText("TEST NATIVE")

    id = CreateVehicle(411, Vector3(11, 11, 15), 55.0, 16, 14, -1, true)

    log("Vehicle pos $(GetVehiclePos(id))")
    return 1
end

function OnIncomingConnection(playerid::Integer, ip_address::String, port::Integer)
    println("Incoming connection pid: $playerid ip: $ip_address:$port")
end

function OnPlayerConnect(playerid::Integer)
    playerName = GetPlayerName(playerid)
    log("On player connect pid: $playerName[$playerid]")
end

function OnPlayerRequestClass(playerid::Integer, class::Integer)
    log("On player request class pid: $playerid class $class")
    r = GetPlayerPos(playerid)
    log("Get player pos $r")
end

function OnPlayerCommandText(playerid::Integer, command::String)
    args = split(command, " ")[2:end]
    if (startswith(command, "/veh"))
        vid, = args
        playerPos = GetPlayerPos(playerid)
        angle = GetPlayerFacingAngle(playerid)
        log(GetPlayerTime(playerid))
        log("Player pos $playerid $playerPos ang: $angle")
        c1 = rand(0:127)
        c2 = rand(0:127)
        CreateVehicle(parse(Int32, vid), playerPos, 0.0, c1, c2, -1, true)
        return 1
    elseif (startswith(command, "/eval"))
        expr = command[7:end]
        res = Base.eval(Main, Meta.parse(expr))
        log(res)
        return 1
    end
    return 0
end


function OnPlayerUpdate(playerid::Int32)
    return 1
end

function OnRconCommand(command)
    log(command)
end

# Helpers
function log(args...)
    println(args...)
    SendClientMessageToAll(-1, string(args...))
end

end