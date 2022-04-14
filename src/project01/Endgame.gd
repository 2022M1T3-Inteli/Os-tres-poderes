extends Control


func _input(event):
	if event.is_action_pressed("proximo"): 
		get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn")
		Global.Progresso = -2
