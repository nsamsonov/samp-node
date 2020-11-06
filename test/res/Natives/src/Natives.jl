# Auto-generated
module Natives

export Vector2
struct Vector2
    x::Number
    y::Number
end

export Vector3
struct Vector3
    x::Number
    y::Number
    z::Number
end

export Vector4
struct Vector4
    w::Number
    x::Number
    y::Number
    z::Number
end

export ShotVector
struct ShotVector
    originPos::Vector3
    hitPos::Vector3

    ShotVector(oX, oY, oZ, hX, hY, hZ) = new(Vector3(oX, oY, oZ), Vector3(hX, hY, hZ))
end

export VehicleParamsEx
struct VehicleParamsEx
    engine::Integer
    lights::Integer
    alarm::Integer
    doors::Integer
    bonnet::Integer
    boot::Integer
    objective::Integer
end

export VehicleParamsCarDoors
struct VehicleParamsCarDoors
    driver::Integer
    passenger::Integer
    backleft::Integer
    backright::Integer
end

export VehicleDamageStatus
struct VehicleDamageStatus
    panels::Integer
    doors::Integer
    lights::Integer
    tires::Integer
end

export PlayerWeaponData
struct PlayerWeaponData
    weapon::Integer
    ammo::Integer
end

export PlayerKeys
struct PlayerKeys
    keys::Integer
    updown::Integer
    leftright::Integer
end

export PlayerTime
struct PlayerTime
    hour::Integer
    minute::Integer
end

export AnimationName
struct AnimationName
    animlib::String
    animname::String
end

export CreateActor
function CreateActor(modelid::Integer, position::Vector3, rotation::Number)::Integer
    __ret = ccall((:sampgdk_CreateActor, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), modelid, position.x, position.y, position.z, rotation)
    return __ret
end

export DestroyActor
function DestroyActor(actorid::Integer)::Bool
    __ret = ccall((:sampgdk_DestroyActor, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

export IsActorStreamedIn
function IsActorStreamedIn(actorid::Integer, forplayerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsActorStreamedIn, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), actorid, forplayerid)
    return __ret
end

export SetActorVirtualWorld
function SetActorVirtualWorld(actorid::Integer, vworld::Integer)::Bool
    __ret = ccall((:sampgdk_SetActorVirtualWorld, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), actorid, vworld)
    return __ret
end

export GetActorVirtualWorld
function GetActorVirtualWorld(actorid::Integer)::Integer
    __ret = ccall((:sampgdk_GetActorVirtualWorld, "./plugins/jules-andreas.so"), Cint, (Cint,), actorid)
    return __ret
end

export ApplyActorAnimation
function ApplyActorAnimation(actorid::Integer, animationName::AnimationName, fDelta::Number, loop::Bool, lockx::Bool, locky::Bool, freeze::Bool, time::Integer)::Bool
    __ret = ccall((:sampgdk_ApplyActorAnimation, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cstring, Cfloat, Cuchar, Cuchar, Cuchar, Cuchar, Cint), actorid, animationName.animlib, animationName.animname, fDelta, loop, lockx, locky, freeze, time)
    return __ret
end

export ClearActorAnimations
function ClearActorAnimations(actorid::Integer)::Bool
    __ret = ccall((:sampgdk_ClearActorAnimations, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

export SetActorPos
function SetActorPos(actorid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetActorPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), actorid, position.x, position.y, position.z)
    return __ret
end

export GetActorPos
function GetActorPos(actorid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetActorPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), actorid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export SetActorFacingAngle
function SetActorFacingAngle(actorid::Integer, angle::Number)::Bool
    __ret = ccall((:sampgdk_SetActorFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), actorid, angle)
    return __ret
end

export GetActorFacingAngle
function GetActorFacingAngle(actorid::Integer)::Number
    angle_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetActorFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), actorid, angle_ref)
    angle = angle_ref[]
    return angle
end

export SetActorHealth
function SetActorHealth(actorid::Integer, health::Number)::Bool
    __ret = ccall((:sampgdk_SetActorHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), actorid, health)
    return __ret
end

export GetActorHealth
function GetActorHealth(actorid::Integer)::Number
    health_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetActorHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), actorid, health_ref)
    health = health_ref[]
    return health
end

export SetActorInvulnerable
function SetActorInvulnerable(actorid::Integer, invulnerable::Bool)::Bool
    __ret = ccall((:sampgdk_SetActorInvulnerable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), actorid, invulnerable)
    return __ret
end

