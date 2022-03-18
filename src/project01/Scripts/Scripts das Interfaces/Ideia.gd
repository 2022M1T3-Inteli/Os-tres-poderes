extends Control

onready var saude = $VBoxContainer/Saude
onready var seguranca = $"VBoxContainer/Segurança"
onready var educacao = $"VBoxContainer/Educação"
onready var sociais = $"VBoxContainer/Problemas Sociais"
var posicao = 1

func _ready():
	if posicao == 1: 
		saude.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))

func _on_Saude_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Executivo.tscn")
	Global.ideia = true

func _input(event):
	if event.is_action_pressed("baixo") or event.is_action_pressed("cima"):
		saude.set("custom_styles/normal", null)
		seguranca.set("custom_styles/normal", null)
		educacao.set("custom_styles/normal", null)
		sociais.set("custom_styles/normal", null)
	if event.is_action_released("baixo"): 
		if saude.disabled == false and posicao == 4: 
			saude.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 1
		elif seguranca.disabled == false and posicao == 1: 
			seguranca.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 2
		elif educacao.disabled == false and posicao == 2:
			educacao.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 3
		else: 
			sociais.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 4
	if event.is_action_released("cima"):
		if saude.disabled == false and posicao == 2:
			saude.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 1 
		elif seguranca.disabled == false and posicao == 3: 
			seguranca.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 2 
		elif educacao.disabled == false and posicao == 4: 
			educacao.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 3
		else:
			sociais.set("custom_styles/normal", load("res://Recursos/Botões/selected_button_themes.tres"))
			posicao = 4
	if event.is_action_released("aceitar"): 
		if posicao == 1: 
			_on_Saude_pressed()
