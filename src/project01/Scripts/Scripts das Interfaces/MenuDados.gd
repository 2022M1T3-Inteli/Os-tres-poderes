extends Node2D

onready var easteregg = $EasterEgg
onready var power = $Power
onready var loading = $Loading
onready var pc = $Background
onready var botoes = $"Opções"
var pcligado = load("res://Recursos/Planos de Fundo/fundo-pc.jpg")
var pcdesligado = load("res://Recursos/Planos de Fundo/PCDesligado.jpg")

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
#"Liga e Desliga" o Monitor


func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Minigames/Corrida pela Saúde/CorridaSaude.tscn")
#Inicia a cena do Easter Egg

func _on_EasterEgg_pressed():
	loading.show()
	loading.play()
	if pc.texture == pcligado:
		pc.texture = pcdesligado
		botoes.hide()
	easteregg.hide()
	power.hide()
#Responsavel por iniciar o carregamento para o Easter Egg
