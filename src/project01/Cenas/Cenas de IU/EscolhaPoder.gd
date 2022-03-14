extends Control

func _ready():
	pass # Replace with function body.

func _on_PL_pressed():
	get_tree().change_scene("res://Cenas/Cenas Principais/Legislativo.tscn") 
	#Escolhe o poder Legislativo


func _on_PE_pressed():
	get_tree().change_scene("res://Cenas/Cenas Principais/Executivo.tscn") 
	#Escolhe o poder Executivo


func _on_PJ_pressed():
	get_tree().change_scene("res://Cenas/Cenas Principais/Jurídico.tscn") 
	#Escolhe o poder Judicial
