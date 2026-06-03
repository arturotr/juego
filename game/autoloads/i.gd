@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIITinta := preload("res://game/inventory_items/tinta/inventory_item_tinta.gd")
const PIIMaletin := preload("res://game/inventory_items/maletin/inventory_item_maletin.gd")
const PIIMaletinVacio := preload("res://game/inventory_items/maletin_vacio/inventory_item_maletin_vacio.gd")
const PIIRegla := preload("res://game/inventory_items/regla/inventory_item_regla.gd")
const PIIFormularios := preload("res://game/inventory_items/formularios/inventory_item_formularios.gd")
const PIISello := preload("res://game/inventory_items/sello/inventory_item_sello.gd")
const PIILapiz := preload("res://game/inventory_items/lapiz/inventory_item_lapiz.gd")
const PIIAlmohadilla := preload("res://game/inventory_items/almohadilla/inventory_item_almohadilla.gd")
# ---- classes

# nodes ----
var Tinta: PIITinta : get = get_Tinta
var Maletin: PIIMaletin : get = get_Maletin
var MaletinVacio: PIIMaletinVacio : get = get_MaletinVacio
var Regla: PIIRegla : get = get_Regla
var Formularios: PIIFormularios : get = get_Formularios
var Sello: PIISello : get = get_Sello
var Lapiz: PIILapiz : get = get_Lapiz
var Almohadilla: PIIAlmohadilla : get = get_Almohadilla
# ---- nodes

# functions ----
func get_Tinta() -> PIITinta: return get_item_instance("Tinta")
func get_Maletin() -> PIIMaletin: return get_item_instance("Maletin")
func get_MaletinVacio() -> PIIMaletinVacio: return get_item_instance("MaletinVacio")
func get_Regla() -> PIIRegla: return get_item_instance("Regla")
func get_Formularios() -> PIIFormularios: return get_item_instance("Formularios")
func get_Sello() -> PIISello: return get_item_instance("Sello")
func get_Lapiz() -> PIILapiz: return get_item_instance("Lapiz")
func get_Almohadilla() -> PIIAlmohadilla: return get_item_instance("Almohadilla")
# ---- functions
