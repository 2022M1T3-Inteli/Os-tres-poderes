extends Control

func _ready():
	pass

func _on_Button2_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoder.tscn") #Botão de voltar


func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Juridico/Botões Jurídico/Pergunta1.tscn") 
		#altera para a cena onde será mostrado os dados do minigame
