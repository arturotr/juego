# En Puerta.gd (asignado a tus puertas)
extends PopochiuProp

func _ready():
	# Cada vez que la puerta aparece, se actualiza sola mirando la "libreta"
	actualizar_visual()

func actualizar_visual():
	# Verifica el estado. Si no existe, asume que está cerrada (false)
	var esta_abierta = Globals.estados_objetos.get(self.name, false)
	var s_cerrada = get_node_or_null("SpriteCerrada")
	var s_abierta = get_node_or_null("SpriteAbierta")
	if esta_abierta:
		if s_cerrada: s_cerrada.visible = false
		if s_abierta: s_abierta.visible = true
		# Desactivar colisión para poder pasar
	else:
		if s_cerrada: s_cerrada.visible = true
		if s_abierta: s_abierta.visible = false
		# Activar colisión para bloquear el paso

func on_interact():
	# Al hacer clic, invierte el valor actual en la "libreta"
	var esta_abierta = Globals.estados_objetos.get(self.name, false)
	Globals.estados_objetos[self.name] = !esta_abierta
	
	# Aplica el cambio visual
	actualizar_visual()
