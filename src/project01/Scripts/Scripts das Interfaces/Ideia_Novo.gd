extends Control

func _ready():
	pass 

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/executivo_novo.tscn")


func _on_Voto_Impresso_pressed():
	get_tree().change_scene("res://Detalhe_PEC.tscn")
	Global.PEC_Escolhida = 0 
