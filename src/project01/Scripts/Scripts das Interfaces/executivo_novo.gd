extends Control

func _ready():
	if Global.Progresso == 5: 
		Global.Progresso = 6
		get_tree().change_scene("res://Cenas/Interface do Usuário/Dialogo.tscn")
	elif Global.Progresso == 7:
		$idealizar_pec.disabled = false
	elif Global.Progresso == 8: 
		$idealizar_pec.disabled = true
		$imprensa.disabled = false
	elif Global.Progresso == 9: 
		$imprensa.disabled = true


func _process(delta):
	pass


func _on_idealizar_pec_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Botões/Ideia_Novo.tscn")

func _on_voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn")

func _on_imprensa_pressed():
	if Global.PEC_Escolhida == 0: 
		get_tree().change_scene("res://Instruct_Minigames.tscn")
