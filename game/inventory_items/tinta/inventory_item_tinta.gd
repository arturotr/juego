# @popochiu-docs-ignore-class
extends PopochiuInventoryItem

const Data := preload('inventory_item_tinta_state.gd')

var state: Data = load("res://game/inventory_items/tinta/inventory_item_tinta.tres")


#region Virtual ####################################################################################
# Called when the item is clicked in the inventory
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
# Al igual que con el Prop, leemos qué botón de la interfaz está pulsado
	var comando_activo = PopochiuUtils.e.current_command
	
	if comando_activo == NineVerbCommands.Commands.LOOK_AT:
		# Mateo describe la tinta directamente desde su inventario
		await C.player.say("Es un viejo tintero de vidrio. Está completamente seco.")
	
	elif comando_activo == NineVerbCommands.Commands.USE:
		# Dejamos esto preparado por si en el futuro el jugador intenta
		# usar la tinta con otro objeto (ej: Usar Tinta con Pluma)
		E.command_fallback()
		
	else:
		# Si intenta "Hablar", "Coger" o "Abrir" la tinta dentro del bolsillo,
		# dejamos que Popochiu muestre su respuesta negativa por defecto.
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

func _on_look_at() -> void:
	# Mateo dice la descripción desde donde esté parado
	await C.player.say("Es un viejo tintero de vidrio. Está completamente seco.")

#endregion
