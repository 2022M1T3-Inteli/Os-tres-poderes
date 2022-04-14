extends Control

func _ready():
	pass

func _process(delta):
	if Global.Progresso == 7: 
		$idealizar_pec.disabled = false

func _on_idealizar_pec_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Botões/Ideia.tscn")

func _on_voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn")

func _on_imprensa_pressed():
	pass # Replace with function body.

func _on_Imprensa_pressed():
	if Global.ideia == "Saude":
		get_tree().change_scene("res://Cenas/Poderes/Executivo/Minigames/Corrida pela Saúde/CorridaSaude.tscn")
	elif Global.ideia == "Impresso":
		get_tree().change_scene("res://Cenas/Poderes/Executivo/Minigames/Voto Impresso/Game.tscn")

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoder.tscn") #Botão de voltar

func _on_Direita_pressed():
	if ideia.visible: 
		ideia.hide()
		imprensa.show()
	elif imprensa.visible: 
		imprensa.hide()
		aprovar.show()
	else:  
		aprovar.hide()
		ideia.show()

func _on_Esquerda_pressed():
	if ideia.visible: 
		ideia.hide()
		aprovar.show()
	elif aprovar.visible: 
		aprovar.hide()
		imprensa.show()
	else:
		imprensa.hide()
		ideia.show()

func _input(event):
	if event.is_action_pressed("esquerda"):
		esquerda.texture_normal = load ("res://Recursos/Botões/SetaPressed.png")
	if event.is_action_released("esquerda"):
		_on_Esquerda_pressed()
		esquerda.texture_normal = load ("res://Recursos/Botões/SetaNormal.png")
	if event.is_action_pressed("direita"):
		direita.texture_normal = load ("res://Recursos/Botões/SetaPressed.png")
	if event.is_action_released("direita"):
		_on_Direita_pressed()
		direita.texture_normal = load ("res://Recursos/Botões/SetaNormal.png")
	if event.is_action_pressed("aceitar"):
		if ideia.visible and ideia.disabled == false: 
			ideia.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
		if imprensa.visible and imprensa.disabled == false: 
			imprensa.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
	if event.is_action_released("aceitar"):
		ideia.set("custom_styles/normal", null)
		imprensa.set("custom_styles/normal", null)
		if ideia.visible and ideia.disabled == false: 
			_on_Ideia_pressed()
		elif imprensa.visible and imprensa.disabled == false: 
			_on_Imprensa_pressed()
