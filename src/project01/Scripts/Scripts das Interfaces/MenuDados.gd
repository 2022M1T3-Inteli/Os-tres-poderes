extends Node2D

onready var pc = $Background
onready var botoes = $"Opções"
var pcligado = load("res://Recursos/Planos de Fundo/fundo-torto(1).jpg")
var pcdesligado = load("res://Recursos/Planos de Fundo/zyro-image.jpg")

func _ready():
	pass 

func _on_DadosJogador_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/DadosJogadores.tscn")

func _on_DadosMinigame_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/DadosMinigame.tscn")

func _on_DadosDebate_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/DadosDebate.tscn")

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Judiciário.tscn")

func _on_Power_pressed():
	if pc.texture == pcligado:
		pc.texture = pcdesligado
		botoes.hide()
	else:
		pc.texture = pcligado
		botoes.show()
