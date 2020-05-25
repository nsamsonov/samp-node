# Auto-generated

struct Vector2
    x::Number
    y::Number
end

struct Vector3
    x::Number
    y::Number
    z::Number
end

struct Vector4
    w::Number
    x::Number
    y::Number
    z::Number
end

struct ShotVector
    originPos::Vector3
    hitPos::Vector3

    ShotVector(oX, oY, oZ, hX, hY, hZ) = new(Vector3(oX, oY, oZ), Vector3(hX, hY, hZ))
end

struct VehicleParamsEx
    engine::Int32
    lights::Int32
    alarm::Int32
    doors::Int32
    bonnet::Int32
    boot::Int32
    objective::Int32
end

struct VehicleParamsCarDoors
    driver::Int32
    passenger::Int32
    backleft::Int32
    backright::Int32
end

struct VehicleDamageStatus
    panels::Int32
    doors::Int32
    lights::Int32
    tires::Int32
end

struct PlayerWeaponData
    weapon::Int32
    ammo::Int32
end

struct PlayerKeys
    keys::Int32
    updown::Int32
    leftright::Int32
end

struct PlayerTime
    hour::Int32
    minute::Int32
end

struct AnimationName
    animlib::String
    animname::String
end

function CreateActor(modelid::Int32, position::Vector3, rotation::Number)::Int32
    __ret = ccall((:sampgdk_CreateActor, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), modelid, position.x, position.y, position.z, rotation)
    return __ret
end

function DestroyActor(actorid::Int32)::Bool
    __ret = ccall((:sampgdk_DestroyActor, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

function IsActorStreamedIn(actorid::Int32, forplayerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsActorStreamedIn, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), actorid, forplayerid)
    return __ret
end

function SetActorVirtualWorld(actorid::Int32, vworld::Int32)::Bool
    __ret = ccall((:sampgdk_SetActorVirtualWorld, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), actorid, vworld)
    return __ret
end

function GetActorVirtualWorld(actorid::Int32)::Int32
    __ret = ccall((:sampgdk_GetActorVirtualWorld, "./plugins/jules-andreas.so"), Cint, (Cint,), actorid)
    return __ret
end

function ApplyActorAnimation(actorid::Int32, animationName::AnimationName, fDelta::Number, loop::Bool, lockx::Bool, locky::Bool, freeze::Bool, time::Int32)::Bool
    __ret = ccall((:sampgdk_ApplyActorAnimation, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cstring, Cfloat, Cuchar, Cuchar, Cuchar, Cuchar, Cint), actorid, animationName.animlib, animationName.animname, fDelta, loop, lockx, locky, freeze, time)
    return __ret
end

function ClearActorAnimations(actorid::Int32)::Bool
    __ret = ccall((:sampgdk_ClearActorAnimations, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

function SetActorPos(actorid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetActorPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), actorid, position.x, position.y, position.z)
    return __ret
end

function GetActorPos(actorid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetActorPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), actorid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function SetActorFacingAngle(actorid::Int32, angle::Number)::Bool
    __ret = ccall((:sampgdk_SetActorFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), actorid, angle)
    return __ret
end

function GetActorFacingAngle(actorid::Int32)::Number
    angle_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetActorFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), actorid, angle_ref)
    angle = angle_ref[]
    return angle
end

function SetActorHealth(actorid::Int32, health::Number)::Bool
    __ret = ccall((:sampgdk_SetActorHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), actorid, health)
    return __ret
end

function GetActorHealth(actorid::Int32)::Number
    health_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetActorHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), actorid, health_ref)
    health = health_ref[]
    return health
end

function SetActorInvulnerable(actorid::Int32, invulnerable::Bool)::Bool
    __ret = ccall((:sampgdk_SetActorInvulnerable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), actorid, invulnerable)
    return __ret
end