export IsActorInvulnerable
function IsActorInvulnerable(actorid::Integer)::Bool
    __ret = ccall((:sampgdk_IsActorInvulnerable, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

export IsValidActor
function IsValidActor(actorid::Integer)::Bool
    __ret = ccall((:sampgdk_IsValidActor, "./plugins/jules-andreas.so"), Cuchar, (Cint,), actorid)
    return __ret
end

export IsValidVehicle
function IsValidVehicle(vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_IsValidVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

export GetVehicleDistanceFromPoint
function GetVehicleDistanceFromPoint(vehicleid::Integer, position::Vector3)::Number
    __ret = ccall((:sampgdk_GetVehicleDistanceFromPoint, "./plugins/jules-andreas.so"), Cfloat, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

export CreateVehicle
function CreateVehicle(vehicletype::Integer, position::Vector3, rotation::Number, color1::Integer, color2::Integer, respawn_delay::Integer, addsiren::Bool)::Integer
    __ret = ccall((:sampgdk_CreateVehicle, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cuchar), vehicletype, position.x, position.y, position.z, rotation, color1, color2, respawn_delay, addsiren)
    return __ret
end

export DestroyVehicle
function DestroyVehicle(vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_DestroyVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

export IsVehicleStreamedIn
function IsVehicleStreamedIn(vehicleid::Integer, forplayerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsVehicleStreamedIn, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, forplayerid)
    return __ret
end

export GetVehiclePos
function GetVehiclePos(vehicleid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehiclePos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), vehicleid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export SetVehiclePos
function SetVehiclePos(vehicleid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetVehiclePos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

export GetVehicleZAngle
function GetVehicleZAngle(vehicleid::Integer)::Number
    z_angle_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleZAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), vehicleid, z_angle_ref)
    z_angle = z_angle_ref[]
    return z_angle
end

export GetVehicleRotationQuat
function GetVehicleRotationQuat(vehicleid::Integer)::Vector4
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

export SetVehicleZAngle
function SetVehicleZAngle(vehicleid::Integer, z_angle::Number)::Bool
    __ret = ccall((:sampgdk_SetVehicleZAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), vehicleid, z_angle)
    return __ret
end

export SetVehicleParamsForPlayer
function SetVehicleParamsForPlayer(vehicleid::Integer, playerid::Integer, objective::Integer, doorslocked::Integer)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint), vehicleid, playerid, objective, doorslocked)
    return __ret
end

export ManualVehicleEngineAndLights
function ManualVehicleEngineAndLights()::Bool
    __ret = ccall((:sampgdk_ManualVehicleEngineAndLights, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

export SetVehicleParamsEx
function SetVehicleParamsEx(vehicleid::Integer, vehicleParamsEx::VehicleParamsEx)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsEx, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleParamsEx.engine, vehicleParamsEx.lights, vehicleParamsEx.alarm, vehicleParamsEx.doors, vehicleParamsEx.bonnet, vehicleParamsEx.boot, vehicleParamsEx.objective)
    return __ret
end

export GetVehicleParamsEx
function GetVehicleParamsEx(vehicleid::Integer)::VehicleParamsEx
    engine_ref = Ref{Integer}(0)
    lights_ref = Ref{Integer}(0)
    alarm_ref = Ref{Integer}(0)
    doors_ref = Ref{Integer}(0)
    bonnet_ref = Ref{Integer}(0)
    boot_ref = Ref{Integer}(0)
    objective_ref = Ref{Integer}(0)
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

export GetVehicleParamsSirenState
function GetVehicleParamsSirenState(vehicleid::Integer)::Integer
    __ret = ccall((:sampgdk_GetVehicleParamsSirenState, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

export SetVehicleParamsCarDoors
function SetVehicleParamsCarDoors(vehicleid::Integer, vehicleParamsCarDoors::VehicleParamsCarDoors)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsCarDoors, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleParamsCarDoors.driver, vehicleParamsCarDoors.passenger, vehicleParamsCarDoors.backleft, vehicleParamsCarDoors.backright)
    return __ret
end

export GetVehicleParamsCarDoors
function GetVehicleParamsCarDoors(vehicleid::Integer)::VehicleParamsCarDoors
    driver_ref = Ref{Integer}(0)
    passenger_ref = Ref{Integer}(0)
    backleft_ref = Ref{Integer}(0)
    backright_ref = Ref{Integer}(0)
    __ret = ccall((:sampgdk_GetVehicleParamsCarDoors, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), vehicleid, driver_ref, passenger_ref, backleft_ref, backright_ref)
    driver = driver_ref[]
    passenger = passenger_ref[]
    backleft = backleft_ref[]
    backright = backright_ref[]
    return VehicleParamsCarDoors(driver, passenger, backleft, backright)
end

export SetVehicleParamsCarWindows
function SetVehicleParamsCarWindows(vehicleid::Integer, vehicleParamsCarDoors::VehicleParamsCarDoors)::Bool
    __ret = ccall((:sampgdk_SetVehicleParamsCarWindows, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleParamsCarDoors.driver, vehicleParamsCarDoors.passenger, vehicleParamsCarDoors.backleft, vehicleParamsCarDoors.backright)
    return __ret
end

export GetVehicleParamsCarWindows
function GetVehicleParamsCarWindows(vehicleid::Integer)::VehicleParamsCarDoors
    driver_ref = Ref{Integer}(0)
    passenger_ref = Ref{Integer}(0)
    backleft_ref = Ref{Integer}(0)
    backright_ref = Ref{Integer}(0)
    __ret = ccall((:sampgdk_GetVehicleParamsCarWindows, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), vehicleid, driver_ref, passenger_ref, backleft_ref, backright_ref)
    driver = driver_ref[]
    passenger = passenger_ref[]
    backleft = backleft_ref[]
    backright = backright_ref[]
    return VehicleParamsCarDoors(driver, passenger, backleft, backright)
end

export SetVehicleToRespawn
function SetVehicleToRespawn(vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_SetVehicleToRespawn, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

export LinkVehicleToInterior
function LinkVehicleToInterior(vehicleid::Integer, interiorid::Integer)::Bool
    __ret = ccall((:sampgdk_LinkVehicleToInterior, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, interiorid)
    return __ret
end

export AddVehicleComponent
function AddVehicleComponent(vehicleid::Integer, componentid::Integer)::Bool
    __ret = ccall((:sampgdk_AddVehicleComponent, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, componentid)
    return __ret
end

export RemoveVehicleComponent
function RemoveVehicleComponent(vehicleid::Integer, componentid::Integer)::Bool
    __ret = ccall((:sampgdk_RemoveVehicleComponent, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, componentid)
    return __ret
end

export ChangeVehicleColor
function ChangeVehicleColor(vehicleid::Integer, color1::Integer, color2::Integer)::Bool
    __ret = ccall((:sampgdk_ChangeVehicleColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), vehicleid, color1, color2)
    return __ret
end

export ChangeVehiclePaintjob
function ChangeVehiclePaintjob(vehicleid::Integer, paintjobid::Integer)::Bool
    __ret = ccall((:sampgdk_ChangeVehiclePaintjob, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, paintjobid)
    return __ret
end

export SetVehicleHealth
function SetVehicleHealth(vehicleid::Integer, health::Number)::Bool
    __ret = ccall((:sampgdk_SetVehicleHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), vehicleid, health)
    return __ret
end

export GetVehicleHealth
function GetVehicleHealth(vehicleid::Integer)::Number
    health_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), vehicleid, health_ref)
    health = health_ref[]
    return health
end

export AttachTrailerToVehicle
function AttachTrailerToVehicle(trailerid::Integer, vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_AttachTrailerToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), trailerid, vehicleid)
    return __ret
end

export DetachTrailerFromVehicle
function DetachTrailerFromVehicle(vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_DetachTrailerFromVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

export IsTrailerAttachedToVehicle
function IsTrailerAttachedToVehicle(vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_IsTrailerAttachedToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

export GetVehicleTrailer
function GetVehicleTrailer(vehicleid::Integer)::Integer
    __ret = ccall((:sampgdk_GetVehicleTrailer, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

export SetVehicleNumberPlate
function SetVehicleNumberPlate(vehicleid::Integer, numberplate::String)::Bool
    __ret = ccall((:sampgdk_SetVehicleNumberPlate, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), vehicleid, numberplate)
    return __ret
end

export GetVehicleModel
function GetVehicleModel(vehicleid::Integer)::Integer
    __ret = ccall((:sampgdk_GetVehicleModel, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

export GetVehicleComponentInSlot
function GetVehicleComponentInSlot(vehicleid::Integer, slot::Integer)::Integer
    __ret = ccall((:sampgdk_GetVehicleComponentInSlot, "./plugins/jules-andreas.so"), Cint, (Cint, Cint), vehicleid, slot)
    return __ret
end

export GetVehicleComponentType
function GetVehicleComponentType(component::Integer)::Integer
    __ret = ccall((:sampgdk_GetVehicleComponentType, "./plugins/jules-andreas.so"), Cint, (Cint,), component)
    return __ret
end

export RepairVehicle
function RepairVehicle(vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_RepairVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), vehicleid)
    return __ret
end

export GetVehicleVelocity
function GetVehicleVelocity(vehicleid::Integer)::Vector3
    X_ref = Ref{Float32}(0)
    Y_ref = Ref{Float32}(0)
    Z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), vehicleid, X_ref, Y_ref, Z_ref)
    X = X_ref[]
    Y = Y_ref[]
    Z = Z_ref[]
    return Vector3(X, Y, Z)
end

export SetVehicleVelocity
function SetVehicleVelocity(vehicleid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetVehicleVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

export SetVehicleAngularVelocity
function SetVehicleAngularVelocity(vehicleid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetVehicleAngularVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), vehicleid, position.x, position.y, position.z)
    return __ret
end

export GetVehicleDamageStatus
function GetVehicleDamageStatus(vehicleid::Integer)::VehicleDamageStatus
    panels_ref = Ref{Integer}(0)
    doors_ref = Ref{Integer}(0)
    lights_ref = Ref{Integer}(0)
    tires_ref = Ref{Integer}(0)
    __ret = ccall((:sampgdk_GetVehicleDamageStatus, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), vehicleid, panels_ref, doors_ref, lights_ref, tires_ref)
    panels = panels_ref[]
    doors = doors_ref[]
    lights = lights_ref[]
    tires = tires_ref[]
    return VehicleDamageStatus(panels, doors, lights, tires)
end

export UpdateVehicleDamageStatus
function UpdateVehicleDamageStatus(vehicleid::Integer, vehicleDamageStatus::VehicleDamageStatus)::Bool
    __ret = ccall((:sampgdk_UpdateVehicleDamageStatus, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cint), vehicleid, vehicleDamageStatus.panels, vehicleDamageStatus.doors, vehicleDamageStatus.lights, vehicleDamageStatus.tires)
    return __ret
end

export SetVehicleVirtualWorld
function SetVehicleVirtualWorld(vehicleid::Integer, worldid::Integer)::Bool
    __ret = ccall((:sampgdk_SetVehicleVirtualWorld, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), vehicleid, worldid)
    return __ret
end

export GetVehicleVirtualWorld
function GetVehicleVirtualWorld(vehicleid::Integer)::Integer
    __ret = ccall((:sampgdk_GetVehicleVirtualWorld, "./plugins/jules-andreas.so"), Cint, (Cint,), vehicleid)
    return __ret
end

export GetVehicleModelInfo
function GetVehicleModelInfo(model::Integer, infotype::Integer)::Vector3
    X_ref = Ref{Float32}(0)
    Y_ref = Ref{Float32}(0)
    Z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetVehicleModelInfo, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), model, infotype, X_ref, Y_ref, Z_ref)
    X = X_ref[]
    Y = Y_ref[]
    Z = Z_ref[]
    return Vector3(X, Y, Z)
end

export SendClientMessage
function SendClientMessage(playerid::Integer, color::Integer, message::String)::Bool
    __ret = ccall((:sampgdk_SendClientMessage, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, color, message)
    return __ret
end

export SendClientMessageToAll
function SendClientMessageToAll(color::Integer, message::String)::Bool
    __ret = ccall((:sampgdk_SendClientMessageToAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), color, message)
    return __ret
end

export SendPlayerMessageToPlayer
function SendPlayerMessageToPlayer(playerid::Integer, senderid::Integer, message::String)::Bool
    __ret = ccall((:sampgdk_SendPlayerMessageToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, senderid, message)
    return __ret
end

export SendPlayerMessageToAll
function SendPlayerMessageToAll(senderid::Integer, message::String)::Bool
    __ret = ccall((:sampgdk_SendPlayerMessageToAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), senderid, message)
    return __ret
end

export SendDeathMessage
function SendDeathMessage(killer::Integer, killee::Integer, weapon::Integer)::Bool
    __ret = ccall((:sampgdk_SendDeathMessage, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), killer, killee, weapon)
    return __ret
end

export SendDeathMessageToPlayer
function SendDeathMessageToPlayer(playerid::Integer, killer::Integer, killee::Integer, weapon::Integer)::Bool
    __ret = ccall((:sampgdk_SendDeathMessageToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint), playerid, killer, killee, weapon)
    return __ret
end

export GameTextForAll
function GameTextForAll(text::String, time::Integer, style::Integer)::Bool
    __ret = ccall((:sampgdk_GameTextForAll, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cint, Cint), text, time, style)
    return __ret
end

export GameTextForPlayer
function GameTextForPlayer(playerid::Integer, text::String, time::Integer, style::Integer)::Bool
    __ret = ccall((:sampgdk_GameTextForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint, Cint), playerid, text, time, style)
    return __ret
end

export GetTickCount
function GetTickCount()::Integer
    __ret = ccall((:sampgdk_GetTickCount, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

export GetMaxPlayers
function GetMaxPlayers()::Integer
    __ret = ccall((:sampgdk_GetMaxPlayers, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

export VectorSize
function VectorSize(position::Vector3)::Number
    __ret = ccall((:sampgdk_VectorSize, "./plugins/jules-andreas.so"), Cfloat, (Cfloat, Cfloat, Cfloat), position.x, position.y, position.z)
    return __ret
end

export GetPlayerPoolSize
function GetPlayerPoolSize()::Integer
    __ret = ccall((:sampgdk_GetPlayerPoolSize, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

export GetVehiclePoolSize
function GetVehiclePoolSize()::Integer
    __ret = ccall((:sampgdk_GetVehiclePoolSize, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

export GetActorPoolSize
function GetActorPoolSize()::Integer
    __ret = ccall((:sampgdk_GetActorPoolSize, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

export SHA256_PassHash
function SHA256_PassHash(password::String, salt::String, ret_hash_size::Integer = 64)::String
    __ret_hash_buf = Vector{UInt8}(undef, 1 + ret_hash_size)
    __ret = ccall((:sampgdk_SHA256_PassHash, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cstring, Ptr{UInt8}, Cint), password, salt, __ret_hash_buf, ret_hash_size)
    ret_hash = unsafe_string(pointer(__ret_hash_buf))
    return ret_hash
end

export SetSVarInt
function SetSVarInt(varname::String, int_value::Integer)::Bool
    __ret = ccall((:sampgdk_SetSVarInt, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cint), varname, int_value)
    return __ret
end

export GetSVarInt
function GetSVarInt(varname::String)::Integer
    __ret = ccall((:sampgdk_GetSVarInt, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

export SetSVarString
function SetSVarString(varname::String, string_value::String)::Bool
    __ret = ccall((:sampgdk_SetSVarString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cstring), varname, string_value)
    return __ret
end

export GetSVarString
function GetSVarString(varname::String, string_return_size::Integer = 256)::String
    __string_return_buf = Vector{UInt8}(undef, 1 + string_return_size)
    __ret = ccall((:sampgdk_GetSVarString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Ptr{UInt8}, Cint), varname, __string_return_buf, string_return_size)
    string_return = unsafe_string(pointer(__string_return_buf))
    return string_return
end

export SetSVarFloat
function SetSVarFloat(varname::String, float_value::Number)::Bool
    __ret = ccall((:sampgdk_SetSVarFloat, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cfloat), varname, float_value)
    return __ret
end

export GetSVarFloat
function GetSVarFloat(varname::String)::Number
    __ret = ccall((:sampgdk_GetSVarFloat, "./plugins/jules-andreas.so"), Cfloat, (Cstring,), varname)
    return __ret
end

export DeleteSVar
function DeleteSVar(varname::String)::Bool
    __ret = ccall((:sampgdk_DeleteSVar, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), varname)
    return __ret
end

export GetSVarsUpperIndex
function GetSVarsUpperIndex()::Integer
    __ret = ccall((:sampgdk_GetSVarsUpperIndex, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

export GetSVarNameAtIndex
function GetSVarNameAtIndex(index::Integer, ret_varname_size::Integer = 256)::String
    __ret_varname_buf = Vector{UInt8}(undef, 1 + ret_varname_size)
    __ret = ccall((:sampgdk_GetSVarNameAtIndex, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), index, __ret_varname_buf, ret_varname_size)
    ret_varname = unsafe_string(pointer(__ret_varname_buf))
    return ret_varname
end

export GetSVarType
function GetSVarType(varname::String)::Integer
    __ret = ccall((:sampgdk_GetSVarType, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

export SetGameModeText
function SetGameModeText(text::String)::Bool
    __ret = ccall((:sampgdk_SetGameModeText, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), text)
    return __ret
end

export SetTeamCount
function SetTeamCount(count::Integer)::Bool
    __ret = ccall((:sampgdk_SetTeamCount, "./plugins/jules-andreas.so"), Cuchar, (Cint,), count)
    return __ret
end

export AddPlayerClass
function AddPlayerClass(modelid::Integer, position::Vector3, z_angle::Number, weapon1::Integer, weapon1_ammo::Integer, weapon2::Integer, weapon2_ammo::Integer, weapon3::Integer, weapon3_ammo::Integer)::Integer
    __ret = ccall((:sampgdk_AddPlayerClass, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cint, Cint, Cint), modelid, position.x, position.y, position.z, z_angle, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
    return __ret
end

export AddPlayerClassEx
function AddPlayerClassEx(teamid::Integer, modelid::Integer, position::Vector3, z_angle::Number, weapon1::Integer, weapon1_ammo::Integer, weapon2::Integer, weapon2_ammo::Integer, weapon3::Integer, weapon3_ammo::Integer)::Integer
    __ret = ccall((:sampgdk_AddPlayerClassEx, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cint, Cint, Cint), teamid, modelid, position.x, position.y, position.z, z_angle, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
    return __ret
end

export AddStaticVehicle
function AddStaticVehicle(modelid::Integer, position::Vector3, z_angle::Number, color1::Integer, color2::Integer)::Integer
    __ret = ccall((:sampgdk_AddStaticVehicle, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), modelid, position.x, position.y, position.z, z_angle, color1, color2)
    return __ret
end

export AddStaticVehicleEx
function AddStaticVehicleEx(modelid::Integer, position::Vector3, z_angle::Number, color1::Integer, color2::Integer, respawn_delay::Integer, addsiren::Bool)::Integer
    __ret = ccall((:sampgdk_AddStaticVehicleEx, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cuchar), modelid, position.x, position.y, position.z, z_angle, color1, color2, respawn_delay, addsiren)
    return __ret
end

export AddStaticPickup
function AddStaticPickup(model::Integer, type::Integer, position::Vector3, virtualworld::Integer)::Integer
    __ret = ccall((:sampgdk_AddStaticPickup, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cint), model, type, position.x, position.y, position.z, virtualworld)
    return __ret
end

export CreatePickup
function CreatePickup(model::Integer, type::Integer, position::Vector3, virtualworld::Integer)::Integer
    __ret = ccall((:sampgdk_CreatePickup, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cint), model, type, position.x, position.y, position.z, virtualworld)
    return __ret
end

export DestroyPickup
function DestroyPickup(pickup::Integer)::Bool
    __ret = ccall((:sampgdk_DestroyPickup, "./plugins/jules-andreas.so"), Cuchar, (Cint,), pickup)
    return __ret
end

export ShowNameTags
function ShowNameTags(show::Bool)::Bool
    __ret = ccall((:sampgdk_ShowNameTags, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), show)
    return __ret
end

export ShowPlayerMarkers
function ShowPlayerMarkers(mode::Integer)::Bool
    __ret = ccall((:sampgdk_ShowPlayerMarkers, "./plugins/jules-andreas.so"), Cuchar, (Cint,), mode)
    return __ret
end

export GameModeExit
function GameModeExit()::Bool
    __ret = ccall((:sampgdk_GameModeExit, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

export SetWorldTime
function SetWorldTime(hour::Integer)::Bool
    __ret = ccall((:sampgdk_SetWorldTime, "./plugins/jules-andreas.so"), Cuchar, (Cint,), hour)
    return __ret
end

export GetWeaponName
function GetWeaponName(weaponid::Integer, name_size::Integer = 32)::String
    __name_buf = Vector{UInt8}(undef, 1 + name_size)
    __ret = ccall((:sampgdk_GetWeaponName, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), weaponid, __name_buf, name_size)
    name = unsafe_string(pointer(__name_buf))
    return name
end

export EnableTirePopping
function EnableTirePopping(enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableTirePopping, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), enable)
    return __ret
end

export EnableVehicleFriendlyFire
function EnableVehicleFriendlyFire()::Bool
    __ret = ccall((:sampgdk_EnableVehicleFriendlyFire, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

export AllowInteriorWeapons
function AllowInteriorWeapons(allow::Bool)::Bool
    __ret = ccall((:sampgdk_AllowInteriorWeapons, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), allow)
    return __ret
end

export SetWeather
function SetWeather(weatherid::Integer)::Bool
    __ret = ccall((:sampgdk_SetWeather, "./plugins/jules-andreas.so"), Cuchar, (Cint,), weatherid)
    return __ret
end

export SetGravity
function SetGravity(gravity::Number)::Bool
    __ret = ccall((:sampgdk_SetGravity, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), gravity)
    return __ret
end

export GetGravity
function GetGravity()::Number
    __ret = ccall((:sampgdk_GetGravity, "./plugins/jules-andreas.so"), Cfloat, ())
    return __ret
end

export AllowAdminTeleport
function AllowAdminTeleport(allow::Bool)::Bool
    __ret = ccall((:sampgdk_AllowAdminTeleport, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), allow)
    return __ret
end

export SetDeathDropAmount
function SetDeathDropAmount(amount::Integer)::Bool
    __ret = ccall((:sampgdk_SetDeathDropAmount, "./plugins/jules-andreas.so"), Cuchar, (Cint,), amount)
    return __ret
end

export CreateExplosion
function CreateExplosion(position::Vector3, type::Integer, radius::Number)::Bool
    __ret = ccall((:sampgdk_CreateExplosion, "./plugins/jules-andreas.so"), Cuchar, (Cfloat, Cfloat, Cfloat, Cint, Cfloat), position.x, position.y, position.z, type, radius)
    return __ret
end

export EnableZoneNames
function EnableZoneNames(enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableZoneNames, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), enable)
    return __ret
end

export UsePlayerPedAnims
function UsePlayerPedAnims()::Bool
    __ret = ccall((:sampgdk_UsePlayerPedAnims, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

export DisableInteriorEnterExits
function DisableInteriorEnterExits()::Bool
    __ret = ccall((:sampgdk_DisableInteriorEnterExits, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

export SetNameTagDrawDistance
function SetNameTagDrawDistance(distance::Number)::Bool
    __ret = ccall((:sampgdk_SetNameTagDrawDistance, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), distance)
    return __ret
end

export DisableNameTagLOS
function DisableNameTagLOS()::Bool
    __ret = ccall((:sampgdk_DisableNameTagLOS, "./plugins/jules-andreas.so"), Cuchar, ())
    return __ret
end

export LimitGlobalChatRadius
function LimitGlobalChatRadius(chat_radius::Number)::Bool
    __ret = ccall((:sampgdk_LimitGlobalChatRadius, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), chat_radius)
    return __ret
end

export LimitPlayerMarkerRadius
function LimitPlayerMarkerRadius(marker_radius::Number)::Bool
    __ret = ccall((:sampgdk_LimitPlayerMarkerRadius, "./plugins/jules-andreas.so"), Cuchar, (Cfloat,), marker_radius)
    return __ret
end

export ConnectNPC
function ConnectNPC(name::String, script::String)::Bool
    __ret = ccall((:sampgdk_ConnectNPC, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cstring), name, script)
    return __ret
end

export IsPlayerNPC
function IsPlayerNPC(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerNPC, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export IsPlayerAdmin
function IsPlayerAdmin(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerAdmin, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export Kick
function Kick(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_Kick, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export Ban
function Ban(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_Ban, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export BanEx
function BanEx(playerid::Integer, reason::String)::Bool
    __ret = ccall((:sampgdk_BanEx, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, reason)
    return __ret
end

export SendRconCommand
function SendRconCommand(command::String)::Bool
    __ret = ccall((:sampgdk_SendRconCommand, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), command)
    return __ret
end

export GetPlayerNetworkStats
function GetPlayerNetworkStats(playerid::Integer, retstr_size::Integer = 400)::String
    __retstr_buf = Vector{UInt8}(undef, 1 + retstr_size)
    __ret = ccall((:sampgdk_GetPlayerNetworkStats, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __retstr_buf, retstr_size)
    retstr = unsafe_string(pointer(__retstr_buf))
    return retstr
end

export GetNetworkStats
function GetNetworkStats(retstr_size::Integer = 400)::String
    __retstr_buf = Vector{UInt8}(undef, 1 + retstr_size)
    __ret = ccall((:sampgdk_GetNetworkStats, "./plugins/jules-andreas.so"), Cuchar, (Ptr{UInt8}, Cint), __retstr_buf, retstr_size)
    retstr = unsafe_string(pointer(__retstr_buf))
    return retstr
end

export GetPlayerVersion
function GetPlayerVersion(playerid::Integer, version_size::Integer = 24)::String
    __version_buf = Vector{UInt8}(undef, 1 + version_size)
    __ret = ccall((:sampgdk_GetPlayerVersion, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __version_buf, version_size)
    version = unsafe_string(pointer(__version_buf))
    return version
end

export BlockIpAddress
function BlockIpAddress(ip_address::String, timems::Integer)::Bool
    __ret = ccall((:sampgdk_BlockIpAddress, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Cint), ip_address, timems)
    return __ret
end

export UnBlockIpAddress
function UnBlockIpAddress(ip_address::String)::Bool
    __ret = ccall((:sampgdk_UnBlockIpAddress, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), ip_address)
    return __ret
end

export GetServerVarAsString
function GetServerVarAsString(varname::String, value_size::Integer = 256)::String
    __value_buf = Vector{UInt8}(undef, 1 + value_size)
    __ret = ccall((:sampgdk_GetServerVarAsString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Ptr{UInt8}, Cint), varname, __value_buf, value_size)
    value = unsafe_string(pointer(__value_buf))
    return value
end

export GetServerVarAsInt
function GetServerVarAsInt(varname::String)::Integer
    __ret = ccall((:sampgdk_GetServerVarAsInt, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

export GetServerVarAsBool
function GetServerVarAsBool(varname::String)::Bool
    __ret = ccall((:sampgdk_GetServerVarAsBool, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), varname)
    return __ret
end

export GetConsoleVarAsString
function GetConsoleVarAsString(varname::String, buffer_size::Integer = 256)::String
    __buffer_buf = Vector{UInt8}(undef, 1 + buffer_size)
    __ret = ccall((:sampgdk_GetConsoleVarAsString, "./plugins/jules-andreas.so"), Cuchar, (Cstring, Ptr{UInt8}, Cint), varname, __buffer_buf, buffer_size)
    buffer = unsafe_string(pointer(__buffer_buf))
    return buffer
end

export GetConsoleVarAsInt
function GetConsoleVarAsInt(varname::String)::Integer
    __ret = ccall((:sampgdk_GetConsoleVarAsInt, "./plugins/jules-andreas.so"), Cint, (Cstring,), varname)
    return __ret
end

export GetConsoleVarAsBool
function GetConsoleVarAsBool(varname::String)::Bool
    __ret = ccall((:sampgdk_GetConsoleVarAsBool, "./plugins/jules-andreas.so"), Cuchar, (Cstring,), varname)
    return __ret
end

export GetServerTickRate
function GetServerTickRate()::Integer
    __ret = ccall((:sampgdk_GetServerTickRate, "./plugins/jules-andreas.so"), Cint, ())
    return __ret
end

export NetStats_GetConnectedTime
function NetStats_GetConnectedTime(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_NetStats_GetConnectedTime, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export NetStats_MessagesReceived
function NetStats_MessagesReceived(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_NetStats_MessagesReceived, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export NetStats_BytesReceived
function NetStats_BytesReceived(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_NetStats_BytesReceived, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export NetStats_MessagesSent
function NetStats_MessagesSent(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_NetStats_MessagesSent, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export NetStats_BytesSent
function NetStats_BytesSent(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_NetStats_BytesSent, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export NetStats_MessagesRecvPerSecond
function NetStats_MessagesRecvPerSecond(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_NetStats_MessagesRecvPerSecond, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export NetStats_PacketLossPercent
function NetStats_PacketLossPercent(playerid::Integer)::Number
    __ret = ccall((:sampgdk_NetStats_PacketLossPercent, "./plugins/jules-andreas.so"), Cfloat, (Cint,), playerid)
    return __ret
end

export NetStats_ConnectionStatus
function NetStats_ConnectionStatus(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_NetStats_ConnectionStatus, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export NetStats_GetIpPort
function NetStats_GetIpPort(playerid::Integer, ip_port_size::Integer = 22)::String
    __ip_port_buf = Vector{UInt8}(undef, 1 + ip_port_size)
    __ret = ccall((:sampgdk_NetStats_GetIpPort, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __ip_port_buf, ip_port_size)
    ip_port = unsafe_string(pointer(__ip_port_buf))
    return ip_port
end

export CreateMenu
function CreateMenu(title::String, columns::Integer, position::Vector2, col1width::Number, col2width::Number)::Integer
    __ret = ccall((:sampgdk_CreateMenu, "./plugins/jules-andreas.so"), Cint, (Cstring, Cint, Cfloat, Cfloat, Cfloat, Cfloat), title, columns, position.x, position.y, col1width, col2width)
    return __ret
end

export DestroyMenu
function DestroyMenu(menuid::Integer)::Bool
    __ret = ccall((:sampgdk_DestroyMenu, "./plugins/jules-andreas.so"), Cuchar, (Cint,), menuid)
    return __ret
end

export AddMenuItem
function AddMenuItem(menuid::Integer, column::Integer, menutext::String)::Integer
    __ret = ccall((:sampgdk_AddMenuItem, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cstring), menuid, column, menutext)
    return __ret
end

export SetMenuColumnHeader
function SetMenuColumnHeader(menuid::Integer, column::Integer, columnheader::String)::Bool
    __ret = ccall((:sampgdk_SetMenuColumnHeader, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), menuid, column, columnheader)
    return __ret
end

export ShowMenuForPlayer
function ShowMenuForPlayer(menuid::Integer, playerid::Integer)::Bool
    __ret = ccall((:sampgdk_ShowMenuForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), menuid, playerid)
    return __ret
end

export HideMenuForPlayer
function HideMenuForPlayer(menuid::Integer, playerid::Integer)::Bool
    __ret = ccall((:sampgdk_HideMenuForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), menuid, playerid)
    return __ret
end

export IsValidMenu
function IsValidMenu(menuid::Integer)::Bool
    __ret = ccall((:sampgdk_IsValidMenu, "./plugins/jules-andreas.so"), Cuchar, (Cint,), menuid)
    return __ret
end

export DisableMenu
function DisableMenu(menuid::Integer)::Bool
    __ret = ccall((:sampgdk_DisableMenu, "./plugins/jules-andreas.so"), Cuchar, (Cint,), menuid)
    return __ret
end

export DisableMenuRow
function DisableMenuRow(menuid::Integer, row::Integer)::Bool
    __ret = ccall((:sampgdk_DisableMenuRow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), menuid, row)
    return __ret
end

export GetPlayerMenu
function GetPlayerMenu(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerMenu, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export TextDrawCreate
function TextDrawCreate(position::Vector2, text::String)::Integer
    __ret = ccall((:sampgdk_TextDrawCreate, "./plugins/jules-andreas.so"), Cint, (Cfloat, Cfloat, Cstring), position.x, position.y, text)
    return __ret
end

export TextDrawDestroy
function TextDrawDestroy(text::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawDestroy, "./plugins/jules-andreas.so"), Cuchar, (Cint,), text)
    return __ret
end

export TextDrawLetterSize
function TextDrawLetterSize(text::Integer, position::Vector2)::Bool
    __ret = ccall((:sampgdk_TextDrawLetterSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat), text, position.x, position.y)
    return __ret
end

export TextDrawTextSize
function TextDrawTextSize(text::Integer, position::Vector2)::Bool
    __ret = ccall((:sampgdk_TextDrawTextSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat), text, position.x, position.y)
    return __ret
end

export TextDrawAlignment
function TextDrawAlignment(text::Integer, alignment::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawAlignment, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, alignment)
    return __ret
end

export TextDrawColor
function TextDrawColor(text::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, color)
    return __ret
end

export TextDrawUseBox
function TextDrawUseBox(text::Integer, use::Bool)::Bool
    __ret = ccall((:sampgdk_TextDrawUseBox, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), text, use)
    return __ret
end

export TextDrawBoxColor
function TextDrawBoxColor(text::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawBoxColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, color)
    return __ret
end

export TextDrawSetShadow
function TextDrawSetShadow(text::Integer, size::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawSetShadow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, size)
    return __ret
end

export TextDrawSetOutline
function TextDrawSetOutline(text::Integer, size::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawSetOutline, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, size)
    return __ret
end

export TextDrawBackgroundColor
function TextDrawBackgroundColor(text::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawBackgroundColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, color)
    return __ret
end

export TextDrawFont
function TextDrawFont(text::Integer, font::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawFont, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, font)
    return __ret
end

export TextDrawSetProportional
function TextDrawSetProportional(text::Integer, set::Bool)::Bool
    __ret = ccall((:sampgdk_TextDrawSetProportional, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), text, set)
    return __ret
end

export TextDrawSetSelectable
function TextDrawSetSelectable(text::Integer, set::Bool)::Bool
    __ret = ccall((:sampgdk_TextDrawSetSelectable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), text, set)
    return __ret
end

export TextDrawShowForPlayer
function TextDrawShowForPlayer(playerid::Integer, text::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawShowForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

export TextDrawHideForPlayer
function TextDrawHideForPlayer(playerid::Integer, text::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawHideForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

export TextDrawShowForAll
function TextDrawShowForAll(text::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawShowForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), text)
    return __ret
end

export TextDrawHideForAll
function TextDrawHideForAll(text::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawHideForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), text)
    return __ret
end

export TextDrawSetString
function TextDrawSetString(text::Integer, string::String)::Bool
    __ret = ccall((:sampgdk_TextDrawSetString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), text, string)
    return __ret
end

export TextDrawSetPreviewModel
function TextDrawSetPreviewModel(text::Integer, modelindex::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawSetPreviewModel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), text, modelindex)
    return __ret
end

export TextDrawSetPreviewRot
function TextDrawSetPreviewRot(text::Integer, rotation::Vector3, fZoom::Number)::Bool
    __ret = ccall((:sampgdk_TextDrawSetPreviewRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), text, rotation.x, rotation.y, rotation.z, fZoom)
    return __ret
end

export TextDrawSetPreviewVehCol
function TextDrawSetPreviewVehCol(text::Integer, color1::Integer, color2::Integer)::Bool
    __ret = ccall((:sampgdk_TextDrawSetPreviewVehCol, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), text, color1, color2)
    return __ret
end

export SelectTextDraw
function SelectTextDraw(playerid::Integer, hovercolor::Integer)::Bool
    __ret = ccall((:sampgdk_SelectTextDraw, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, hovercolor)
    return __ret
end

export CancelSelectTextDraw
function CancelSelectTextDraw(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_CancelSelectTextDraw, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export GangZoneCreate
function GangZoneCreate(minx::Number, miny::Number, maxx::Number, maxy::Number)::Integer
    __ret = ccall((:sampgdk_GangZoneCreate, "./plugins/jules-andreas.so"), Cint, (Cfloat, Cfloat, Cfloat, Cfloat), minx, miny, maxx, maxy)
    return __ret
end

export GangZoneDestroy
function GangZoneDestroy(zone::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneDestroy, "./plugins/jules-andreas.so"), Cuchar, (Cint,), zone)
    return __ret
end

export GangZoneShowForPlayer
function GangZoneShowForPlayer(playerid::Integer, zone::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneShowForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, zone, color)
    return __ret
end

export GangZoneShowForAll
function GangZoneShowForAll(zone::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneShowForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), zone, color)
    return __ret
end

export GangZoneHideForPlayer
function GangZoneHideForPlayer(playerid::Integer, zone::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneHideForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, zone)
    return __ret
end

export GangZoneHideForAll
function GangZoneHideForAll(zone::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneHideForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), zone)
    return __ret
end

export GangZoneFlashForPlayer
function GangZoneFlashForPlayer(playerid::Integer, zone::Integer, flashcolor::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneFlashForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, zone, flashcolor)
    return __ret
end

export GangZoneFlashForAll
function GangZoneFlashForAll(zone::Integer, flashcolor::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneFlashForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), zone, flashcolor)
    return __ret
end

export GangZoneStopFlashForPlayer
function GangZoneStopFlashForPlayer(playerid::Integer, zone::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneStopFlashForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, zone)
    return __ret
end

export GangZoneStopFlashForAll
function GangZoneStopFlashForAll(zone::Integer)::Bool
    __ret = ccall((:sampgdk_GangZoneStopFlashForAll, "./plugins/jules-andreas.so"), Cuchar, (Cint,), zone)
    return __ret
end

export Create3DTextLabel
function Create3DTextLabel(text::String, color::Integer, position::Vector3, DrawDistance::Number, virtualworld::Integer, testLOS::Bool)::Integer
    __ret = ccall((:sampgdk_Create3DTextLabel, "./plugins/jules-andreas.so"), Cint, (Cstring, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cuchar), text, color, position.x, position.y, position.z, DrawDistance, virtualworld, testLOS)
    return __ret
end

export Delete3DTextLabel
function Delete3DTextLabel(id::Integer)::Bool
    __ret = ccall((:sampgdk_Delete3DTextLabel, "./plugins/jules-andreas.so"), Cuchar, (Cint,), id)
    return __ret
end

export Attach3DTextLabelToPlayer
function Attach3DTextLabelToPlayer(id::Integer, playerid::Integer, OffsetX::Number, OffsetY::Number, OffsetZ::Number)::Bool
    __ret = ccall((:sampgdk_Attach3DTextLabelToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), id, playerid, OffsetX, OffsetY, OffsetZ)
    return __ret
end

export Attach3DTextLabelToVehicle
function Attach3DTextLabelToVehicle(id::Integer, vehicleid::Integer, OffsetX::Number, OffsetY::Number, OffsetZ::Number)::Bool
    __ret = ccall((:sampgdk_Attach3DTextLabelToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), id, vehicleid, OffsetX, OffsetY, OffsetZ)
    return __ret
end

export Update3DTextLabelText
function Update3DTextLabelText(id::Integer, color::Integer, text::String)::Bool
    __ret = ccall((:sampgdk_Update3DTextLabelText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), id, color, text)
    return __ret
end

export CreatePlayer3DTextLabel
function CreatePlayer3DTextLabel(playerid::Integer, text::String, color::Integer, position::Vector3, DrawDistance::Number, attachedplayer::Integer, attachedvehicle::Integer, testLOS::Bool)::Integer
    __ret = ccall((:sampgdk_CreatePlayer3DTextLabel, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cuchar), playerid, text, color, position.x, position.y, position.z, DrawDistance, attachedplayer, attachedvehicle, testLOS)
    return __ret
end

export DeletePlayer3DTextLabel
function DeletePlayer3DTextLabel(playerid::Integer, id::Integer)::Bool
    __ret = ccall((:sampgdk_DeletePlayer3DTextLabel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, id)
    return __ret
end

export UpdatePlayer3DTextLabelText
function UpdatePlayer3DTextLabelText(playerid::Integer, id::Integer, color::Integer, text::String)::Bool
    __ret = ccall((:sampgdk_UpdatePlayer3DTextLabelText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cstring), playerid, id, color, text)
    return __ret
end

export ShowPlayerDialog
function ShowPlayerDialog(playerid::Integer, dialogid::Integer, style::Integer, caption::String, info::String, button1::String, button2::String)::Bool
    __ret = ccall((:sampgdk_ShowPlayerDialog, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cstring, Cstring, Cstring, Cstring), playerid, dialogid, style, caption, info, button1, button2)
    return __ret
end

export KillTimer
function KillTimer(timerid::Integer)::Bool
    __ret = ccall((:sampgdk_KillTimer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), timerid)
    return __ret
end

export gpci
function gpci(playerid::Integer, buffer_size::Integer = 40)::String
    __buffer_buf = Vector{UInt8}(undef, 1 + buffer_size)
    __ret = ccall((:sampgdk_gpci, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __buffer_buf, buffer_size)
    buffer = unsafe_string(pointer(__buffer_buf))
    return buffer
end

export AddCharModel
function AddCharModel(baseid::Integer, newid::Integer, dffname::String, txdname::String)::Integer
    __ret = ccall((:sampgdk_AddCharModel, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cstring, Cstring), baseid, newid, dffname, txdname)
    return __ret
end

export AddSimpleModel
function AddSimpleModel(virtualworld::Integer, baseid::Integer, newid::Integer, dffname::String, txdname::String)::Integer
    __ret = ccall((:sampgdk_AddSimpleModel, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cint, Cstring, Cstring), virtualworld, baseid, newid, dffname, txdname)
    return __ret
end

export AddSimpleModelTimed
function AddSimpleModelTimed(virtualworld::Integer, baseid::Integer, newid::Integer, dffname::String, txdname::String, timeon::Integer, timeoff::Integer)::Integer
    __ret = ccall((:sampgdk_AddSimpleModelTimed, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cint, Cstring, Cstring, Cint, Cint), virtualworld, baseid, newid, dffname, txdname, timeon, timeoff)
    return __ret
end

export FindModelFileNameFromCRC
function FindModelFileNameFromCRC(crc::Integer, model_str_size::Integer = 256)::String
    __model_str_buf = Vector{UInt8}(undef, 1 + model_str_size)
    __ret = ccall((:sampgdk_FindModelFileNameFromCRC, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), crc, __model_str_buf, model_str_size)
    model_str = unsafe_string(pointer(__model_str_buf))
    return model_str
end

export FindTextureFileNameFromCRC
function FindTextureFileNameFromCRC(crc::Integer, texture_str_size::Integer = 256)::String
    __texture_str_buf = Vector{UInt8}(undef, 1 + texture_str_size)
    __ret = ccall((:sampgdk_FindTextureFileNameFromCRC, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), crc, __texture_str_buf, texture_str_size)
    texture_str = unsafe_string(pointer(__texture_str_buf))
    return texture_str
end

export RedirectDownload
function RedirectDownload(playerid::Integer, url::String)::Bool
    __ret = ccall((:sampgdk_RedirectDownload, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, url)
    return __ret
end

export HTTP
function HTTP(index::Integer, type::Integer, url::String, data::String)::Bool
    __ret = ccall((:sampgdk_HTTP, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring, Cstring), index, type, url, data)
    return __ret
end

export CreateObject
function CreateObject(modelid::Integer, position::Vector3, rX::Number, rY::Number, rZ::Number, DrawDistance::Number)::Integer
    __ret = ccall((:sampgdk_CreateObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), modelid, position.x, position.y, position.z, rX, rY, rZ, DrawDistance)
    return __ret
end

export AttachObjectToVehicle
function AttachObjectToVehicle(objectid::Integer, vehicleid::Integer, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachObjectToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectid, vehicleid, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ)
    return __ret
end

export AttachObjectToObject
function AttachObjectToObject(objectid::Integer, attachtoid::Integer, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number, SyncRotation::Bool)::Bool
    __ret = ccall((:sampgdk_AttachObjectToObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cuchar), objectid, attachtoid, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ, SyncRotation)
    return __ret
end

export AttachObjectToPlayer
function AttachObjectToPlayer(objectid::Integer, playerid::Integer, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachObjectToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectid, playerid, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ)
    return __ret
end

export SetObjectPos
function SetObjectPos(objectid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), objectid, position.x, position.y, position.z)
    return __ret
end

export GetObjectPos
function GetObjectPos(objectid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), objectid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export SetObjectRot
function SetObjectRot(objectid::Integer, rotation::Vector3)::Bool
    __ret = ccall((:sampgdk_SetObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), objectid, rotation.x, rotation.y, rotation.z)
    return __ret
end

export GetObjectRot
function GetObjectRot(objectid::Integer)::Vector3
    rotX_ref = Ref{Float32}(0)
    rotY_ref = Ref{Float32}(0)
    rotZ_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), objectid, rotX_ref, rotY_ref, rotZ_ref)
    rotX = rotX_ref[]
    rotY = rotY_ref[]
    rotZ = rotZ_ref[]
    return Vector3(rotX, rotY, rotZ)
end

export GetObjectModel
function GetObjectModel(objectid::Integer)::Integer
    __ret = ccall((:sampgdk_GetObjectModel, "./plugins/jules-andreas.so"), Cint, (Cint,), objectid)
    return __ret
end

export SetObjectNoCameraCol
function SetObjectNoCameraCol(objectid::Integer)::Bool
    __ret = ccall((:sampgdk_SetObjectNoCameraCol, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

export IsValidObject
function IsValidObject(objectid::Integer)::Bool
    __ret = ccall((:sampgdk_IsValidObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

export DestroyObject
function DestroyObject(objectid::Integer)::Bool
    __ret = ccall((:sampgdk_DestroyObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

export MoveObject
function MoveObject(objectid::Integer, position::Vector3, Speed::Number, RotX::Number, RotY::Number, RotZ::Number)::Integer
    __ret = ccall((:sampgdk_MoveObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectid, position.x, position.y, position.z, Speed, RotX, RotY, RotZ)
    return __ret
end

export StopObject
function StopObject(objectid::Integer)::Bool
    __ret = ccall((:sampgdk_StopObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

export IsObjectMoving
function IsObjectMoving(objectid::Integer)::Bool
    __ret = ccall((:sampgdk_IsObjectMoving, "./plugins/jules-andreas.so"), Cuchar, (Cint,), objectid)
    return __ret
end

export EditObject
function EditObject(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_EditObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export EditPlayerObject
function EditPlayerObject(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_EditPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export SelectObject
function SelectObject(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_SelectObject, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export CancelEdit
function CancelEdit(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_CancelEdit, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export CreatePlayerObject
function CreatePlayerObject(playerid::Integer, modelid::Integer, position::Vector3, rX::Number, rY::Number, rZ::Number, DrawDistance::Number)::Integer
    __ret = ccall((:sampgdk_CreatePlayerObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, modelid, position.x, position.y, position.z, rX, rY, rZ, DrawDistance)
    return __ret
end

export AttachPlayerObjectToPlayer
function AttachPlayerObjectToPlayer(objectplayer::Integer, objectid::Integer, attachplayer::Integer, OffsetX::Number, OffsetY::Number, OffsetZ::Number, rX::Number, rY::Number, rZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachPlayerObjectToPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), objectplayer, objectid, attachplayer, OffsetX, OffsetY, OffsetZ, rX, rY, rZ)
    return __ret
end

export AttachPlayerObjectToVehicle
function AttachPlayerObjectToVehicle(playerid::Integer, objectid::Integer, vehicleid::Integer, offset::Vector3, fRotX::Number, fRotY::Number, RotZ::Number)::Bool
    __ret = ccall((:sampgdk_AttachPlayerObjectToVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, objectid, vehicleid, offset.x, offset.y, offset.z, fRotX, fRotY, RotZ)
    return __ret
end

export SetPlayerObjectPos
function SetPlayerObjectPos(playerid::Integer, objectid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), playerid, objectid, position.x, position.y, position.z)
    return __ret
end

export GetPlayerObjectPos
function GetPlayerObjectPos(playerid::Integer, objectid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerObjectPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, objectid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export SetPlayerObjectRot
function SetPlayerObjectRot(playerid::Integer, objectid::Integer, rotation::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), playerid, objectid, rotation.x, rotation.y, rotation.z)
    return __ret
end

export GetPlayerObjectRot
function GetPlayerObjectRot(playerid::Integer, objectid::Integer)::Vector3
    rotX_ref = Ref{Float32}(0)
    rotY_ref = Ref{Float32}(0)
    rotZ_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerObjectRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, objectid, rotX_ref, rotY_ref, rotZ_ref)
    rotX = rotX_ref[]
    rotY = rotY_ref[]
    rotZ = rotZ_ref[]
    return Vector3(rotX, rotY, rotZ)
end

export GetPlayerObjectModel
function GetPlayerObjectModel(playerid::Integer, objectid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerObjectModel, "./plugins/jules-andreas.so"), Cint, (Cint, Cint), playerid, objectid)
    return __ret
end

export SetPlayerObjectNoCameraCol
function SetPlayerObjectNoCameraCol(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectNoCameraCol, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export IsValidPlayerObject
function IsValidPlayerObject(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_IsValidPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export DestroyPlayerObject
function DestroyPlayerObject(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_DestroyPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export MovePlayerObject
function MovePlayerObject(playerid::Integer, objectid::Integer, position::Vector3, Speed::Number, RotX::Number, RotY::Number, RotZ::Number)::Integer
    __ret = ccall((:sampgdk_MovePlayerObject, "./plugins/jules-andreas.so"), Cint, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, objectid, position.x, position.y, position.z, Speed, RotX, RotY, RotZ)
    return __ret
end

export StopPlayerObject
function StopPlayerObject(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_StopPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export IsPlayerObjectMoving
function IsPlayerObjectMoving(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerObjectMoving, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export SetObjectMaterial
function SetObjectMaterial(objectid::Integer, materialindex::Integer, modelid::Integer, txdname::String, texturename::String, materialcolor::Integer)::Bool
    __ret = ccall((:sampgdk_SetObjectMaterial, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cstring, Cstring, Cint), objectid, materialindex, modelid, txdname, texturename, materialcolor)
    return __ret
end

export SetPlayerObjectMaterial
function SetPlayerObjectMaterial(playerid::Integer, objectid::Integer, materialindex::Integer, modelid::Integer, txdname::String, texturename::String, materialcolor::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectMaterial, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cstring, Cstring, Cint), playerid, objectid, materialindex, modelid, txdname, texturename, materialcolor)
    return __ret
end

export SetObjectMaterialText
function SetObjectMaterialText(objectid::Integer, text::String, materialindex::Integer, materialsize::Integer, fontface::String, fontsize::Integer, bold::Bool, fontcolor::Integer, backcolor::Integer, textalignment::Integer)::Bool
    __ret = ccall((:sampgdk_SetObjectMaterialText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint, Cint, Cstring, Cint, Cuchar, Cint, Cint, Cint), objectid, text, materialindex, materialsize, fontface, fontsize, bold, fontcolor, backcolor, textalignment)
    return __ret
end

export SetPlayerObjectMaterialText
function SetPlayerObjectMaterialText(playerid::Integer, objectid::Integer, text::String, materialindex::Integer, materialsize::Integer, fontface::String, fontsize::Integer, bold::Bool, fontcolor::Integer, backcolor::Integer, textalignment::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerObjectMaterialText, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring, Cint, Cint, Cstring, Cint, Cuchar, Cint, Cint, Cint), playerid, objectid, text, materialindex, materialsize, fontface, fontsize, bold, fontcolor, backcolor, textalignment)
    return __ret
end

export SetObjectsDefaultCameraCol
function SetObjectsDefaultCameraCol(disable::Bool)::Bool
    __ret = ccall((:sampgdk_SetObjectsDefaultCameraCol, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), disable)
    return __ret
end

export SetSpawnInfo
function SetSpawnInfo(playerid::Integer, team::Integer, skin::Integer, position::Vector3, rotation::Number, weapon1::Integer, weapon1_ammo::Integer, weapon2::Integer, weapon2_ammo::Integer, weapon3::Integer, weapon3_ammo::Integer)::Bool
    __ret = ccall((:sampgdk_SetSpawnInfo, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint, Cint, Cint, Cint), playerid, team, skin, position.x, position.y, position.z, rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
    return __ret
end

export SpawnPlayer
function SpawnPlayer(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_SpawnPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerPos
function SetPlayerPos(playerid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

export SetPlayerPosFindZ
function SetPlayerPosFindZ(playerid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerPosFindZ, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

export GetPlayerPos
function GetPlayerPos(playerid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export SetPlayerFacingAngle
function SetPlayerFacingAngle(playerid::Integer, angle::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), playerid, angle)
    return __ret
end

export GetPlayerFacingAngle
function GetPlayerFacingAngle(playerid::Integer)::Number
    angle_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerFacingAngle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), playerid, angle_ref)
    angle = angle_ref[]
    return angle
end

export IsPlayerInRangeOfPoint
function IsPlayerInRangeOfPoint(playerid::Integer, range::Number, position::Vector3)::Bool
    __ret = ccall((:sampgdk_IsPlayerInRangeOfPoint, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, range, position.x, position.y, position.z)
    return __ret
end

export GetPlayerDistanceFromPoint
function GetPlayerDistanceFromPoint(playerid::Integer, position::Vector3)::Number
    __ret = ccall((:sampgdk_GetPlayerDistanceFromPoint, "./plugins/jules-andreas.so"), Cfloat, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

export IsPlayerStreamedIn
function IsPlayerStreamedIn(playerid::Integer, forplayerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerStreamedIn, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, forplayerid)
    return __ret
end

export SetPlayerInterior
function SetPlayerInterior(playerid::Integer, interiorid::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerInterior, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, interiorid)
    return __ret
end

export GetPlayerInterior
function GetPlayerInterior(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerInterior, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerHealth
function SetPlayerHealth(playerid::Integer, health::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), playerid, health)
    return __ret
end

export GetPlayerHealth
function GetPlayerHealth(playerid::Integer)::Number
    health_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerHealth, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), playerid, health_ref)
    health = health_ref[]
    return health
end

export SetPlayerArmour
function SetPlayerArmour(playerid::Integer, armour::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerArmour, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat), playerid, armour)
    return __ret
end

export GetPlayerArmour
function GetPlayerArmour(playerid::Integer)::Number
    armour_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerArmour, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}), playerid, armour_ref)
    armour = armour_ref[]
    return armour
end

export SetPlayerAmmo
function SetPlayerAmmo(playerid::Integer, weaponid::Integer, ammo::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerAmmo, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, weaponid, ammo)
    return __ret
end

export GetPlayerAmmo
function GetPlayerAmmo(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerAmmo, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerWeaponState
function GetPlayerWeaponState(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerWeaponState, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerTargetPlayer
function GetPlayerTargetPlayer(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerTargetPlayer, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerTargetActor
function GetPlayerTargetActor(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerTargetActor, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerTeam
function SetPlayerTeam(playerid::Integer, teamid::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerTeam, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, teamid)
    return __ret
end

export GetPlayerTeam
function GetPlayerTeam(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerTeam, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerScore
function SetPlayerScore(playerid::Integer, score::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerScore, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, score)
    return __ret
end

export GetPlayerScore
function GetPlayerScore(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerScore, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerDrunkLevel
function GetPlayerDrunkLevel(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerDrunkLevel, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerDrunkLevel
function SetPlayerDrunkLevel(playerid::Integer, level::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerDrunkLevel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, level)
    return __ret
end

export SetPlayerColor
function SetPlayerColor(playerid::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, color)
    return __ret
end

export GetPlayerColor
function GetPlayerColor(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerColor, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerSkin
function SetPlayerSkin(playerid::Integer, skinid::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerSkin, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, skinid)
    return __ret
end

export GetPlayerSkin
function GetPlayerSkin(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerSkin, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GivePlayerWeapon
function GivePlayerWeapon(playerid::Integer, weaponid::Integer, ammo::Integer)::Bool
    __ret = ccall((:sampgdk_GivePlayerWeapon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, weaponid, ammo)
    return __ret
end

export ResetPlayerWeapons
function ResetPlayerWeapons(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_ResetPlayerWeapons, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerArmedWeapon
function SetPlayerArmedWeapon(playerid::Integer, weaponid::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerArmedWeapon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, weaponid)
    return __ret
end

export GetPlayerWeaponData
function GetPlayerWeaponData(playerid::Integer, slot::Integer)::PlayerWeaponData
    weapon_ref = Ref{Integer}(0)
    ammo_ref = Ref{Integer}(0)
    __ret = ccall((:sampgdk_GetPlayerWeaponData, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ref{Cint}, Ref{Cint}), playerid, slot, weapon_ref, ammo_ref)
    weapon = weapon_ref[]
    ammo = ammo_ref[]
    return PlayerWeaponData(weapon, ammo)
end

export GivePlayerMoney
function GivePlayerMoney(playerid::Integer, money::Integer)::Bool
    __ret = ccall((:sampgdk_GivePlayerMoney, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, money)
    return __ret
end

export ResetPlayerMoney
function ResetPlayerMoney(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_ResetPlayerMoney, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerName
function SetPlayerName(playerid::Integer, name::String)::Integer
    __ret = ccall((:sampgdk_SetPlayerName, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring), playerid, name)
    return __ret
end

export GetPlayerMoney
function GetPlayerMoney(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerMoney, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerState
function GetPlayerState(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerState, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerIp
function GetPlayerIp(playerid::Integer, ip_size::Integer = 15)::String
    __ip_buf = Vector{UInt8}(undef, 1 + ip_size)
    __ret = ccall((:sampgdk_GetPlayerIp, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint), playerid, __ip_buf, ip_size)
    ip = unsafe_string(pointer(__ip_buf))
    return ip
end

export GetPlayerPing
function GetPlayerPing(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerPing, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerWeapon
function GetPlayerWeapon(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerWeapon, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerKeys
function GetPlayerKeys(playerid::Integer)::PlayerKeys
    keys_ref = Ref{Integer}(0)
    updown_ref = Ref{Integer}(0)
    leftright_ref = Ref{Integer}(0)
    __ret = ccall((:sampgdk_GetPlayerKeys, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}), playerid, keys_ref, updown_ref, leftright_ref)
    keys = keys_ref[]
    updown = updown_ref[]
    leftright = leftright_ref[]
    return PlayerKeys(keys, updown, leftright)
end

export GetPlayerName
function GetPlayerName(playerid::Integer, name_size::Integer = 32)::String
    __name_buf = Vector{UInt8}(undef, 1 + name_size)
    __ret = ccall((:sampgdk_GetPlayerName, "./plugins/jules-andreas.so"), Cint, (Cint, Ptr{UInt8}, Cint), playerid, __name_buf, name_size)
    name = unsafe_string(pointer(__name_buf))
    return name
end

export SetPlayerTime
function SetPlayerTime(playerid::Integer, playerTime::PlayerTime)::Bool
    __ret = ccall((:sampgdk_SetPlayerTime, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, playerTime.hour, playerTime.minute)
    return __ret
end

export GetPlayerTime
function GetPlayerTime(playerid::Integer)::PlayerTime
    hour_ref = Ref{Integer}(0)
    minute_ref = Ref{Integer}(0)
    __ret = ccall((:sampgdk_GetPlayerTime, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cint}, Ref{Cint}), playerid, hour_ref, minute_ref)
    hour = hour_ref[]
    minute = minute_ref[]
    return PlayerTime(hour, minute)
end

export TogglePlayerClock
function TogglePlayerClock(playerid::Integer, toggle::Bool)::Bool
    __ret = ccall((:sampgdk_TogglePlayerClock, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, toggle)
    return __ret
end

export SetPlayerWeather
function SetPlayerWeather(playerid::Integer, weather::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerWeather, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, weather)
    return __ret
end

export ForceClassSelection
function ForceClassSelection(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_ForceClassSelection, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerWantedLevel
function SetPlayerWantedLevel(playerid::Integer, level::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerWantedLevel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, level)
    return __ret
end

export GetPlayerWantedLevel
function GetPlayerWantedLevel(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerWantedLevel, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerFightingStyle
function SetPlayerFightingStyle(playerid::Integer, style::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerFightingStyle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, style)
    return __ret
end

export GetPlayerFightingStyle
function GetPlayerFightingStyle(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerFightingStyle, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerVelocity
function SetPlayerVelocity(playerid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

export GetPlayerVelocity
function GetPlayerVelocity(playerid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerVelocity, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export PlayCrimeReportForPlayer
function PlayCrimeReportForPlayer(playerid::Integer, suspectid::Integer, crime::Integer)::Bool
    __ret = ccall((:sampgdk_PlayCrimeReportForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, suspectid, crime)
    return __ret
end

export PlayAudioStreamForPlayer
function PlayAudioStreamForPlayer(playerid::Integer, url::String, posX::Number, posY::Number, posZ::Number, distance::Number, usepos::Bool)::Bool
    __ret = ccall((:sampgdk_PlayAudioStreamForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cfloat, Cfloat, Cfloat, Cfloat, Cuchar), playerid, url, posX, posY, posZ, distance, usepos)
    return __ret
end

export StopAudioStreamForPlayer
function StopAudioStreamForPlayer(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_StopAudioStreamForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerShopName
function SetPlayerShopName(playerid::Integer, shopname::String)::Bool
    __ret = ccall((:sampgdk_SetPlayerShopName, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, shopname)
    return __ret
end

export SetPlayerSkillLevel
function SetPlayerSkillLevel(playerid::Integer, skill::Integer, level::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerSkillLevel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, skill, level)
    return __ret
end

export GetPlayerSurfingVehicleID
function GetPlayerSurfingVehicleID(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerSurfingVehicleID, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerSurfingObjectID
function GetPlayerSurfingObjectID(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerSurfingObjectID, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export RemoveBuildingForPlayer
function RemoveBuildingForPlayer(playerid::Integer, modelid::Integer, position::Vector3, fRadius::Number)::Bool
    __ret = ccall((:sampgdk_RemoveBuildingForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, modelid, position.x, position.y, position.z, fRadius)
    return __ret
end

export GetPlayerLastShotVectors
function GetPlayerLastShotVectors(playerid::Integer)::ShotVector
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

export SetPlayerAttachedObject
function SetPlayerAttachedObject(playerid::Integer, index::Integer, modelid::Integer, bone::Integer, offset::Vector3, fRotX::Number, fRotY::Number, fRotZ::Number, scale::Vector3, materialcolor1::Integer, materialcolor2::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerAttachedObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), playerid, index, modelid, bone, offset.x, offset.y, offset.z, fRotX, fRotY, fRotZ, scale.x, scale.y, scale.z, materialcolor1, materialcolor2)
    return __ret
end

export RemovePlayerAttachedObject
function RemovePlayerAttachedObject(playerid::Integer, index::Integer)::Bool
    __ret = ccall((:sampgdk_RemovePlayerAttachedObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, index)
    return __ret
end

export IsPlayerAttachedObjectSlotUsed
function IsPlayerAttachedObjectSlotUsed(playerid::Integer, index::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerAttachedObjectSlotUsed, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, index)
    return __ret
end

export EditAttachedObject
function EditAttachedObject(playerid::Integer, index::Integer)::Bool
    __ret = ccall((:sampgdk_EditAttachedObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, index)
    return __ret
end

export CreatePlayerTextDraw
function CreatePlayerTextDraw(playerid::Integer, position::Vector2, text::String)::Integer
    __ret = ccall((:sampgdk_CreatePlayerTextDraw, "./plugins/jules-andreas.so"), Cint, (Cint, Cfloat, Cfloat, Cstring), playerid, position.x, position.y, text)
    return __ret
end

export PlayerTextDrawDestroy
function PlayerTextDrawDestroy(playerid::Integer, text::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawDestroy, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

export PlayerTextDrawLetterSize
function PlayerTextDrawLetterSize(playerid::Integer, text::Integer, position::Vector2)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawLetterSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat), playerid, text, position.x, position.y)
    return __ret
end

export PlayerTextDrawTextSize
function PlayerTextDrawTextSize(playerid::Integer, text::Integer, position::Vector2)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawTextSize, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat), playerid, text, position.x, position.y)
    return __ret
end

export PlayerTextDrawAlignment
function PlayerTextDrawAlignment(playerid::Integer, text::Integer, alignment::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawAlignment, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, alignment)
    return __ret
end

export PlayerTextDrawColor
function PlayerTextDrawColor(playerid::Integer, text::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, color)
    return __ret
end

export PlayerTextDrawUseBox
function PlayerTextDrawUseBox(playerid::Integer, text::Integer, use::Bool)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawUseBox, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, text, use)
    return __ret
end

export PlayerTextDrawBoxColor
function PlayerTextDrawBoxColor(playerid::Integer, text::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawBoxColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, color)
    return __ret
end

export PlayerTextDrawSetShadow
function PlayerTextDrawSetShadow(playerid::Integer, text::Integer, size::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetShadow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, size)
    return __ret
end

export PlayerTextDrawSetOutline
function PlayerTextDrawSetOutline(playerid::Integer, text::Integer, size::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetOutline, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, size)
    return __ret
end

export PlayerTextDrawBackgroundColor
function PlayerTextDrawBackgroundColor(playerid::Integer, text::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawBackgroundColor, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, color)
    return __ret
end

export PlayerTextDrawFont
function PlayerTextDrawFont(playerid::Integer, text::Integer, font::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawFont, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, font)
    return __ret
end

export PlayerTextDrawSetProportional
function PlayerTextDrawSetProportional(playerid::Integer, text::Integer, set::Bool)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetProportional, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, text, set)
    return __ret
end

export PlayerTextDrawSetSelectable
function PlayerTextDrawSetSelectable(playerid::Integer, text::Integer, set::Bool)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetSelectable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, text, set)
    return __ret
end

export PlayerTextDrawShow
function PlayerTextDrawShow(playerid::Integer, text::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawShow, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

export PlayerTextDrawHide
function PlayerTextDrawHide(playerid::Integer, text::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawHide, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, text)
    return __ret
end

export PlayerTextDrawSetString
function PlayerTextDrawSetString(playerid::Integer, text::Integer, string::String)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, text, string)
    return __ret
end

export PlayerTextDrawSetPreviewModel
function PlayerTextDrawSetPreviewModel(playerid::Integer, text::Integer, modelindex::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetPreviewModel, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, text, modelindex)
    return __ret
end

export PlayerTextDrawSetPreviewRot
function PlayerTextDrawSetPreviewRot(playerid::Integer, text::Integer, rotation::Vector3, fZoom::Number)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetPreviewRot, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, text, rotation.x, rotation.y, rotation.z, fZoom)
    return __ret
end

export PlayerTextDrawSetPreviewVehCol
function PlayerTextDrawSetPreviewVehCol(playerid::Integer, text::Integer, color1::Integer, color2::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerTextDrawSetPreviewVehCol, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint, Cint), playerid, text, color1, color2)
    return __ret
end

export SetPVarInt
function SetPVarInt(playerid::Integer, varname::String, value::Integer)::Bool
    __ret = ccall((:sampgdk_SetPVarInt, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint), playerid, varname, value)
    return __ret
end

export GetPVarInt
function GetPVarInt(playerid::Integer, varname::String)::Integer
    __ret = ccall((:sampgdk_GetPVarInt, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring), playerid, varname)
    return __ret
end

export SetPVarString
function SetPVarString(playerid::Integer, varname::String, value::String)::Bool
    __ret = ccall((:sampgdk_SetPVarString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cstring), playerid, varname, value)
    return __ret
end

export GetPVarString
function GetPVarString(playerid::Integer, varname::String, value_size::Integer = 256)::String
    __value_buf = Vector{UInt8}(undef, 1 + value_size)
    __ret = ccall((:sampgdk_GetPVarString, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Ptr{UInt8}, Cint), playerid, varname, __value_buf, value_size)
    value = unsafe_string(pointer(__value_buf))
    return value
end

export SetPVarFloat
function SetPVarFloat(playerid::Integer, varname::String, value::Number)::Bool
    __ret = ccall((:sampgdk_SetPVarFloat, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cfloat), playerid, varname, value)
    return __ret
end

export GetPVarFloat
function GetPVarFloat(playerid::Integer, varname::String)::Number
    __ret = ccall((:sampgdk_GetPVarFloat, "./plugins/jules-andreas.so"), Cfloat, (Cint, Cstring), playerid, varname)
    return __ret
end

export DeletePVar
function DeletePVar(playerid::Integer, varname::String)::Bool
    __ret = ccall((:sampgdk_DeletePVar, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring), playerid, varname)
    return __ret
end

export GetPVarsUpperIndex
function GetPVarsUpperIndex(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPVarsUpperIndex, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPVarNameAtIndex
function GetPVarNameAtIndex(playerid::Integer, index::Integer, varname_size::Integer = 256)::String
    __varname_buf = Vector{UInt8}(undef, 1 + varname_size)
    __ret = ccall((:sampgdk_GetPVarNameAtIndex, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Ptr{UInt8}, Cint), playerid, index, __varname_buf, varname_size)
    varname = unsafe_string(pointer(__varname_buf))
    return varname
end

export GetPVarType
function GetPVarType(playerid::Integer, varname::String)::Integer
    __ret = ccall((:sampgdk_GetPVarType, "./plugins/jules-andreas.so"), Cint, (Cint, Cstring), playerid, varname)
    return __ret
end

export SetPlayerChatBubble
function SetPlayerChatBubble(playerid::Integer, text::String, color::Integer, drawdistance::Number, expiretime::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerChatBubble, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cint, Cfloat, Cint), playerid, text, color, drawdistance, expiretime)
    return __ret
end

export PutPlayerInVehicle
function PutPlayerInVehicle(playerid::Integer, vehicleid::Integer, seatid::Integer)::Bool
    __ret = ccall((:sampgdk_PutPlayerInVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, vehicleid, seatid)
    return __ret
end

export GetPlayerVehicleID
function GetPlayerVehicleID(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerVehicleID, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerVehicleSeat
function GetPlayerVehicleSeat(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerVehicleSeat, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export RemovePlayerFromVehicle
function RemovePlayerFromVehicle(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_RemovePlayerFromVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export TogglePlayerControllable
function TogglePlayerControllable(playerid::Integer, toggle::Bool)::Bool
    __ret = ccall((:sampgdk_TogglePlayerControllable, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, toggle)
    return __ret
end

export PlayerPlaySound
function PlayerPlaySound(playerid::Integer, soundid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_PlayerPlaySound, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat), playerid, soundid, position.x, position.y, position.z)
    return __ret
end

export ApplyAnimation
function ApplyAnimation(playerid::Integer, animationName::AnimationName, fDelta::Number, loop::Bool, lockx::Bool, locky::Bool, freeze::Bool, time::Integer, forcesync::Bool)::Bool
    __ret = ccall((:sampgdk_ApplyAnimation, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cstring, Cstring, Cfloat, Cuchar, Cuchar, Cuchar, Cuchar, Cint, Cuchar), playerid, animationName.animlib, animationName.animname, fDelta, loop, lockx, locky, freeze, time, forcesync)
    return __ret
end

export ClearAnimations
function ClearAnimations(playerid::Integer, forcesync::Bool)::Bool
    __ret = ccall((:sampgdk_ClearAnimations, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, forcesync)
    return __ret
end

export GetPlayerAnimationIndex
function GetPlayerAnimationIndex(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerAnimationIndex, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetAnimationName
function GetAnimationName(index::Integer, animlib_size::Integer = 32, animname_size::Integer = 32)::AnimationName
    __animlib_buf = Vector{UInt8}(undef, 1 + animlib_size)
    __animname_buf = Vector{UInt8}(undef, 1 + animname_size)
    __ret = ccall((:sampgdk_GetAnimationName, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ptr{UInt8}, Cint, Ptr{UInt8}, Cint), index, __animlib_buf, animlib_size, __animname_buf, animname_size)
    animlib = unsafe_string(pointer(__animlib_buf))
    animname = unsafe_string(pointer(__animname_buf))
    return AnimationName(animlib, animname)
end

export GetPlayerSpecialAction
function GetPlayerSpecialAction(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerSpecialAction, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export SetPlayerSpecialAction
function SetPlayerSpecialAction(playerid::Integer, actionid::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerSpecialAction, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, actionid)
    return __ret
end

export DisableRemoteVehicleCollisions
function DisableRemoteVehicleCollisions(playerid::Integer, disable::Bool)::Bool
    __ret = ccall((:sampgdk_DisableRemoteVehicleCollisions, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, disable)
    return __ret
end

export SetPlayerCheckpoint
function SetPlayerCheckpoint(playerid::Integer, position::Vector3, size::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z, size)
    return __ret
end

export DisablePlayerCheckpoint
function DisablePlayerCheckpoint(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_DisablePlayerCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerRaceCheckpoint
function SetPlayerRaceCheckpoint(playerid::Integer, type::Integer, position::Vector3, nextx::Number, nexty::Number, nextz::Number, size::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerRaceCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat), playerid, type, position.x, position.y, position.z, nextx, nexty, nextz, size)
    return __ret
end

export DisablePlayerRaceCheckpoint
function DisablePlayerRaceCheckpoint(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_DisablePlayerRaceCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerWorldBounds
function SetPlayerWorldBounds(playerid::Integer, x_max::Number, x_min::Number, y_max::Number, y_min::Number)::Bool
    __ret = ccall((:sampgdk_SetPlayerWorldBounds, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat), playerid, x_max, x_min, y_max, y_min)
    return __ret
end

export SetPlayerMarkerForPlayer
function SetPlayerMarkerForPlayer(playerid::Integer, showplayerid::Integer, color::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerMarkerForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, showplayerid, color)
    return __ret
end

export ShowPlayerNameTagForPlayer
function ShowPlayerNameTagForPlayer(playerid::Integer, showplayerid::Integer, show::Bool)::Bool
    __ret = ccall((:sampgdk_ShowPlayerNameTagForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cuchar), playerid, showplayerid, show)
    return __ret
end

export SetPlayerMapIcon
function SetPlayerMapIcon(playerid::Integer, iconid::Integer, position::Vector3, markertype::Integer, color::Integer, style::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerMapIcon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cfloat, Cfloat, Cfloat, Cint, Cint, Cint), playerid, iconid, position.x, position.y, position.z, markertype, color, style)
    return __ret
end

export RemovePlayerMapIcon
function RemovePlayerMapIcon(playerid::Integer, iconid::Integer)::Bool
    __ret = ccall((:sampgdk_RemovePlayerMapIcon, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, iconid)
    return __ret
end

export AllowPlayerTeleport
function AllowPlayerTeleport(playerid::Integer, allow::Bool)::Bool
    __ret = ccall((:sampgdk_AllowPlayerTeleport, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, allow)
    return __ret
end

export SetPlayerCameraPos
function SetPlayerCameraPos(playerid::Integer, position::Vector3)::Bool
    __ret = ccall((:sampgdk_SetPlayerCameraPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat), playerid, position.x, position.y, position.z)
    return __ret
end

export SetPlayerCameraLookAt
function SetPlayerCameraLookAt(playerid::Integer, position::Vector3, cut::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerCameraLookAt, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cint), playerid, position.x, position.y, position.z, cut)
    return __ret
end

export SetCameraBehindPlayer
function SetCameraBehindPlayer(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_SetCameraBehindPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export GetPlayerCameraPos
function GetPlayerCameraPos(playerid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerCameraPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export GetPlayerCameraFrontVector
function GetPlayerCameraFrontVector(playerid::Integer)::Vector3
    x_ref = Ref{Float32}(0)
    y_ref = Ref{Float32}(0)
    z_ref = Ref{Float32}(0)
    __ret = ccall((:sampgdk_GetPlayerCameraFrontVector, "./plugins/jules-andreas.so"), Cuchar, (Cint, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}), playerid, x_ref, y_ref, z_ref)
    x = x_ref[]
    y = y_ref[]
    z = z_ref[]
    return Vector3(x, y, z)
end

export GetPlayerCameraMode
function GetPlayerCameraMode(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerCameraMode, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export EnablePlayerCameraTarget
function EnablePlayerCameraTarget(playerid::Integer, enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnablePlayerCameraTarget, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, enable)
    return __ret
end

export GetPlayerCameraTargetObject
function GetPlayerCameraTargetObject(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerCameraTargetObject, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerCameraTargetVehicle
function GetPlayerCameraTargetVehicle(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerCameraTargetVehicle, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerCameraTargetPlayer
function GetPlayerCameraTargetPlayer(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerCameraTargetPlayer, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerCameraTargetActor
function GetPlayerCameraTargetActor(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerCameraTargetActor, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export GetPlayerCameraAspectRatio
function GetPlayerCameraAspectRatio(playerid::Integer)::Number
    __ret = ccall((:sampgdk_GetPlayerCameraAspectRatio, "./plugins/jules-andreas.so"), Cfloat, (Cint,), playerid)
    return __ret
end

export GetPlayerCameraZoom
function GetPlayerCameraZoom(playerid::Integer)::Number
    __ret = ccall((:sampgdk_GetPlayerCameraZoom, "./plugins/jules-andreas.so"), Cfloat, (Cint,), playerid)
    return __ret
end

export AttachCameraToObject
function AttachCameraToObject(playerid::Integer, objectid::Integer)::Bool
    __ret = ccall((:sampgdk_AttachCameraToObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, objectid)
    return __ret
end

export AttachCameraToPlayerObject
function AttachCameraToPlayerObject(playerid::Integer, playerobjectid::Integer)::Bool
    __ret = ccall((:sampgdk_AttachCameraToPlayerObject, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, playerobjectid)
    return __ret
end

export InterpolateCameraPos
function InterpolateCameraPos(playerid::Integer, fromPos::Vector3, ToX::Number, ToY::Number, ToZ::Number, time::Integer, cut::Integer)::Bool
    __ret = ccall((:sampgdk_InterpolateCameraPos, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), playerid, fromPos.x, fromPos.y, fromPos.z, ToX, ToY, ToZ, time, cut)
    return __ret
end

export InterpolateCameraLookAt
function InterpolateCameraLookAt(playerid::Integer, fromPos::Vector3, ToX::Number, ToY::Number, ToZ::Number, time::Integer, cut::Integer)::Bool
    __ret = ccall((:sampgdk_InterpolateCameraLookAt, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Cint), playerid, fromPos.x, fromPos.y, fromPos.z, ToX, ToY, ToZ, time, cut)
    return __ret
end

export IsPlayerConnected
function IsPlayerConnected(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerConnected, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export IsPlayerInVehicle
function IsPlayerInVehicle(playerid::Integer, vehicleid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerInVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, vehicleid)
    return __ret
end

export IsPlayerInAnyVehicle
function IsPlayerInAnyVehicle(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerInAnyVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export IsPlayerInCheckpoint
function IsPlayerInCheckpoint(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerInCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export IsPlayerInRaceCheckpoint
function IsPlayerInRaceCheckpoint(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_IsPlayerInRaceCheckpoint, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export SetPlayerVirtualWorld
function SetPlayerVirtualWorld(playerid::Integer, worldid::Integer)::Bool
    __ret = ccall((:sampgdk_SetPlayerVirtualWorld, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint), playerid, worldid)
    return __ret
end

export GetPlayerVirtualWorld
function GetPlayerVirtualWorld(playerid::Integer)::Integer
    __ret = ccall((:sampgdk_GetPlayerVirtualWorld, "./plugins/jules-andreas.so"), Cint, (Cint,), playerid)
    return __ret
end

export EnableStuntBonusForPlayer
function EnableStuntBonusForPlayer(playerid::Integer, enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableStuntBonusForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, enable)
    return __ret
end

export EnableStuntBonusForAll
function EnableStuntBonusForAll(enable::Bool)::Bool
    __ret = ccall((:sampgdk_EnableStuntBonusForAll, "./plugins/jules-andreas.so"), Cuchar, (Cuchar,), enable)
    return __ret
end

export TogglePlayerSpectating
function TogglePlayerSpectating(playerid::Integer, toggle::Bool)::Bool
    __ret = ccall((:sampgdk_TogglePlayerSpectating, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cuchar), playerid, toggle)
    return __ret
end

export PlayerSpectatePlayer
function PlayerSpectatePlayer(playerid::Integer, targetplayerid::Integer, mode::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerSpectatePlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, targetplayerid, mode)
    return __ret
end

export PlayerSpectateVehicle
function PlayerSpectateVehicle(playerid::Integer, targetvehicleid::Integer, mode::Integer)::Bool
    __ret = ccall((:sampgdk_PlayerSpectateVehicle, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cint), playerid, targetvehicleid, mode)
    return __ret
end

export StartRecordingPlayerData
function StartRecordingPlayerData(playerid::Integer, recordtype::Integer, recordname::String)::Bool
    __ret = ccall((:sampgdk_StartRecordingPlayerData, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cint, Cstring), playerid, recordtype, recordname)
    return __ret
end

export StopRecordingPlayerData
function StopRecordingPlayerData(playerid::Integer)::Bool
    __ret = ccall((:sampgdk_StopRecordingPlayerData, "./plugins/jules-andreas.so"), Cuchar, (Cint,), playerid)
    return __ret
end

export CreateExplosionForPlayer
function CreateExplosionForPlayer(playerid::Integer, position::Vector3, type::Integer, Radius::Number)::Bool
    __ret = ccall((:sampgdk_CreateExplosionForPlayer, "./plugins/jules-andreas.so"), Cuchar, (Cint, Cfloat, Cfloat, Cfloat, Cint, Cfloat), playerid, position.x, position.y, position.z, type, Radius)
    return __ret
end

end