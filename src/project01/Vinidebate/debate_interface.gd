extends Control

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://health.tscn")
	Global.comissao_atual = "Câmara dos Deputados"
