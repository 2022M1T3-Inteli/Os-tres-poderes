extends Control

onready var imprensa = $Imprensa
onready var ideia = $Ideia
onready var aprovar = $Aprovar
onready var direita = $Direita
onready var esquerda = $Esquerda

func _ready():
	pass

func _process(delta):
	if Global.ideia: 
		imprensa.disabled = false
		ideia.disabled = true
		aprovar.disabled = true
	else: 
		imprensa.disabled = true
		aprovar.disabled = true

func _on_Ideia_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Botões/Ideia.tscn")

func _on_Imprensa_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Minigames/Corrida pela Saúde/CorridaSaude.tscn")

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
		_on_Esquerda_pressed()
	if event.is_action_pressed("direita"):
		_on_Direita_pressed()
	if event.is_action_pressed("aceitar"):
		if ideia.visible and ideia.disabled == false: 
			_on_Ideia_pressed()
		elif imprensa.visible: 
			_on_Imprensa_pressed()
