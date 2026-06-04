# @popochiu-docs-ignore-class
extends PopochiuInventoryItem

const Data := preload('inventory_item_maletin_state.gd')

var state: Data = load("res://game/inventory_items/maletin/inventory_item_maletin.tres")


#region Virtual ####################################################################################
# Called when the item is clicked in the inventory
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	if E.current_command == NineVerbCommands.Commands.OPEN:
		# 1. Quitamos la maleta llena del inventario
		await I.Maletin.remove()
		# 2. Añadimos la maleta vacía
		await I.MaletinVacio.add()
		await Engine.get_main_loop().create_timer(0.5).timeout
		await I.Formularios.add()
		await Engine.get_main_loop().create_timer(0.5).timeout
		await I.Regla.add()
		await Engine.get_main_loop().create_timer(0.5).timeout
		await I.Sello.add()
		await Engine.get_main_loop().create_timer(0.5).timeout
		await I.Almohadilla.add()
		await Engine.get_main_loop().create_timer(0.5).timeout
		await I.Lapiz.add()
		
	elif E.current_command != NineVerbCommands.Commands.OPEN:
		# Respuesta por defecto si la miran o intentan usar con otra cosa
		await C.player.say("Es mi vieja maleta de cuero.")
		await C.player.say("Está llena de cosas, debería vaciarla para ver lo que tiene dentro.")
	else:
		E.command_fallback()


# Called when the item is right-clicked in the inventory
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# Called when the item is middle-clicked in the inventory
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# Called when the item is clicked while another inventory item is selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() with your own logic.
	E.command_fallback()
	# Example: if a Key is used on this item, make the player say something.
#	if _item == I.Key:
#		await C.player.say("This item has no lock!")


# Called when the item is added to the inventory
func _on_added_to_inventory() -> void:
	# Replace the call to `super()` to implement custom behavior.
	# Calling `super()` preserves default behavior as well.
	super()


# Called when the item is discarded from the inventory
func _on_discard() -> void:
	# Replace the call to `super()` to implement custom behavior.
	# Calling `super()` preserves default behavior as well.
	super()


#endregion