function IsActorInvulnerable(actorid::Int32)::Bool
    __ret = ccall((:sampgdk_IsActorInvulnerable, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

function IsValidActor(actorid::Int32)::Bool
    __ret = ccall((:sampgdk_IsValidActor, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

function IsValidVehicle(vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_IsValidVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

function GetVehicleDistanceFromPoint(vehicleid::Int32, position::Vector3)::Float32
    __ret = ccall((:sampgdk_GetVehicleDistanceFromPoint, "./plugins/jules-andreas.so"), Cfloat, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

function CreateVehicle(vehicletype::Int32, position::Vector3, rotation::Number, color1::Int32, color2::Int32, respawn_delay::Int32, addsiren::Bool)::Int32
    __ret = ccall((:sampgdk_CreateVehicle, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cuchar), vehicletype, position.x, position.y, position.z, rotation, color1, color2, respawn_delay, addsiren)
    return __ret
end

function DestroyVehicle(vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_DestroyVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

function IsVehicleStreamedIn(vehicleid::Int32, forplayerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsVehicleStreamedIn, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, forplayerid)
    return __ret
end

function GetVehiclePos(vehicleid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehiclePos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), vehicleid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function SetVehiclePos(vehicleid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetVehiclePos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

function GetVehicleZAngle(vehicleid::Int32)::Number
    z_angle_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleZAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), vehicleid, z_angle_ref)
    z_angle = z_angle_ref[]
    return z_angle
end

function GetVehicleRotationQuat(vehicleid::Int32)::Vector4
    w_ref = Ref{Float32}(0)
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleRotationQuat, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), vehicleid, w_ref, x_ref, y_ref, z_ref)
    w = w_ref[]
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector4(w, x, y, z)
end

function SetVehicleZAngle(vehicleid::Int32, z_angle::Number)::Bool
    __ret = ccall((:sampgdk_SetVehicleZAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), vehicleid, z_angle)
    return __ret
end

function SetVehicleParamsForPlayer(vehicleid::Int32, playerid::Int32, objective::Int32, doorslocked::Int32)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint), vehicleid, playerid, objective, doorslocked)
    return __ret
end

function ManualVehicleEngineAndLights()::Bool
    __ret = ccall((:sampgdk_ManualVehicleEngineAndLights, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

function SetVehicleParamsEx(vehicleid::Int32, vehicleParamsEx::VehicleParamsEx)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsEx, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleParamsEx.engine, vehicleParamsEx.lights, vehicleParamsEx.alarm, vehicleParamsEx.doors, vehicleParamsEx.bonnet, vehicleParamsEx.boot, vehicleParamsEx.objective)
    return __ret
end

function GetVehicleParamsEx(vehicleid::Int32)::VehicleParamsEx
    engine_ref = Ref{Int32}(0)
    lights_ref = Ref{Int32}(0)
    alarm_ref = Ref{Int32}(0)
    doors_ref = Ref{Int32}(0)
    bonnet_ref = Ref{Int32}(0)
    boot_ref = Ref{Int32}(0)
    objective_ref = Ref{Int32}(0)
    __ret = ccall((:sampgdk_GetVehicleParamsEx, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), vehicleid, engine_ref, lights_ref, alarm_ref, doors_ref, bonnet_ref, boot_ref, objective_ref)
    engine = engine_ref[]
    lights = lights_ref[]
    alarm = alarm_ref[]
    doors = doors_ref[]
    bonnet = bonnet_ref[]
    boot = boot_ref[]
    objective = objective_ref[]
    return VehicleParamsEx(engine, lights, alarm, doors, bonnet, boot, objective)
end

function GetVehicleParamsSirenState(vehicleid::Int32)::Int32
    __ret = ccall((:sampgdk_GetVehicleParamsSirenState, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

function SetVehicleParamsCarDoors(vehicleid::Int32, vehicleParamsCarDoors::VehicleParamsCarDoors)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsCarDoors, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleParamsCarDoors.driver, vehicleParamsCarDoors.passenger, vehicleParamsCarDoors.backleft, vehicleParamsCarDoors.backright)
    return __ret
end

function GetVehicleParamsCarDoors(vehicleid::Int32)::VehicleParamsCarDoors
    driver_ref = Ref{Int32}(0)
    passenger_ref = Ref{Int32}(0)
    backleft_ref = Ref{Int32}(0)
    backright_ref = Ref{Int32}(0)
    __ret = ccall((:sampgdk_GetVehicleParamsCarDoors, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), vehicleid, driver_ref, passenger_ref, backleft_ref, backright_ref)
    driver = driver_ref[]
    passenger = passenger_ref[]
    backleft = backleft_ref[]
    backright = backright_ref[]
    return VehicleParamsCarDoors(driver, passenger, backleft, backright)
end

function SetVehicleParamsCarWindows(vehicleid::Int32, vehicleParamsCarDoors::VehicleParamsCarDoors)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsCarWindows, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleParamsCarDoors.driver, vehicleParamsCarDoors.passenger, vehicleParamsCarDoors.backleft, vehicleParamsCarDoors.backright)
    return __ret
end

function GetVehicleParamsCarWindows(vehicleid::Int32)::VehicleParamsCarDoors
    driver_ref = Ref{Int32}(0)
    passenger_ref = Ref{Int32}(0)
    backleft_ref = Ref{Int32}(0)
    backright_ref = Ref{Int32}(0)
    __ret = ccall((:sampgdk_GetVehicleParamsCarWindows, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), vehicleid, driver_ref, passenger_ref, backleft_ref, backright_ref)
    driver = driver_ref[]
    passenger = passenger_ref[]
    backleft = backleft_ref[]
    backright = backright_ref[]
    return VehicleParamsCarDoors(driver, passenger, backleft, backright)
end

function SetVehicleToRespawn(vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_SetVehicleToRespawn, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

function LinkVehicleToInterior(vehicleid::Int32, interiorid::Int32)::Bool
    __ret = ccall((:sampgdk_LinkVehicleToInterior, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, interiorid)
    return __ret
end

function AddVehicleComponent(vehicleid::Int32, componentid::Int32)::Bool
    __ret = ccall((:sampgdk_AddVehicleComponent, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, componentid)
    return __ret
end

function RemoveVehicleComponent(vehicleid::Int32, componentid::Int32)::Bool
    __ret = ccall((:sampgdk_RemoveVehicleComponent, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, componentid)
    return __ret
end

function ChangeVehicleColor(vehicleid::Int32, color1::Int32, color2::Int32)::Bool
    __ret = ccall((:sampgdk_ChangeVehicleColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), vehicleid, color1, color2)
    return __ret
end

function ChangeVehiclePaintjob(vehicleid::Int32, paintjobid::Int32)::Bool
    __ret = ccall((:sampgdk_ChangeVehiclePaintjob, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, paintjobid)
    return __ret
end

function SetVehicleHealth(vehicleid::Int32, health::Number)::Bool
    __ret = ccall((:sampgdk_SetVehicleHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), vehicleid, health)
    return __ret
end

function GetVehicleHealth(vehicleid::Int32)::Number
    health_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), vehicleid, health_ref)
    health = health_ref[]
    return health
end

function AttachTrailerToVehicle(trailerid::Int32, vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_AttachTrailerToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), trailerid, vehicleid)
    return __ret
end

function DetachTrailerFromVehicle(vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_DetachTrailerFromVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

function IsTrailerAttachedToVehicle(vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_IsTrailerAttachedToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

function GetVehicleTrailer(vehicleid::Int32)::Int32
    __ret = ccall((:sampgdk_GetVehicleTrailer, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

function SetVehicleNumberPlate(vehicleid::Int32, numberplate::String)::Bool
    __ret = ccall((:sampgdk_SetVehicleNumberPlate, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), vehicleid, numberplate)
    return __ret
end

function GetVehicleModel(vehicleid::Int32)::Int32
    __ret = ccall((:sampgdk_GetVehicleModel, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

function GetVehicleComponentInSlot(vehicleid::Int32, slot::Int32)::Int32
    __ret = ccall((:sampgdk_GetVehicleComponentInSlot, "./plugins/jules-andreas.so"), Cint, (Cint, Cint), vehicleid, slot)
    return __ret
end

function GetVehicleComponentType(component::Int32)::Int32
    __ret = ccall((:sampgdk_GetVehicleComponentType, "./plugins/jules-andreas.so"), Cint, (Cint,), component)
    return __ret
end

function RepairVehicle(vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_RepairVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

function GetVehicleVelocity(vehicleid::Int32)::Vector3
    X_ref = Ref{Float32}(0)
    Y_ref = Ref{Float32}(0)
    Z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), vehicleid, X_ref, Y_ref, Z_ref)
    X = X_ref[]
    Y = Y_ref[]
    Z = Z_ref[]
    return Vector3(X, Y, Z)
end

function SetVehicleVelocity(vehicleid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetVehicleVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

function SetVehicleAngularVelocity(vehicleid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetVehicleAngularVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

function GetVehicleDamageStatus(vehicleid::Int32)::VehicleDamageStatus
    panels_ref = Ref{Int32}(0)
    doors_ref = Ref{Int32}(0)
    lights_ref = Ref{Int32}(0)
    tires_ref = Ref{Int32}(0)
    __ret = ccall((:sampgdk_GetVehicleDamageStatus, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), vehicleid, panels_ref, doors_ref, lights_ref, tires_ref)
    panels = panels_ref[]
    doors = doors_ref[]
    lights = lights_ref[]
    tires = tires_ref[]
    return VehicleDamageStatus(panels, doors, lights, tires)
end

function UpdateVehicleDamageStatus(vehicleid::Int32, vehicleDamageStatus::VehicleDamageStatus)::Bool
    __ret = ccall((:sampgdk_UpdateVehicleDamageStatus, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleDamageStatus.panels, vehicleDamageStatus.doors, vehicleDamageStatus.lights, vehicleDamageStatus.tires)
    return __ret
end

function SetVehicleVirtualWorld(vehicleid::Int32, worldid::Int32)::Bool
    __ret = ccall((:sampgdk_SetVehicleVirtualWorld, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, worldid)
    return __ret
end

function GetVehicleVirtualWorld(vehicleid::Int32)::Int32
    __ret = ccall((:sampgdk_GetVehicleVirtualWorld, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

function GetVehicleModelInfo(model::Int32, infotype::Int32)::Vector3
    X_ref = Ref{Float32}(0)
    Y_ref = Ref{Float32}(0)
    Z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleModelInfo, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), model, infotype, X_ref, Y_ref, Z_ref)
    X = X_ref[]
    Y = Y_ref[]
    Z = Z_ref[]
    return Vector3(X, Y, Z)
end

function SendClientMessage(playerid::Int32, color::Int32, message::String)::Bool
    __ret = ccall((:sampgdk_SendClientMessage, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, color, message)
    return __ret
end

function SendClientMessageToAll(color::Int32, message::String)::Bool
    __ret = ccall((:sampgdk_SendClientMessageToAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), color, message)
    return __ret
end

function SendPlayerMessageToPlayer(playerid::Int32, senderid::Int32, message::String)::Bool
    __ret = ccall((:sampgdk_SendPlayerMessageToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, senderid, message)
    return __ret
end

function SendPlayerMessageToAll(senderid::Int32, message::String)::Bool
    __ret = ccall((:sampgdk_SendPlayerMessageToAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), senderid, message)
    return __ret
end

function SendDeathMessage(killer::Int32, killee::Int32, weapon::Int32)::Bool
    __ret = ccall((:sampgdk_SendDeathMessage, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), killer, killee, weapon)
    return __ret
end

function SendDeathMessageToPlayer(playerid::Int32, killer::Int32, killee::Int32, weapon::Int32)::Bool
    __ret = ccall((:sampgdk_SendDeathMessageToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint), playerid, killer, killee, weapon)
    return __ret
end

function GameTextForAll(text::String, time::Int32, style::Int32)::Bool
    __ret = ccall((:sampgdk_GameTextForAll, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cint, Cint), text, time, style)
    return __ret
end

function GameTextForPlayer(playerid::Int32, text::String, time::Int32, style::Int32)::Bool
    __ret = ccall((:sampgdk_GameTextForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint, Cint), playerid, text, time, style)
    return __ret
end

function GetTickCount()::Int32
    __ret = ccall((:sampgdk_GetTickCount, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

function GetMaxPlayers()::Int32
    __ret = ccall((:sampgdk_GetMaxPlayers, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

function VectorSize(position::Vector3)::Float32
    __ret = ccall((:sampgdk_VectorSize, "./plugins/jules-andreas.so"), Cfloat, (Cfloat, Cfloat, Cfloat), position.x, position.y, position.z)
    return __ret
end

function GetPlayerPoolSize()::Int32
    __ret = ccall((:sampgdk_GetPlayerPoolSize, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

function GetVehiclePoolSize()::Int32
    __ret = ccall((:sampgdk_GetVehiclePoolSize, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

function GetActorPoolSize()::Int32
    __ret = ccall((:sampgdk_GetActorPoolSize, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

function SHA256_PassHash(password::String, salt::String, ret_hash_size::Int32 = 64)::String
    __ret_hash_buf = Vector{UInt8}(undef, 1 + ret_hash_size)
    __ret = ccall((:sampgdk_SHA256_PassHash, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cstring, Ptr{UInt8}, Cint), password, salt, __ret_hash_buf, ret_hash_size)
    ret_hash = unsafe_string(pointer(__ret_hash_buf))
    return ret_hash
end

function SetSVarInt(varname::String, int_value::Int32)::Bool
    __ret = ccall((:sampgdk_SetSVarInt, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cint), varname, int_value)
    return __ret
end

function GetSVarInt(varname::String)::Int32
    __ret = ccall((:sampgdk_GetSVarInt, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

function SetSVarString(varname::String, string_value::String)::Bool
    __ret = ccall((:sampgdk_SetSVarString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cstring), varname, string_value)
    return __ret
end

function GetSVarString(varname::String, string_return_size::Int32 = 256)::String
    __string_return_buf = Vector{UInt8}(undef, 1 + string_return_size)
    __ret = ccall((:sampgdk_GetSVarString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Ptr{UInt8}, Cint), varname, __string_return_buf, string_return_size)
    string_return = unsafe_string(pointer(__string_return_buf))
    return string_return
end

function SetSVarFloat(varname::String, float_value::Number)::Bool
    __ret = ccall((:sampgdk_SetSVarFloat, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cfloat), varname, float_value)
    return __ret
end

function GetSVarFloat(varname::String)::Float32
    __ret = ccall((:sampgdk_GetSVarFloat, "./plugins/jules-andreas.so"), Cfloat, (Cstring,), varname)
    return __ret
end

function DeleteSVar(varname::String)::Bool
    __ret = ccall((:sampgdk_DeleteSVar, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), varname)
    return __ret
end

function GetSVarsUpperIndex()::Int32
    __ret = ccall((:sampgdk_GetSVarsUpperIndex, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

function GetSVarNameAtIndex(index::Int32, ret_varname_size::Int32 = 256)::String
    __ret_varname_buf = Vector{UInt8}(undef, 1 + ret_varname_size)
    __ret = ccall((:sampgdk_GetSVarNameAtIndex, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), index, __ret_varname_buf, ret_varname_size)
    ret_varname = unsafe_string(pointer(__ret_varname_buf))
    return ret_varname
end

function GetSVarType(varname::String)::Int32
    __ret = ccall((:sampgdk_GetSVarType, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

function SetGameModeText(text::String)::Bool
    __ret = ccall((:sampgdk_SetGameModeText, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), text)
    return __ret
end

function SetTeamCount(count::Int32)::Bool
    __ret = ccall((:sampgdk_SetTeamCount, "./plugins/jules-andreas.so"), Cuchar, (Cint,), count)
    return __ret
end

function AddPlayerClass(modelid::Int32, position::Vector3, z_angle::Number, weapon1::Int32, weapon1_ammo::Int32, weapon2::Int32, weapon2_ammo::Int32, weapon3::Int32, weapon3_ammo::Int32)::Int32
    __ret = ccall((:sampgdk_AddPlayerClass, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cint, Cint, Cint), modelid, position.x, position.y, position.z, z_angle, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
    return __ret
end

function AddPlayerClassEx(teamid::Int32, modelid::Int32, position::Vector3, z_angle::Number, weapon1::Int32, weapon1_ammo::Int32, weapon2::Int32, weapon2_ammo::Int32, weapon3::Int32, weapon3_ammo::Int32)::Int32
    __ret = ccall((:sampgdk_AddPlayerClassEx, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cint, Cint, Cint), teamid, modelid, position.x, position.y, position.z, z_angle, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
    return __ret
end

function AddStaticVehicle(modelid::Int32, position::Vector3, z_angle::Number, color1::Int32, color2::Int32)::Int32
    __ret = ccall((:sampgdk_AddStaticVehicle, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), modelid, position.x, position.y, position.z, z_angle, color1, color2)
    return __ret
end

function AddStaticVehicleEx(modelid::Int32, position::Vector3, z_angle::Number, color1::Int32, color2::Int32, respawn_delay::Int32, addsiren::Bool)::Int32
    __ret = ccall((:sampgdk_AddStaticVehicleEx, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cuchar), modelid, position.x, position.y, position.z, z_angle, color1, color2, respawn_delay, addsiren)
    return __ret
end

function AddStaticPickup(model::Int32, type::Int32, position::Vector3, virtualworld::Int32)::Int32
    __ret = ccall((:sampgdk_AddStaticPickup, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cint), model, type, position.x, position.y, position.z, virtualworld)
    return __ret
end

function CreatePickup(model::Int32, type::Int32, position::Vector3, virtualworld::Int32)::Int32
    __ret = ccall((:sampgdk_CreatePickup, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cint), model, type, position.x, position.y, position.z, virtualworld)
    return __ret
end

function DestroyPickup(pickup::Int32)::Bool
    __ret = ccall((:sampgdk_DestroyPickup, "./plugins/jules-andreas.so"), Cuchar, (Cint,), pickup)
    return __ret
end

function ShowNameTags(show::Bool)::Bool
    __ret = ccall((:sampgdk_ShowNameTags, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), show)
    return __ret
end

function ShowPlayerMarkers(mode::Int32)::Bool
    __ret = ccall((:sampgdk_ShowPlayerMarkers, "./plugins/jules-andreas.so"), Cuchar, (Cint,), mode)
    return __ret
end

function GameModeExit()::Bool
    __ret = ccall((:sampgdk_GameModeExit, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

function SetWorldTime(hour::Int32)::Bool
    __ret = ccall((:sampgdk_SetWorldTime, "./plugins/jules-andreas.so"), Cuchar, (Cint,), hour)
    return __ret
end

function GetWeaponName(weaponid::Int32, name_size::Int32 = 32)::String
    __name_buf = Vector{UInt8}(undef, 1 + name_size)
    __ret = ccall((:sampgdk_GetWeaponName, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), weaponid, __name_buf, name_size)
    name = unsafe_string(pointer(__name_buf))
    return name
end

function EnableTirePopping(enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableTirePopping, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), enable)
    return __ret
end

function EnableVehicleFriendlyFire()::Bool
    __ret = ccall((:sampgdk_EnableVehicleFriendlyFire, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

function AllowInteriorWeapons(allow::Bool)::Bool
    __ret = ccall((:sampgdk_AllowInteriorWeapons, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), allow)
    return __ret
end

function SetWeather(weatherid::Int32)::Bool
    __ret = ccall((:sampgdk_SetWeather, "./plugins/jules-andreas.so"), Cuchar, (Cint,), weatherid)
    return __ret
end

function SetGravity(gravity::Number)::Bool
    __ret = ccall((:sampgdk_SetGravity, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), gravity)
    return __ret
end

function GetGravity()::Float32
    __ret = ccall((:sampgdk_GetGravity, "./plugins/jules-andreas.so"), Cfloat, ())
    return __ret
end

function AllowAdminTeleport(allow::Bool)::Bool
    __ret = ccall((:sampgdk_AllowAdminTeleport, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), allow)
    return __ret
end

function SetDeathDropAmount(amount::Int32)::Bool
    __ret = ccall((:sampgdk_SetDeathDropAmount, "./plugins/jules-andreas.so"), Cuchar, (Cint,), amount)
    return __ret
end

function CreateExplosion(position::Vector3, type::Int32, radius::Number)::Bool
    __ret = ccall((:sampgdk_CreateExplosion, "./plugins/jules-andreas.so"), Cuchar, (Cfloat, Cfloat, Cfloat, Cint, Cfloat), position.x, position.y, position.z, type, radius)
    return __ret
end

function EnableZoneNames(enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableZoneNames, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), enable)
    return __ret
end

function UsePlayerPedAnims()::Bool
    __ret = ccall((:sampgdk_UsePlayerPedAnims, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

function DisableInteriorEnterExits()::Bool
    __ret = ccall((:sampgdk_DisableInteriorEnterExits, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

function SetNameTagDrawDistance(distance::Number)::Bool
    __ret = ccall((:sampgdk_SetNameTagDrawDistance, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), distance)
    return __ret
end

function DisableNameTagLOS()::Bool
    __ret = ccall((:sampgdk_DisableNameTagLOS, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

function LimitGlobalChatRadius(chat_radius::Number)::Bool
    __ret = ccall((:sampgdk_LimitGlobalChatRadius, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), chat_radius)
    return __ret
end

function LimitPlayerMarkerRadius(marker_radius::Number)::Bool
    __ret = ccall((:sampgdk_LimitPlayerMarkerRadius, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), marker_radius)
    return __ret
end

function ConnectNPC(name::String, script::String)::Bool
    __ret = ccall((:sampgdk_ConnectNPC, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cstring), name, script)
    return __ret
end

function IsPlayerNPC(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerNPC, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function IsPlayerAdmin(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerAdmin, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function Kick(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_Kick, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function Ban(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_Ban, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function BanEx(playerid::Int32, reason::String)::Bool
    __ret = ccall((:sampgdk_BanEx, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, reason)
    return __ret
end

function SendRconCommand(command::String)::Bool
    __ret = ccall((:sampgdk_SendRconCommand, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), command)
    return __ret
end

function GetPlayerNetworkStats(playerid::Int32, retstr_size::Int32 = 400)::String
    __retstr_buf = Vector{UInt8}(undef, 1 + retstr_size)
    __ret = ccall((:sampgdk_GetPlayerNetworkStats, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __retstr_buf, retstr_size)
    retstr = unsafe_string(pointer(__retstr_buf))
    return retstr
end

function GetNetworkStats(retstr_size::Int32 = 400)::String
    __retstr_buf = Vector{UInt8}(undef, 1 + retstr_size)
    __ret = ccall((:sampgdk_GetNetworkStats, "./plugins/jules-andreas.so"), Cuchar, (Ptr{UInt8}, Cint), __retstr_buf, retstr_size)
    retstr = unsafe_string(pointer(__retstr_buf))
    return retstr
end

function GetPlayerVersion(playerid::Int32, version_size::Int32 = 24)::String
    __version_buf = Vector{UInt8}(undef, 1 + version_size)
    __ret = ccall((:sampgdk_GetPlayerVersion, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __version_buf, version_size)
    version = unsafe_string(pointer(__version_buf))
    return version
end

function BlockIpAddress(ip_address::String, timems::Int32)::Bool
    __ret = ccall((:sampgdk_BlockIpAddress, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cint), ip_address, timems)
    return __ret
end

function UnBlockIpAddress(ip_address::String)::Bool
    __ret = ccall((:sampgdk_UnBlockIpAddress, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), ip_address)
    return __ret
end

function GetServerVarAsString(varname::String, value_size::Int32 = 256)::String
    __value_buf = Vector{UInt8}(undef, 1 + value_size)
    __ret = ccall((:sampgdk_GetServerVarAsString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Ptr{UInt8}, Cint), varname, __value_buf, value_size)
    value = unsafe_string(pointer(__value_buf))
    return value
end

function GetServerVarAsInt(varname::String)::Int32
    __ret = ccall((:sampgdk_GetServerVarAsInt, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

function GetServerVarAsBool(varname::String)::Bool
    __ret = ccall((:sampgdk_GetServerVarAsBool, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), varname)
    return __ret
end

function GetConsoleVarAsString(varname::String, buffer_size::Int32 = 256)::String
    __buffer_buf = Vector{UInt8}(undef, 1 + buffer_size)
    __ret = ccall((:sampgdk_GetConsoleVarAsString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Ptr{UInt8}, Cint), varname, __buffer_buf, buffer_size)
    buffer = unsafe_string(pointer(__buffer_buf))
    return buffer
end

function GetConsoleVarAsInt(varname::String)::Int32
    __ret = ccall((:sampgdk_GetConsoleVarAsInt, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

function GetConsoleVarAsBool(varname::String)::Bool
    __ret = ccall((:sampgdk_GetConsoleVarAsBool, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), varname)
    return __ret
end

function GetServerTickRate()::Int32
    __ret = ccall((:sampgdk_GetServerTickRate, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

function NetStats_GetConnectedTime(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_NetStats_GetConnectedTime, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function NetStats_MessagesReceived(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_NetStats_MessagesReceived, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function NetStats_BytesReceived(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_NetStats_BytesReceived, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function NetStats_MessagesSent(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_NetStats_MessagesSent, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function NetStats_BytesSent(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_NetStats_BytesSent, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function NetStats_MessagesRecvPerSecond(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_NetStats_MessagesRecvPerSecond, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function NetStats_PacketLossPercent(playerid::Int32)::Float32
    __ret = ccall((:sampgdk_NetStats_PacketLossPercent, "./plugins/jules-andreas.so"), Cfloat, (Cint,), playerid)
    return __ret
end

function NetStats_ConnectionStatus(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_NetStats_ConnectionStatus, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function NetStats_GetIpPort(playerid::Int32, ip_port_size::Int32 = 22)::String
    __ip_port_buf = Vector{UInt8}(undef, 1 + ip_port_size)
    __ret = ccall((:sampgdk_NetStats_GetIpPort, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __ip_port_buf, ip_port_size)
    ip_port = unsafe_string(pointer(__ip_port_buf))
    return ip_port
end

function CreateMenu(title::String, columns::Int32, position::Vector2, col1width::Number, col2width::Number)::Int32
    __ret = ccall((:sampgdk_CreateMenu, "./plugins/jules-andreas.so"), Cint, (Cstring, Cint, Cfloat, Cfloat, Cfloat, Cfloat), title, columns, position.x, position.y, col1width, col2width)
    return __ret
end

function DestroyMenu(menuid::Int32)::Bool
    __ret = ccall((:sampgdk_DestroyMenu, "./plugins/jules-andreas.so"), Cuchar, (Cint,), menuid)
    return __ret
end

function AddMenuItem(menuid::Int32, column::Int32, menutext::String)::Int32
    __ret = ccall((:sampgdk_AddMenuItem, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cstring), menuid, column, menutext)
    return __ret
end

function SetMenuColumnHeader(menuid::Int32, column::Int32, columnheader::String)::Bool
    __ret = ccall((:sampgdk_SetMenuColumnHeader, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), menuid, column, columnheader)
    return __ret
end

function ShowMenuForPlayer(menuid::Int32, playerid::Int32)::Bool
    __ret = ccall((:sampgdk_ShowMenuForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), menuid, playerid)
    return __ret
end

function HideMenuForPlayer(menuid::Int32, playerid::Int32)::Bool
    __ret = ccall((:sampgdk_HideMenuForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), menuid, playerid)
    return __ret
end

function IsValidMenu(menuid::Int32)::Bool
    __ret = ccall((:sampgdk_IsValidMenu, "./plugins/jules-andreas.so"), Cuchar, (Cint,), menuid)
    return __ret
end

function DisableMenu(menuid::Int32)::Bool
    __ret = ccall((:sampgdk_DisableMenu, "./plugins/jules-andreas.so"), Cuchar, (Cint,), menuid)
    return __ret
end

function DisableMenuRow(menuid::Int32, row::Int32)::Bool
    __ret = ccall((:sampgdk_DisableMenuRow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), menuid, row)
    return __ret
end

function GetPlayerMenu(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerMenu, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function TextDrawCreate(position::Vector2, text::String)::Int32
    __ret = ccall((:sampgdk_TextDrawCreate, "./plugins/jules-andreas.so"), Cint, (Cfloat, Cfloat, Cstring), position.x, position.y, text)
    return __ret
end

function TextDrawDestroy(text::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawDestroy, "./plugins/jules-andreas.so"), Cuchar, (Cint,), text)
    return __ret
end

function TextDrawLetterSize(text::Int32, position::Vector2)::Bool
    __ret = ccall((:sampgdk_TextDrawLetterSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat), text, position.x, position.y)
    return __ret
end

function TextDrawTextSize(text::Int32, position::Vector2)::Bool
    __ret = ccall((:sampgdk_TextDrawTextSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat), text, position.x, position.y)
    return __ret
end

function TextDrawAlignment(text::Int32, alignment::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawAlignment, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, alignment)
    return __ret
end

function TextDrawColor(text::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, color)
    return __ret
end

function TextDrawUseBox(text::Int32, use::Bool)::Bool
    __ret = ccall((:sampgdk_TextDrawUseBox, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), text, use)
    return __ret
end

function TextDrawBoxColor(text::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawBoxColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, color)
    return __ret
end

function TextDrawSetShadow(text::Int32, size::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawSetShadow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, size)
    return __ret
end

function TextDrawSetOutline(text::Int32, size::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawSetOutline, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, size)
    return __ret
end

function TextDrawBackgroundColor(text::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawBackgroundColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, color)
    return __ret
end

function TextDrawFont(text::Int32, font::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawFont, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, font)
    return __ret
end

function TextDrawSetProportional(text::Int32, set::Bool)::Bool
    __ret = ccall((:sampgdk_TextDrawSetProportional, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), text, set)
    return __ret
end

function TextDrawSetSelectable(text::Int32, set::Bool)::Bool
    __ret = ccall((:sampgdk_TextDrawSetSelectable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), text, set)
    return __ret
end

function TextDrawShowForPlayer(playerid::Int32, text::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawShowForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

function TextDrawHideForPlayer(playerid::Int32, text::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawHideForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

function TextDrawShowForAll(text::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawShowForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), text)
    return __ret
end

function TextDrawHideForAll(text::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawHideForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), text)
    return __ret
end

function TextDrawSetString(text::Int32, string::String)::Bool
    __ret = ccall((:sampgdk_TextDrawSetString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), text, string)
    return __ret
end

function TextDrawSetPreviewModel(text::Int32, modelindex::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawSetPreviewModel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, modelindex)
    return __ret
end

function TextDrawSetPreviewRot(text::Int32, rotation::Vector3, fZoom::Number)::Bool
    __ret = ccall((:sampgdk_TextDrawSetPreviewRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), text, rotation.x, rotation.y, rotation.z, fZoom)
    return __ret
end

function TextDrawSetPreviewVehCol(text::Int32, color1::Int32, color2::Int32)::Bool
    __ret = ccall((:sampgdk_TextDrawSetPreviewVehCol, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), text, color1, color2)
    return __ret
end

function SelectTextDraw(playerid::Int32, hovercolor::Int32)::Bool
    __ret = ccall((:sampgdk_SelectTextDraw, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, hovercolor)
    return __ret
end

function CancelSelectTextDraw(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_CancelSelectTextDraw, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function GangZoneCreate(minx::Number, miny::Number, maxx::Number, maxy::Number)::Int32
    __ret = ccall((:sampgdk_GangZoneCreate, "./plugins/jules-andreas.so"), Cint, (Cfloat, Cfloat, Cfloat, Cfloat), minx, miny, maxx, maxy)
    return __ret
end

function GangZoneDestroy(zone::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneDestroy, "./plugins/jules-andreas.so"), Cuchar, (Cint,), zone)
    return __ret
end

function GangZoneShowForPlayer(playerid::Int32, zone::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneShowForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, zone, color)
    return __ret
end

function GangZoneShowForAll(zone::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneShowForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), zone, color)
    return __ret
end

function GangZoneHideForPlayer(playerid::Int32, zone::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneHideForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, zone)
    return __ret
end

function GangZoneHideForAll(zone::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneHideForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), zone)
    return __ret
end

function GangZoneFlashForPlayer(playerid::Int32, zone::Int32, flashcolor::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneFlashForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, zone, flashcolor)
    return __ret
end

function GangZoneFlashForAll(zone::Int32, flashcolor::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneFlashForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), zone, flashcolor)
    return __ret
end

function GangZoneStopFlashForPlayer(playerid::Int32, zone::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneStopFlashForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, zone)
    return __ret
end

function GangZoneStopFlashForAll(zone::Int32)::Bool
    __ret = ccall((:sampgdk_GangZoneStopFlashForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), zone)
    return __ret
end

function Create3DTextLabel(text::String, color::Int32, position::Vector3, DrawDistance::Number, virtualworld::Int32, testLOS::Bool)::Int32
    __ret = ccall((:sampgdk_Create3DTextLabel, "./plugins/jules-andreas.so"), Cint, (Cstring, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cuchar), text, color, position.x, position.y, position.z, DrawDistance, virtualworld, testLOS)
    return __ret
end

function Delete3DTextLabel(id::Int32)::Bool
    __ret = ccall((:sampgdk_Delete3DTextLabel, "./plugins/jules-andreas.so"), Cuchar, (Cint,), id)
    return __ret
end

function Attach3DTextLabelToPlayer(id::Int32, playerid::Int32, OffsetX::Number, OffsetY::Number, OffsetZ::Number)::Bool
    __ret = ccall((:sampgdk_Attach3DTextLabelToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), id, playerid, OffsetX, OffsetY, OffsetZ)
    return __ret
end

function Attach3DTextLabelToVehicle(id::Int32, vehicleid::Int32, OffsetX::Number, OffsetY::Number, OffsetZ::Number)::Bool
    __ret = ccall((:sampgdk_Attach3DTextLabelToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), id, vehicleid, OffsetX, OffsetY, OffsetZ)
    return __ret
end

function Update3DTextLabelText(id::Int32, color::Int32, text::String)::Bool
    __ret = ccall((:sampgdk_Update3DTextLabelText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), id, color, text)
    return __ret
end

function CreatePlayer3DTextLabel(playerid::Int32, text::String, color::Int32, position::Vector3, DrawDistance::Number, attachedplayer::Int32, attachedvehicle::Int32, testLOS::Bool)::Int32
    __ret = ccall((:sampgdk_CreatePlayer3DTextLabel, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cuchar), playerid, text, color, position.x, position.y, position.z, DrawDistance, attachedplayer, attachedvehicle, testLOS)
    return __ret
end

function DeletePlayer3DTextLabel(playerid::Int32, id::Int32)::Bool
    __ret = ccall((:sampgdk_DeletePlayer3DTextLabel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, id)
    return __ret
end

function UpdatePlayer3DTextLabelText(playerid::Int32, id::Int32, color::Int32, text::String)::Bool
    __ret = ccall((:sampgdk_UpdatePlayer3DTextLabelText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cstring), playerid, id, color, text)
    return __ret
end

function ShowPlayerDialog(playerid::Int32, dialogid::Int32, style::Int32, caption::String, info::String, button1::String, button2::String)::Bool
    __ret = ccall((:sampgdk_ShowPlayerDialog, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cstring, Cstring, Cstring, Cstring), playerid, dialogid, style, caption, info, button1, button2)
    return __ret
end

function KillTimer(timerid::Int32)::Bool
    __ret = ccall((:sampgdk_KillTimer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), timerid)
    return __ret
end

function gpci(playerid::Int32, buffer_size::Int32 = 40)::String
    __buffer_buf = Vector{UInt8}(undef, 1 + buffer_size)
    __ret = ccall((:sampgdk_gpci, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __buffer_buf, buffer_size)
    buffer = unsafe_string(pointer(__buffer_buf))
    return buffer
end

function AddCharModel(baseid::Int32, newid::Int32, dffname::String, txdname::String)::Int32
    __ret = ccall((:sampgdk_AddCharModel, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cstring, Cstring), baseid, newid, dffname, txdname)
    return __ret
end

function AddSimpleModel(virtualworld::Int32, baseid::Int32, newid::Int32, dffname::String, txdname::String)::Int32
    __ret = ccall((:sampgdk_AddSimpleModel, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cint, Cstring, Cstring), virtualworld, baseid, newid, dffname, txdname)
    return __ret
end

function AddSimpleModelTimed(virtualworld::Int32, baseid::Int32, newid::Int32, dffname::String, txdname::String, timeon::Int32, timeoff::Int32)::Int32
    __ret = ccall((:sampgdk_AddSimpleModelTimed, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cint, Cstring, Cstring, Cint, Cint), virtualworld, baseid, newid, dffname, txdname, timeon, timeoff)
    return __ret
end

function FindModelFileNameFromCRC(crc::Int32, model_str_size::Int32 = 256)::String
    __model_str_buf = Vector{UInt8}(undef, 1 + model_str_size)
    __ret = ccall((:sampgdk_FindModelFileNameFromCRC, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), crc, __model_str_buf, model_str_size)
    model_str = unsafe_string(pointer(__model_str_buf))
    return model_str
end

function FindTextureFileNameFromCRC(crc::Int32, texture_str_size::Int32 = 256)::String
    __texture_str_buf = Vector{UInt8}(undef, 1 + texture_str_size)
    __ret = ccall((:sampgdk_FindTextureFileNameFromCRC, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), crc, __texture_str_buf, texture_str_size)
    texture_str = unsafe_string(pointer(__texture_str_buf))
    return texture_str
end

function RedirectDownload(playerid::Int32, url::String)::Bool
    __ret = ccall((:sampgdk_RedirectDownload, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, url)
    return __ret
end

function HTTP(index::Int32, type::Int32, url::String, data::String)::Bool
    __ret = ccall((:sampgdk_HTTP, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring, Cstring), index, type, url, data)
    return __ret
end

function CreateObject(modelid::Int32, position::Vector3, rX::Number, rY::Number, rZ::Number, DrawDistance::Number)::Int32
    __ret = ccall((:sampgdk_CreateObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), modelid, position.x, position.y, position.z, rX, rY, rZ, DrawDistance)
    return __ret
end

function AttachObjectToVehicle(objectid::Int32, vehicleid::Int32, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachObjectToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectid, vehicleid, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ)
    return __ret
end

function AttachObjectToObject(objectid::Int32, attachtoid::Int32, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number, SyncRotation::Bool)::Bool
    __ret = ccall((:sampgdk_AttachObjectToObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cuchar), objectid, attachtoid, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ, SyncRotation)
    return __ret
end

function AttachObjectToPlayer(objectid::Int32, playerid::Int32, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachObjectToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectid, playerid, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ)
    return __ret
end

function SetObjectPos(objectid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), objectid, position.x, position.y, position.z)
    return __ret
end

function GetObjectPos(objectid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), objectid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function SetObjectRot(objectid::Int32, rotation::Vector3)::Bool
    __ret = ccall((:sampgdk_SetObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), objectid, rotation.x, rotation.y, rotation.z)
    return __ret
end

function GetObjectRot(objectid::Int32)::Vector3
    rotX_ref = Ref{Float32}(0)
    rotY_ref = Ref{Float32}(0)
    rotZ_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), objectid, rotX_ref, rotY_ref, rotZ_ref)
    rotX = rotX_ref[]
    rotY = rotY_ref[]
    rotZ = rotZ_ref[]
    return Vector3(rotX, rotY, rotZ)
end

function GetObjectModel(objectid::Int32)::Int32
    __ret = ccall((:sampgdk_GetObjectModel, "./plugins/jules-andreas.so"), Cint, (Cint,), objectid)
    return __ret
end

function SetObjectNoCameraCol(objectid::Int32)::Bool
    __ret = ccall((:sampgdk_SetObjectNoCameraCol, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

function IsValidObject(objectid::Int32)::Bool
    __ret = ccall((:sampgdk_IsValidObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

function DestroyObject(objectid::Int32)::Bool
    __ret = ccall((:sampgdk_DestroyObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

function MoveObject(objectid::Int32, position::Vector3, Speed::Number, RotX::Number, RotY::Number, RotZ::Number)::Int32
    __ret = ccall((:sampgdk_MoveObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectid, position.x, position.y, position.z, Speed, RotX, RotY, RotZ)
    return __ret
end

function StopObject(objectid::Int32)::Bool
    __ret = ccall((:sampgdk_StopObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

function IsObjectMoving(objectid::Int32)::Bool
    __ret = ccall((:sampgdk_IsObjectMoving, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

function EditObject(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_EditObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function EditPlayerObject(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_EditPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function SelectObject(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_SelectObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function CancelEdit(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_CancelEdit, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function CreatePlayerObject(playerid::Int32, modelid::Int32, position::Vector3, rX::Number, rY::Number, rZ::Number, DrawDistance::Number)::Int32
    __ret = ccall((:sampgdk_CreatePlayerObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, modelid, position.x, position.y, position.z, rX, rY, rZ, DrawDistance)
    return __ret
end

function AttachPlayerObjectToPlayer(objectplayer::Int32, objectid::Int32, attachplayer::Int32, OffsetX::Number, OffsetY::Number, OffsetZ::Number, rX::Number, rY::Number, rZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachPlayerObjectToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectplayer, objectid, attachplayer, OffsetX, OffsetY, OffsetZ, rX, rY, rZ)
    return __ret
end

function AttachPlayerObjectToVehicle(playerid::Int32, objectid::Int32, vehicleid::Int32, offset::Vector3, fRotX::Number, fRotY::Number, RotZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachPlayerObjectToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, objectid, vehicleid, offset.x, offset.y, offset.z, fRotX, fRotY, RotZ)
    return __ret
end

function SetPlayerObjectPos(playerid::Int32, objectid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), playerid, objectid, position.x, position.y, position.z)
    return __ret
end

function GetPlayerObjectPos(playerid::Int32, objectid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, objectid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function SetPlayerObjectRot(playerid::Int32, objectid::Int32, rotation::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), playerid, objectid, rotation.x, rotation.y, rotation.z)
    return __ret
end

function GetPlayerObjectRot(playerid::Int32, objectid::Int32)::Vector3
    rotX_ref = Ref{Float32}(0)
    rotY_ref = Ref{Float32}(0)
    rotZ_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, objectid, rotX_ref, rotY_ref, rotZ_ref)
    rotX = rotX_ref[]
    rotY = rotY_ref[]
    rotZ = rotZ_ref[]
    return Vector3(rotX, rotY, rotZ)
end

function GetPlayerObjectModel(playerid::Int32, objectid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerObjectModel, "./plugins/jules-andreas.so"), Cint, (Cint, Cint), playerid, objectid)
    return __ret
end

function SetPlayerObjectNoCameraCol(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectNoCameraCol, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function IsValidPlayerObject(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_IsValidPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function DestroyPlayerObject(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_DestroyPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function MovePlayerObject(playerid::Int32, objectid::Int32, position::Vector3, Speed::Number, RotX::Number, RotY::Number, RotZ::Number)::Int32
    __ret = ccall((:sampgdk_MovePlayerObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, objectid, position.x, position.y, position.z, Speed, RotX, RotY, RotZ)
    return __ret
end

function StopPlayerObject(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_StopPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function IsPlayerObjectMoving(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerObjectMoving, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function SetObjectMaterial(objectid::Int32, materialindex::Int32, modelid::Int32, txdname::String, texturename::String, materialcolor::Int32)::Bool
    __ret = ccall((:sampgdk_SetObjectMaterial, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cstring, Cstring, Cint), objectid, materialindex, modelid, txdname, texturename, materialcolor)
    return __ret
end

function SetPlayerObjectMaterial(playerid::Int32, objectid::Int32, materialindex::Int32, modelid::Int32, txdname::String, texturename::String, materialcolor::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectMaterial, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cstring, Cstring, Cint), playerid, objectid, materialindex, modelid, txdname, texturename, materialcolor)
    return __ret
end

function SetObjectMaterialText(objectid::Int32, text::String, materialindex::Int32, materialsize::Int32, fontface::String, fontsize::Int32, bold::Bool, fontcolor::Int32, backcolor::Int32, textalignment::Int32)::Bool
    __ret = ccall((:sampgdk_SetObjectMaterialText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint, Cint, Cstring, Cint, Cuchar, Cint, Cint, Cint), objectid, text, materialindex, materialsize, fontface, fontsize, bold, fontcolor, backcolor, textalignment)
    return __ret
end

function SetPlayerObjectMaterialText(playerid::Int32, objectid::Int32, text::String, materialindex::Int32, materialsize::Int32, fontface::String, fontsize::Int32, bold::Bool, fontcolor::Int32, backcolor::Int32, textalignment::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectMaterialText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring, Cint, Cint, Cstring, Cint, Cuchar, Cint, Cint, Cint), playerid, objectid, text, materialindex, materialsize, fontface, fontsize, bold, fontcolor, backcolor, textalignment)
    return __ret
end

function SetObjectsDefaultCameraCol(disable::Bool)::Bool
    __ret = ccall((:sampgdk_SetObjectsDefaultCameraCol, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), disable)
    return __ret
end

function SetSpawnInfo(playerid::Int32, team::Int32, skin::Int32, position::Vector3, rotation::Number, weapon1::Int32, weapon1_ammo::Int32, weapon2::Int32, weapon2_ammo::Int32, weapon3::Int32, weapon3_ammo::Int32)::Bool
    __ret = ccall((:sampgdk_SetSpawnInfo, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cint, Cint, Cint), playerid, team, skin, position.x, position.y, position.z, rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
    return __ret
end

function SpawnPlayer(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_SpawnPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerPos(playerid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

function SetPlayerPosFindZ(playerid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerPosFindZ, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

function GetPlayerPos(playerid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function SetPlayerFacingAngle(playerid::Int32, angle::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), playerid, angle)
    return __ret
end

function GetPlayerFacingAngle(playerid::Int32)::Number
    angle_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), playerid, angle_ref)
    angle = angle_ref[]
    return angle
end

function IsPlayerInRangeOfPoint(playerid::Int32, range::Number, position::Vector3)::Bool
    __ret = ccall((:sampgdk_IsPlayerInRangeOfPoint, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, range, position.x, position.y, position.z)
    return __ret
end

function GetPlayerDistanceFromPoint(playerid::Int32, position::Vector3)::Float32
    __ret = ccall((:sampgdk_GetPlayerDistanceFromPoint, "./plugins/jules-andreas.so"), Cfloat, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

function IsPlayerStreamedIn(playerid::Int32, forplayerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerStreamedIn, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, forplayerid)
    return __ret
end

function SetPlayerInterior(playerid::Int32, interiorid::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerInterior, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, interiorid)
    return __ret
end

function GetPlayerInterior(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerInterior, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerHealth(playerid::Int32, health::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), playerid, health)
    return __ret
end

function GetPlayerHealth(playerid::Int32)::Number
    health_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), playerid, health_ref)
    health = health_ref[]
    return health
end

function SetPlayerArmour(playerid::Int32, armour::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerArmour, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), playerid, armour)
    return __ret
end

function GetPlayerArmour(playerid::Int32)::Number
    armour_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerArmour, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), playerid, armour_ref)
    armour = armour_ref[]
    return armour
end

function SetPlayerAmmo(playerid::Int32, weaponid::Int32, ammo::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerAmmo, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, weaponid, ammo)
    return __ret
end

function GetPlayerAmmo(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerAmmo, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerWeaponState(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerWeaponState, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerTargetPlayer(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerTargetPlayer, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerTargetActor(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerTargetActor, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerTeam(playerid::Int32, teamid::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerTeam, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, teamid)
    return __ret
end

function GetPlayerTeam(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerTeam, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerScore(playerid::Int32, score::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerScore, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, score)
    return __ret
end

function GetPlayerScore(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerScore, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerDrunkLevel(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerDrunkLevel, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerDrunkLevel(playerid::Int32, level::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerDrunkLevel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, level)
    return __ret
end

function SetPlayerColor(playerid::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, color)
    return __ret
end

function GetPlayerColor(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerColor, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerSkin(playerid::Int32, skinid::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerSkin, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, skinid)
    return __ret
end

function GetPlayerSkin(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerSkin, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GivePlayerWeapon(playerid::Int32, weaponid::Int32, ammo::Int32)::Bool
    __ret = ccall((:sampgdk_GivePlayerWeapon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, weaponid, ammo)
    return __ret
end

function ResetPlayerWeapons(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_ResetPlayerWeapons, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerArmedWeapon(playerid::Int32, weaponid::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerArmedWeapon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, weaponid)
    return __ret
end

function GetPlayerWeaponData(playerid::Int32, slot::Int32)::PlayerWeaponData
    weapon_ref = Ref{Int32}(0)
    ammo_ref = Ref{Int32}(0)
    __ret = ccall((:sampgdk_GetPlayerWeaponData, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cint}, Ref{Cint}), playerid, slot, weapon_ref, ammo_ref)
    weapon = weapon_ref[]
    ammo = ammo_ref[]
    return PlayerWeaponData(weapon, ammo)
end

function GivePlayerMoney(playerid::Int32, money::Int32)::Bool
    __ret = ccall((:sampgdk_GivePlayerMoney, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, money)
    return __ret
end

function ResetPlayerMoney(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_ResetPlayerMoney, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerName(playerid::Int32, name::String)::Int32
    __ret = ccall((:sampgdk_SetPlayerName, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring), playerid, name)
    return __ret
end

function GetPlayerMoney(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerMoney, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerState(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerState, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerIp(playerid::Int32, ip_size::Int32 = 15)::String
    __ip_buf = Vector{UInt8}(undef, 1 + ip_size)
    __ret = ccall((:sampgdk_GetPlayerIp, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __ip_buf, ip_size)
    ip = unsafe_string(pointer(__ip_buf))
    return ip
end

function GetPlayerPing(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerPing, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerWeapon(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerWeapon, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerKeys(playerid::Int32)::PlayerKeys
    keys_ref = Ref{Int32}(0)
    updown_ref = Ref{Int32}(0)
    leftright_ref = Ref{Int32}(0)
    __ret = ccall((:sampgdk_GetPlayerKeys, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}), playerid, keys_ref, updown_ref, leftright_ref)
    keys = keys_ref[]
    updown = updown_ref[]
    leftright = leftright_ref[]
    return PlayerKeys(keys, updown, leftright)
end

function GetPlayerName(playerid::Int32, name_size::Int32 = 32)::String
    __name_buf = Vector{UInt8}(undef, 1 + name_size)
    __ret = ccall((:sampgdk_GetPlayerName, "./plugins/jules-andreas.so"), Cint, (Cint, Ptr{UInt8}, Cint), playerid, __name_buf, name_size)
    name = unsafe_string(pointer(__name_buf))
    return name
end

function SetPlayerTime(playerid::Int32, playerTime::PlayerTime)::Bool
    __ret = ccall((:sampgdk_SetPlayerTime, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, playerTime.hour, playerTime.minute)
    return __ret
end

function GetPlayerTime(playerid::Int32)::PlayerTime
    hour_ref = Ref{Int32}(0)
    minute_ref = Ref{Int32}(0)
    __ret = ccall((:sampgdk_GetPlayerTime, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}), playerid, hour_ref, minute_ref)
    hour = hour_ref[]
    minute = minute_ref[]
    return PlayerTime(hour, minute)
end

function TogglePlayerClock(playerid::Int32, toggle::Bool)::Bool
    __ret = ccall((:sampgdk_TogglePlayerClock, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, toggle)
    return __ret
end

function SetPlayerWeather(playerid::Int32, weather::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerWeather, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, weather)
    return __ret
end

function ForceClassSelection(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_ForceClassSelection, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerWantedLevel(playerid::Int32, level::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerWantedLevel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, level)
    return __ret
end

function GetPlayerWantedLevel(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerWantedLevel, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerFightingStyle(playerid::Int32, style::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerFightingStyle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, style)
    return __ret
end

function GetPlayerFightingStyle(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerFightingStyle, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerVelocity(playerid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

function GetPlayerVelocity(playerid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function PlayCrimeReportForPlayer(playerid::Int32, suspectid::Int32, crime::Int32)::Bool
    __ret = ccall((:sampgdk_PlayCrimeReportForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, suspectid, crime)
    return __ret
end

function PlayAudioStreamForPlayer(playerid::Int32, url::String, posX::Number, posY::Number, posZ::Number, distance::Number, usepos::Bool)::Bool
    __ret = ccall((:sampgdk_PlayAudioStreamForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cfloat, Cfloat, Cfloat, Cfloat, Cuchar), playerid, url, posX, posY, posZ, distance, usepos)
    return __ret
end

function StopAudioStreamForPlayer(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_StopAudioStreamForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerShopName(playerid::Int32, shopname::String)::Bool
    __ret = ccall((:sampgdk_SetPlayerShopName, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, shopname)
    return __ret
end

function SetPlayerSkillLevel(playerid::Int32, skill::Int32, level::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerSkillLevel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, skill, level)
    return __ret
end

function GetPlayerSurfingVehicleID(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerSurfingVehicleID, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerSurfingObjectID(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerSurfingObjectID, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function RemoveBuildingForPlayer(playerid::Int32, modelid::Int32, position::Vector3, fRadius::Number)::Bool
    __ret = ccall((:sampgdk_RemoveBuildingForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, modelid, position.x, position.y, position.z, fRadius)
    return __ret
end

function GetPlayerLastShotVectors(playerid::Int32)::ShotVector
    fOriginX_ref = Ref{Float32}(0)
    fOriginY_ref = Ref{Float32}(0)
    fOriginZ_ref = Ref{Float32}(0)
    fHitPosX_ref = Ref{Float32}(0)
    fHitPosY_ref = Ref{Float32}(0)
    fHitPosZ_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerLastShotVectors, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, fOriginX_ref, fOriginY_ref, fOriginZ_ref, fHitPosX_ref, fHitPosY_ref, fHitPosZ_ref)
    fOriginX = fOriginX_ref[]
    fOriginY = fOriginY_ref[]
    fOriginZ = fOriginZ_ref[]
    fHitPosX = fHitPosX_ref[]
    fHitPosY = fHitPosY_ref[]
    fHitPosZ = fHitPosZ_ref[]
    return ShotVector(fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ)
end

function SetPlayerAttachedObject(playerid::Int32, index::Int32, modelid::Int32, bone::Int32, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number, scale::Vector3, materialcolor1::Int32, materialcolor2::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerAttachedObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), playerid, index, modelid, bone, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ, scale.x, scale.y, scale.z, materialcolor1, materialcolor2)
    return __ret
end

function RemovePlayerAttachedObject(playerid::Int32, index::Int32)::Bool
    __ret = ccall((:sampgdk_RemovePlayerAttachedObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, index)
    return __ret
end

function IsPlayerAttachedObjectSlotUsed(playerid::Int32, index::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerAttachedObjectSlotUsed, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, index)
    return __ret
end

function EditAttachedObject(playerid::Int32, index::Int32)::Bool
    __ret = ccall((:sampgdk_EditAttachedObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, index)
    return __ret
end

function CreatePlayerTextDraw(playerid::Int32, position::Vector2, text::String)::Int32
    __ret = ccall((:sampgdk_CreatePlayerTextDraw, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cstring), playerid, position.x, position.y, text)
    return __ret
end

function PlayerTextDrawDestroy(playerid::Int32, text::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawDestroy, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

function PlayerTextDrawLetterSize(playerid::Int32, text::Int32, position::Vector2)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawLetterSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat), playerid, text, position.x, position.y)
    return __ret
end

function PlayerTextDrawTextSize(playerid::Int32, text::Int32, position::Vector2)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawTextSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat), playerid, text, position.x, position.y)
    return __ret
end

function PlayerTextDrawAlignment(playerid::Int32, text::Int32, alignment::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawAlignment, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, alignment)
    return __ret
end

function PlayerTextDrawColor(playerid::Int32, text::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, color)
    return __ret
end

function PlayerTextDrawUseBox(playerid::Int32, text::Int32, use::Bool)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawUseBox, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, text, use)
    return __ret
end

function PlayerTextDrawBoxColor(playerid::Int32, text::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawBoxColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, color)
    return __ret
end

function PlayerTextDrawSetShadow(playerid::Int32, text::Int32, size::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetShadow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, size)
    return __ret
end

function PlayerTextDrawSetOutline(playerid::Int32, text::Int32, size::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetOutline, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, size)
    return __ret
end

function PlayerTextDrawBackgroundColor(playerid::Int32, text::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawBackgroundColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, color)
    return __ret
end

function PlayerTextDrawFont(playerid::Int32, text::Int32, font::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawFont, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, font)
    return __ret
end

function PlayerTextDrawSetProportional(playerid::Int32, text::Int32, set::Bool)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetProportional, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, text, set)
    return __ret
end

function PlayerTextDrawSetSelectable(playerid::Int32, text::Int32, set::Bool)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetSelectable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, text, set)
    return __ret
end

function PlayerTextDrawShow(playerid::Int32, text::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawShow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

function PlayerTextDrawHide(playerid::Int32, text::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawHide, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

function PlayerTextDrawSetString(playerid::Int32, text::Int32, string::String)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, text, string)
    return __ret
end

function PlayerTextDrawSetPreviewModel(playerid::Int32, text::Int32, modelindex::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetPreviewModel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, modelindex)
    return __ret
end

function PlayerTextDrawSetPreviewRot(playerid::Int32, text::Int32, rotation::Vector3, fZoom::Number)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetPreviewRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, text, rotation.x, rotation.y, rotation.z, fZoom)
    return __ret
end

function PlayerTextDrawSetPreviewVehCol(playerid::Int32, text::Int32, color1::Int32, color2::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetPreviewVehCol, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint), playerid, text, color1, color2)
    return __ret
end

function SetPVarInt(playerid::Int32, varname::String, value::Int32)::Bool
    __ret = ccall((:sampgdk_SetPVarInt, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint), playerid, varname, value)
    return __ret
end

function GetPVarInt(playerid::Int32, varname::String)::Int32
    __ret = ccall((:sampgdk_GetPVarInt, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring), playerid, varname)
    return __ret
end

function SetPVarString(playerid::Int32, varname::String, value::String)::Bool
    __ret = ccall((:sampgdk_SetPVarString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cstring), playerid, varname, value)
    return __ret
end

function GetPVarString(playerid::Int32, varname::String, value_size::Int32 = 256)::String
    __value_buf = Vector{UInt8}(undef, 1 + value_size)
    __ret = ccall((:sampgdk_GetPVarString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Ptr{UInt8}, Cint), playerid, varname, __value_buf, value_size)
    value = unsafe_string(pointer(__value_buf))
    return value
end

function SetPVarFloat(playerid::Int32, varname::String, value::Number)::Bool
    __ret = ccall((:sampgdk_SetPVarFloat, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cfloat), playerid, varname, value)
    return __ret
end

function GetPVarFloat(playerid::Int32, varname::String)::Float32
    __ret = ccall((:sampgdk_GetPVarFloat, "./plugins/jules-andreas.so"), Cfloat, (Cint, Cstring), playerid, varname)
    return __ret
end

function DeletePVar(playerid::Int32, varname::String)::Bool
    __ret = ccall((:sampgdk_DeletePVar, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, varname)
    return __ret
end

function GetPVarsUpperIndex(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPVarsUpperIndex, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPVarNameAtIndex(playerid::Int32, index::Int32, varname_size::Int32 = 256)::String
    __varname_buf = Vector{UInt8}(undef, 1 + varname_size)
    __ret = ccall((:sampgdk_GetPVarNameAtIndex, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ptr{UInt8}, Cint), playerid, index, __varname_buf, varname_size)
    varname = unsafe_string(pointer(__varname_buf))
    return varname
end

function GetPVarType(playerid::Int32, varname::String)::Int32
    __ret = ccall((:sampgdk_GetPVarType, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring), playerid, varname)
    return __ret
end

function SetPlayerChatBubble(playerid::Int32, text::String, color::Int32, drawdistance::Number, expiretime::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerChatBubble, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint, Cfloat, Cint), playerid, text, color, drawdistance, expiretime)
    return __ret
end

function PutPlayerInVehicle(playerid::Int32, vehicleid::Int32, seatid::Int32)::Bool
    __ret = ccall((:sampgdk_PutPlayerInVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, vehicleid, seatid)
    return __ret
end

function GetPlayerVehicleID(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerVehicleID, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerVehicleSeat(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerVehicleSeat, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function RemovePlayerFromVehicle(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_RemovePlayerFromVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function TogglePlayerControllable(playerid::Int32, toggle::Bool)::Bool
    __ret = ccall((:sampgdk_TogglePlayerControllable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, toggle)
    return __ret
end

function PlayerPlaySound(playerid::Int32, soundid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_PlayerPlaySound, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), playerid, soundid, position.x, position.y, position.z)
    return __ret
end

function ApplyAnimation(playerid::Int32, animationName::AnimationName, fDelta::Number, loop::Bool, lockx::Bool, locky::Bool, freeze::Bool, time::Int32, forcesync::Bool)::Bool
    __ret = ccall((:sampgdk_ApplyAnimation, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cstring, Cfloat, Cuchar, Cuchar, Cuchar, Cuchar, Cint, Cuchar), playerid, animationName.animlib, animationName.animname, fDelta, loop, lockx, locky, freeze, time, forcesync)
    return __ret
end

function ClearAnimations(playerid::Int32, forcesync::Bool)::Bool
    __ret = ccall((:sampgdk_ClearAnimations, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, forcesync)
    return __ret
end

function GetPlayerAnimationIndex(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerAnimationIndex, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetAnimationName(index::Int32, animlib_size::Int32 = 32, animname_size::Int32 = 32)::AnimationName
    __animlib_buf = Vector{UInt8}(undef, 1 + animlib_size)
    __animname_buf = Vector{UInt8}(undef, 1 + animname_size)
    __ret = ccall((:sampgdk_GetAnimationName, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint, Ptr{UInt8}, Cint), index, __animlib_buf, animlib_size, __animname_buf, animname_size)
    animlib = unsafe_string(pointer(__animlib_buf))
    animname = unsafe_string(pointer(__animname_buf))
    return AnimationName(animlib, animname)
end

function GetPlayerSpecialAction(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerSpecialAction, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function SetPlayerSpecialAction(playerid::Int32, actionid::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerSpecialAction, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, actionid)
    return __ret
end

function DisableRemoteVehicleCollisions(playerid::Int32, disable::Bool)::Bool
    __ret = ccall((:sampgdk_DisableRemoteVehicleCollisions, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, disable)
    return __ret
end

function SetPlayerCheckpoint(playerid::Int32, position::Vector3, size::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z, size)
    return __ret
end

function DisablePlayerCheckpoint(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_DisablePlayerCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerRaceCheckpoint(playerid::Int32, type::Int32, position::Vector3, nextx::Number, nexty::Number, nextz::Number, size::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerRaceCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, type, position.x, position.y, position.z, nextx, nexty, nextz, size)
    return __ret
end

function DisablePlayerRaceCheckpoint(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_DisablePlayerRaceCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerWorldBounds(playerid::Int32, x_max::Number, x_min::Number, y_max::Number, y_min::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerWorldBounds, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, x_max, x_min, y_max, y_min)
    return __ret
end

function SetPlayerMarkerForPlayer(playerid::Int32, showplayerid::Int32, color::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerMarkerForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, showplayerid, color)
    return __ret
end

function ShowPlayerNameTagForPlayer(playerid::Int32, showplayerid::Int32, show::Bool)::Bool
    __ret = ccall((:sampgdk_ShowPlayerNameTagForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, showplayerid, show)
    return __ret
end

function SetPlayerMapIcon(playerid::Int32, iconid::Int32, position::Vector3, markertype::Int32, color::Int32, style::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerMapIcon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint), playerid, iconid, position.x, position.y, position.z, markertype, color, style)
    return __ret
end

function RemovePlayerMapIcon(playerid::Int32, iconid::Int32)::Bool
    __ret = ccall((:sampgdk_RemovePlayerMapIcon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, iconid)
    return __ret
end

function AllowPlayerTeleport(playerid::Int32, allow::Bool)::Bool
    __ret = ccall((:sampgdk_AllowPlayerTeleport, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, allow)
    return __ret
end

function SetPlayerCameraPos(playerid::Int32, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerCameraPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

function SetPlayerCameraLookAt(playerid::Int32, position::Vector3, cut::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerCameraLookAt, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cint), playerid, position.x, position.y, position.z, cut)
    return __ret
end

function SetCameraBehindPlayer(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_SetCameraBehindPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function GetPlayerCameraPos(playerid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerCameraPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function GetPlayerCameraFrontVector(playerid::Int32)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerCameraFrontVector, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

function GetPlayerCameraMode(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerCameraMode, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function EnablePlayerCameraTarget(playerid::Int32, enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnablePlayerCameraTarget, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, enable)
    return __ret
end

function GetPlayerCameraTargetObject(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerCameraTargetObject, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerCameraTargetVehicle(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerCameraTargetVehicle, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerCameraTargetPlayer(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerCameraTargetPlayer, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerCameraTargetActor(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerCameraTargetActor, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function GetPlayerCameraAspectRatio(playerid::Int32)::Float32
    __ret = ccall((:sampgdk_GetPlayerCameraAspectRatio, "./plugins/jules-andreas.so"), Cfloat, (Cint,), playerid)
    return __ret
end

function GetPlayerCameraZoom(playerid::Int32)::Float32
    __ret = ccall((:sampgdk_GetPlayerCameraZoom, "./plugins/jules-andreas.so"), Cfloat, (Cint,), playerid)
    return __ret
end

function AttachCameraToObject(playerid::Int32, objectid::Int32)::Bool
    __ret = ccall((:sampgdk_AttachCameraToObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

function AttachCameraToPlayerObject(playerid::Int32, playerobjectid::Int32)::Bool
    __ret = ccall((:sampgdk_AttachCameraToPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, playerobjectid)
    return __ret
end

function InterpolateCameraPos(playerid::Int32, fromPos::Vector3, ToX::Number, ToY::Number, ToZ::Number, time::Int32, cut::Int32)::Bool
    __ret = ccall((:sampgdk_InterpolateCameraPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), playerid, fromPos.x, fromPos.y, fromPos.z, ToX, ToY, ToZ, time, cut)
    return __ret
end

function InterpolateCameraLookAt(playerid::Int32, fromPos::Vector3, ToX::Number, ToY::Number, ToZ::Number, time::Int32, cut::Int32)::Bool
    __ret = ccall((:sampgdk_InterpolateCameraLookAt, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), playerid, fromPos.x, fromPos.y, fromPos.z, ToX, ToY, ToZ, time, cut)
    return __ret
end

function IsPlayerConnected(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerConnected, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function IsPlayerInVehicle(playerid::Int32, vehicleid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerInVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, vehicleid)
    return __ret
end

function IsPlayerInAnyVehicle(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerInAnyVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function IsPlayerInCheckpoint(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerInCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function IsPlayerInRaceCheckpoint(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_IsPlayerInRaceCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function SetPlayerVirtualWorld(playerid::Int32, worldid::Int32)::Bool
    __ret = ccall((:sampgdk_SetPlayerVirtualWorld, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, worldid)
    return __ret
end

function GetPlayerVirtualWorld(playerid::Int32)::Int32
    __ret = ccall((:sampgdk_GetPlayerVirtualWorld, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

function EnableStuntBonusForPlayer(playerid::Int32, enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableStuntBonusForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, enable)
    return __ret
end

function EnableStuntBonusForAll(enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableStuntBonusForAll, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), enable)
    return __ret
end

function TogglePlayerSpectating(playerid::Int32, toggle::Bool)::Bool
    __ret = ccall((:sampgdk_TogglePlayerSpectating, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, toggle)
    return __ret
end

function PlayerSpectatePlayer(playerid::Int32, targetplayerid::Int32, mode::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerSpectatePlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, targetplayerid, mode)
    return __ret
end

function PlayerSpectateVehicle(playerid::Int32, targetvehicleid::Int32, mode::Int32)::Bool
    __ret = ccall((:sampgdk_PlayerSpectateVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, targetvehicleid, mode)
    return __ret
end

function StartRecordingPlayerData(playerid::Int32, recordtype::Int32, recordname::String)::Bool
    __ret = ccall((:sampgdk_StartRecordingPlayerData, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, recordtype, recordname)
    return __ret
end

function StopRecordingPlayerData(playerid::Int32)::Bool
    __ret = ccall((:sampgdk_StopRecordingPlayerData, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

function CreateExplosionForPlayer(playerid::Int32, position::Vector3, type::Int32, Radius::Number)::Bool
    __ret = ccall((:sampgdk_CreateExplosionForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cint, Cfloat), playerid, position.x, position.y, position.z, type, Radius)
    return __ret
end
