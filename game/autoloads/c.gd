@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCMateo := preload("res://game/characters/mateo/character_mateo.gd")
# ---- classes

# nodes ----
var Mateo: PCMateo : get = get_Mateo
# ---- nodes

# functions ----
func get_Mateo() -> PCMateo: return get_runtime_character("Mateo")
# ---- functions

