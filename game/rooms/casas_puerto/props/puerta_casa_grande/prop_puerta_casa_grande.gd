# @popochiu-docs-ignore-class
@tool
extends PopochiuProp
# You can use `E.queue([])` in any of the methods in this script to trigger a sequence of events.
# Use `await E.queue([])` to pause execution until the sequence completes.
const TEXTURA_CERRADA = preload("res://game/rooms/casas_puerto/props/puerta_casa_grande/Puerta_cerrada.png")
const TEXTURA_ABIERTA = preload("res://game/rooms/casas_puerto/props/puerta_casa_grande/Puerta_abierta.png")
var esta_abierta: bool:
	get:
		if Engine.is_editor_hint(): return false
		return R.CasasPuerto.state.puerta_abierta if "CasasPuerto" in R else false
	set(value):
		if not Engine.is_editor_hint() and "CasasPuerto" in R:
			R.CasasPuerto.state.puerta_abierta = value
@export var suggested_command: NineVerbCommands.Commands = NineVerbCommands.Commands.OPEN
#region Virtual ####################################################################################
func _ready() -> void:
	super()
	if not Engine.is_editor_hint():
		# Esperamos un instante a que Popochiu inicialice los estados de la sala
		await get_tree().process_frame
		# Sincronizamos el aspecto visual con el estado guardado
		$Sprite2D.texture = TEXTURA_ABIERTA if esta_abierta else TEXTURA_CERRADA
# Called when the prop is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() with your own logic.
# 1. Extraemos el número de comando de la cola de eventos de Popochiu
	var comando_activo = PopochiuUtils.e.current_command
	
	if comando_activo == NineVerbCommands.Commands.WALK_TO and esta_abierta:
		await C.player.walk_to_prop("PuertaCasaGrande")
		PopochiuUtils.r.goto_room("CasaMagnolia")
		return # Salimos para que no ejecute el resto del código
	# 2. Hacemos referencia directa al Enum de tu clase NineVerbCommands
	# Accedemos a NineVerbCommands.Commands.OPEN (que vale 1) y NineVerbCommands.Commands.CLOSE (que vale 4)
	
	if comando_activo == NineVerbCommands.Commands.OPEN:
		if esta_abierta:
			await PopochiuUtils.c.player.say("Ya está abierta.")
		else:
			await PopochiuUtils.c.player.walk_to_clicked()
			PopochiuUtils.c.player.animation_player.play("animacionesMateo/opendoor_e")
			await get_tree().create_timer(0.3).timeout
			$Sprite2D.texture = TEXTURA_ABIERTA
			esta_abierta = true
			await PopochiuUtils.c.player.animation_player.animation_finished

	elif comando_activo == NineVerbCommands.Commands.CLOSE:
		if not esta_abierta:
			await PopochiuUtils.c.player.say("Ya está cerrada.")
		else:
			await PopochiuUtils.c.player.walk_to_clicked()
			PopochiuUtils.c.player.animation_player.play("animacionesMateo/opendoor_e")
			await get_tree().create_timer(0.3).timeout
			$Sprite2D.texture = TEXTURA_CERRADA
			esta_abierta = false
			await PopochiuUtils.c.player.animation_player.animation_finished

	else:
		# Si es mirar, usar, coger, etc., sigue con el comportamiento genérico de la GUI
		PopochiuUtils.e.command_fallback()	# Example: make the player walk to this prop, face it, then say a line:
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
# 1. Esto se ejecuta AL PULSAR "ABRIR" EN EL PANEL Y LUEGO LA PUERTA
func open() -> void:
	if esta_abierta:
		await C.player.say("Ya está abierta.")
	else:
		# Hacemos que camine hacia la puerta de forma asíncrona
		await C.player.walk_to_prop("PuertaCasaGrande")
		C.player.animation_player.play("animacionesMateo/opendoor_e")
		await get_tree().create_timer(0.3).timeout
		#await C.player.animation_player.animation_finished
		# Cambiamos la textura al instante (Estilo clásico)
		$Sprite2D.texture = TEXTURA_ABIERTA
		esta_abierta = true
		await C.player.animation_player.animation_finished
# 2. Esto se ejecuta AL PULSAR "CERRAR" EN EL PANEL Y LUEGO LA PUERTA
func close() -> void:
	if not esta_abierta:
		await C.player.say("Ya está cerrada.")
	else:
		await C.player.walk_to_prop("PuertaCasaGrande")
		C.player.animation_player.play("animacionesMateo/opendoor_e")
		await get_tree().create_timer(0.3).timeout
		# Volvemos a poner la textura cerrada
		$Sprite2D.texture = TEXTURA_CERRADA
		esta_abierta = false
		await C.player.animation_player.animation_finished


#endregion
