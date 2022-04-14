extends Control

var desligado = false

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn")

func _process(delta):
	if Global.apoio: 
		$"Conteúdos/Site".text = Global.midia[Global.PEC_Escolhida]["Apoio"]["Site"]
		$"Conteúdos/Titulo".text = Global.midia[Global.PEC_Escolhida]["Apoio"]["Titulo"]
		$"Conteúdos/Contexto".text = Global.midia[Global.PEC_Escolhida]["Apoio"]["Contexto"]
		$"Conteúdos/Resultado".texture = Global.NPC[Global.Presidente]["Apoio"]["Sim"]
	else: 
		$"Conteúdos/Site".text = Global.midia[Global.PEC_Escolhida]["Contra"]["Site"]
		$"Conteúdos/Titulo".text = Global.midia[Global.PEC_Escolhida]["Contra"]["Titulo"]
		$"Conteúdos/Contexto".text = Global.midia[Global.PEC_Escolhida]["Contra"]["Contexto"]
		$"Conteúdos/Resultado".texture = Global.NPC[Global.Presidente]["Apoio"]["Não"]


func _on_Power_pressed():
	if desligado == true: 
		$Power.texture_normal = load("res://Recursos/botoes/Power_off.png")
		$Background.texture = load("res://Recursos/Planos de Fundo/computador.png")
		$"Conteúdos".show()
		desligado = false
	else:
		$Power.texture_normal = load("res://Recursos/botoes/Power_on.png")
		$Background.texture = load("res://Recursos/Planos de Fundo/1.png")
		$"Conteúdos".hide()
		desligado = true

