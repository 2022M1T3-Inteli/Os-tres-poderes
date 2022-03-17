extends Control

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Executivo.tscn")
	Global.ideia = true
