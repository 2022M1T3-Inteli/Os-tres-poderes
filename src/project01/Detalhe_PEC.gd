extends Control

func _ready():
	$titulo.text = Global.detalhe_pec[Global.PEC_Escolhida]["Titulo"]
	$Conteudo.text = Global.detalhe_pec[Global.PEC_Escolhida]["Conteudo"]


func _on_aceitar_proposta_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/executivo_novo.tscn")
	Global.Progresso = 8
