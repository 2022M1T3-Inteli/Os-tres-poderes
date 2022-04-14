extends Control

func _ready():
	$Juiz.texture = Global.NPC[Global.Conselheiro]["Frente"]["Half"]

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn") #Botão de voltar


func _on_Dados_Gerais_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/MenuDados.tscn") 
		#altera para a cena onde será mostrado os dados do minigame
