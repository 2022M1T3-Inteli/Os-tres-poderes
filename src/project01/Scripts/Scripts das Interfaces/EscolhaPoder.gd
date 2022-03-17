extends Control

func _on_PE_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Executivo.tscn") 
	#Escolhe o poder Executivo

func _on_PL_pressed():
	if Global.etapa2:
		get_tree().change_scene("res://Cenas/Poderes/Legislativo/Legislativo.tscn") 
		#Escolhe o poder Legislativo

func _on_PJ_pressed():
	if Global.etapa2:
		get_tree().change_scene("res://Cenas/Poderes/Juridico/Jurídico.tscn") 
		#Escolhe o poder Jurídico 

func _on_voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/MainMenu.tscn")
