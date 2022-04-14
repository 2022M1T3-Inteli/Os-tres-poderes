extends Control





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	get_node("TextureRect/HomemNegroFrente/HpProgress/Label").text = "boa playboy"




func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoder.tscn")
