# @popochiu-docs-ignore-class
@tool
extends PopochiuProp
# You can use `E.queue([])` in any of the methods in this script to trigger a sequence of events.
# Use `await E.queue([])` to pause execution until the sequence completes.


#region Virtual ####################################################################################
# Called when the prop is clicked
func _on_click() -> void:
	var comando_activo = PopochiuUtils.e.current_command
	if comando_activo == NineVerbCommands.Commands.PICK_UP:
	# Replace the call to E.command_fallback() with your own logic.
	# 1. Mateo camina de forma automática hacia el 'Walk-to point' del objeto
		await C.player.walk_to_prop("Tinta")
	# 2. Mateo dice una línea antes de cogerlo (opcional, pero muy LucasArts)
		await C.player.say("Vaya, una botella de tinta vacía. Podría serme útil.")
		# 3. Reproduces la animación de coger que ya preparaste
	# (Sustituye "coger" por el nombre exacto de tu animación en el Sprite del jugador)
		await get_tree().create_timer(0.1).timeout
		await PopochiuUtils.c.player.play_animation("animacionesMateo/opendoor_e")
		# 4. Añades el ítem de inventario que creamos en el Paso 1
	# Popochiu usa la 'I' para acceder a los ítems globales
		I.Tinta.add()
	# 5. Haces que el objeto del escenario desaparezca
		self.disable()
	
	elif comando_activo == NineVerbCommands.Commands.LOOK_AT:
		await C.player.walk_to_prop("Tinta")
		await C.player.say("Es un viejo tintero de vidrio. Está completamente seco.")
	else:
		# Una respuesta genérica para acciones que no tienen sentido
		await C.player.say("No creo que pueda hacer eso con la tinta.")
	
	
	
	
	# 6. Mateo vuelve a su animación de estar quieto (idle)
	C.player.play_animation("idle_e")	# Example: make the player walk to this prop, face it, then say a line:
#	await C.player.walk_to_clicked()
#	await C.player.face_clicked()
#	await C.player.say("Not picking that up!")


# Called when the prop is double-clicked
func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	PopochiuUtils.e.command_fallback()
	# For example, you could make the player instantly do something instead of walking there first


# Called when the prop is right-clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() with your own logic.
	PopochiuUtils.e.command_fallback()
	# Example: make the player face this prop and say a line:
#	await C.player.face_clicked()
#	await C.player.say("A deck of cards")


# When the prop is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	PopochiuUtils.e.command_fallback()


# Called when the prop is clicked while an inventory item is selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() with your own logic.
	PopochiuUtils.e.command_fallback()
	# Example: if the Key is used on this prop, make the player speak.
#	if _item == I.Key:
#		await C.player.say("This stuff has no lock!")


# Called when an inventory item linked to this Prop (`link_to_item`) is removed
# from the inventory.
func _on_linked_item_removed() -> void:
	pass


# Called when an inventory item linked to this Prop (`link_to_item`) is discarded
# from the inventory.
func _on_linked_item_discarded() -> void:
	pass


# Called when the prop starts moving
func _on_movement_started() -> void:
	pass


# Called when the prop stops moving
func _on_movement_ended() -> void:
	pass


#endregion

#region Public #####################################################################################
# Add functions here that are triggered by GUI commands.
#
# If you name the functions following the `on_<command_id>` pattern, they will be automatically
# called when the corresponding command is triggered in the GUI.
#
# For example, if your GUI provides a `look_at` command you could add:
#
#func on_look_at() -> void:
#	pass
#
# This function will be called whenever the `look_at` command is triggered in the GUI while this
# prop is the target.
# This keeps the code way more tidy and organized with GUIs with many different commands,
# as opposed to having a single `match` statement in the general-use methods.


#endregion
