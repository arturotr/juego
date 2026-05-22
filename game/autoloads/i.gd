@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIITinta := preload("res://game/inventory_items/tinta/inventory_item_tinta.gd")
# ---- classes

# nodes ----
var Tinta: PIITinta : get = get_Tinta
# ---- nodes

# functions ----
func get_Tinta() -> PIITinta: return get_item_instance("Tinta")
# ---- functions

