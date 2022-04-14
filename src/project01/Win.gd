extends Control


func _ready():
	if Global.Progresso == -1: 
		$TextureRect.texture = load("res://Recursos/Planos de Fundo/lose.png")
	elif Global.Progresso == -2: 
		$TextureRect.texture = load("res://Recursos/Planos de Fundo/win.png")
