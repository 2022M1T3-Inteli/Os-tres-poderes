extends Control


func _ready():
	$Presidente.texture = Global.NPC[Global.Presidente]["Lado"]["Half"]
	$Conselheiro.texture = Global.NPC[Global.Conselheiro]["Lado"]["Half"]
	if Global.Progresso < 27:
		if Global.Progresso >= 9 and Global.Progresso < 17: 
			Global.Progresso = 10
			$Deputados.disabled = false
		if Global.Progresso >= 17:
			Global.Progresso = 18 
			$Senadores.disabled = false


func _on_Deputados_pressed():
	get_tree().change_scene("res://Debate_Dialogo.tscn")


func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn")


func _on_Senadores_pressed():
	get_tree().change_scene("res://Debate_Dialogo.tscn")
