extends Node2D

onready var pc = $Background
onready var dados = $Dados
var pcligado = load("res://Recursos/Planos de Fundo/fundo-torto(1).jpg")
var pcdesligado = load("res://Recursos/Planos de Fundo/PCDesligado.jpg")


func _on_Power_pressed():
	if pc.texture == pcligado:
		pc.texture = pcdesligado
		dados.hide()
	else:
		pc.texture = pcligado
		dados.show()

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/MenuDados.tscn") 
