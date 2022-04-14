extends Node2D

onready var pc = $Background
onready var botoes = $"Opções"
onready var jornal = $Jornal
var pcligado = load("res://Recursos/Planos de Fundo/fundo-torto(1).jpg")
var pcdesligado = load("res://Recursos/Planos de Fundo/PCDesligado.jpg")
#variaveis utilizadas no codigo
func _ready():
	pass 

func _on_DadosJogador_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/DadosJogadores.tscn")
#Muda para a cena dos Dados do Jogador
func _on_DadosMinigame_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/DadosMinigame.tscn")
#Muda para a cena dos Dados do Minigame
func _on_DadosDebate_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/DadosDebate.tscn")
#Muda para a cena dos Dados do Debate
func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Judiciário.tscn")
#Volta para a cena anterior
func _on_Noticias_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/Jornal.tscn")
#Muda para a cena da notícia/jornal que mostra as consequencias do resultado do minigame



func _on_Power_pressed():
	if pc.texture == pcligado:
		pc.texture = pcdesligado
		botoes.hide()
	else:
		pc.texture = pcligado
		botoes.show()
#"Liga" e "Desliga" a tela do monitor






