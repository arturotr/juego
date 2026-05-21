@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRPuerto := preload("res://game/rooms/puerto/room_puerto.gd")
const PRCasasPuerto := preload("res://game/rooms/casas_puerto/room_casas_puerto.gd")
# ---- classes

# nodes ----
var Puerto: PRPuerto : get = get_Puerto
var CasasPuerto: PRCasasPuerto : get = get_CasasPuerto
# ---- nodes

# functions ----
func get_Puerto() -> PRPuerto: return get_runtime_room("Puerto")
func get_CasasPuerto() -> PRCasasPuerto: return get_runtime_room("CasasPuerto")
# ---- functions

