extends Node2D

var pos1 = 289 
var pos2 = 486 
var pos3 = 684
var pos4 = 881

onready var escolha = $Escolha
onready var cons1 = $HBoxContainer/Conselheiro1
onready var cons2 = $HBoxContainer/Conselheiro2
onready var cons3 = $HBoxContainer/Conselheiro3
onready var cons4 = $HBoxContainer/Conselheiro4

var conselheiro = 0

func _ready():
	conselheiro +=1 
	if conselheiro == 1: 
		conselheiro +=1
		mostrar_avatar()
	if conselheiro == 2: 
		conselheiro +=1
		mostrar_avatar()
	if conselheiro == 3: 
		conselheiro +=1
		mostrar_avatar()
	if conselheiro == 4: 
		conselheiro = 0 
		mostrar_avatar()


func _process(delta):
	if conselheiro == 0:
		escolha.hide()
	else:
		escolha.show()

func _input(event):
	if event.is_action_pressed("direita"):
		if conselheiro == 1: 
			conselheiro = 2
			posicionar_escolhido()
			mostrar_avatar()
		elif conselheiro == 2: 
			conselheiro = 3 
			posicionar_escolhido()
			mostrar_avatar()
		elif conselheiro == 3: 
			conselheiro = 4 
			posicionar_escolhido()
			mostrar_avatar()
		else: 
			conselheiro = 1
			posicionar_escolhido()
			mostrar_avatar() 
	if event.is_action_pressed("esquerda"):
		if conselheiro == 1: 
			conselheiro = 4
			posicionar_escolhido()
			mostrar_avatar()
		elif conselheiro == 2: 
			conselheiro = 1 
			posicionar_escolhido()
			mostrar_avatar()
		elif conselheiro == 3: 
			conselheiro = 2 
			posicionar_escolhido()
			mostrar_avatar()
		else: 
			conselheiro = 3
			posicionar_escolhido()
			mostrar_avatar()
	if event.is_action_pressed("proximo"):
		_on_Escolha_pressed()

func posicionar_escolhido(): 
	if conselheiro == 1: 
		escolha.rect_position.x = pos1
	elif conselheiro == 2: 
		escolha.rect_position.x = pos2 
	elif conselheiro == 3: 
		escolha.rect_position.x = pos3
	else:
		escolha.rect_position.x = pos4 

func mostrar_avatar(): 
	if conselheiro == 1: 
		cons1.texture = Global.conselheiro_dados["HomemBranco"]["Busto"]
		Global.conselheiro_escolhido = "HomemBranco"
	else:
		cons1.texture = Global.conselheiro_dados["HomemBranco"]["Hidden"]
	if conselheiro == 2: 
		cons2.texture = Global.conselheiro_dados["HomemNegro"]["Busto"]
		Global.conselheiro_escolhido = "HomemNegro"
	else:
		cons2.texture = Global.conselheiro_dados["HomemNegro"]["Hidden"]
	if conselheiro == 3: 
		cons3.texture = Global.conselheiro_dados["MulherBranca"]["Busto"]
		Global.conselheiro_escolhido = "MulherBranca"
	else:
		cons3.texture = Global.conselheiro_dados["MulherBranca"]["Hidden"]
	if conselheiro == 4: 
		cons4.texture = Global.conselheiro_dados["MulherNegra"]["Busto"]
		Global.conselheiro_escolhido = "MulherNegra"
	else:
		cons4.texture = Global.conselheiro_dados["MulherNegra"]["Hidden"]

func _on_Conselheiro1_mouse_entered():
	conselheiro = 1 
	posicionar_escolhido()
	mostrar_avatar()


func _on_Conselheiro2_mouse_entered():
	conselheiro = 2 
	posicionar_escolhido()
	mostrar_avatar()


func _on_Conselheiro3_mouse_entered():
	conselheiro = 3 
	posicionar_escolhido()
	mostrar_avatar()

func _on_Conselheiro4_mouse_entered():
	conselheiro = 4 
	posicionar_escolhido()
	mostrar_avatar()


func _on_Escolha_pressed():
	var contextoatual = "Introdução"
	Global.contexto_atual = contextoatual
	get_tree().change_scene("res://Cenas/Interface do Usuário/Cena Principal.tscn")
