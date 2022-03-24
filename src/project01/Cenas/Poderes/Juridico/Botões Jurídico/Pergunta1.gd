extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DadosJogador_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Juridico/Botões Jurídico/DadosJogadores.tscn")


func _on_DadosMinigame_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Juridico/Botões Jurídico/DadosMinigame.tscn")


func _on_DadosDebate_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Juridico/Botões Jurídico/DadosDebate.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Juridico/Jurídico.tscn")
