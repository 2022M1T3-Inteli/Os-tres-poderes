extends Node2D

onready var pc = $Background
onready var dados = $Dados
var pcligado = load("res://Recursos/Planos de Fundo/fundo-torto(1).jpg")
var pcdesligado = load("res://Recursos/Planos de Fundo/PCDesligado.jpg")
var pontuacao = Global.pontuacao

func _on_Power_pressed():
	if pc.texture == pcligado:
		pc.texture = pcdesligado
		dados.hide()
	else:
		pc.texture = pcligado
		dados.show()
#Liga e desliga o monitor

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/MenuDados.tscn") 

func _process(delta):
	$Dados.text = "Sua pontuação do MiniGame foi: " + String(pontuacao)
#Puxa as informações do Global.gd e mostra os dados do Minigame na tela do computador.
