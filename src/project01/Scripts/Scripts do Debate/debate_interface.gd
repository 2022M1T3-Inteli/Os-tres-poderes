extends Control

func _ready():
	pass

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoder.tscn")


func _on_Debate_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Legislativo/Debate.tscn")
	Global.comissao_atual = "Câmara dos Deputados"
