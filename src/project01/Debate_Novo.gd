extends Control

var questao_atual
var fase_atual

func _ready():
	$presidente.texture = Global.NPC[Global.Presidente]["Lado"]["Half"]
	$conselheiro.texture_normal = Global.NPC[Global.Conselheiro]["Lado"]["Hidden"]["Half"]
	$conselheiro.texture_hover = Global.NPC[Global.Conselheiro]["Lado"]["Half"]
	if Global.Progresso == 11: 
		questao_atual = 0
		fase_atual = "Deputados"
	elif Global.Progresso == 14: 
		questao_atual = 1 
		fase_atual = "Deputados"
		$primeira_instancia.texture = load("res://Recursos/Objetos/primeira_instancia_correto.png")
		$"segunda instancia".texture = load("res://Recursos/Objetos/segunda_instancia_normal.png")
	elif Global.Progresso == 19:
		questao_atual = 2
		fase_atual = "Senadores"
	elif Global.Progresso == 23: 
		questao_atual = 3 
		fase_atual = "Senadores"
		$primeira_instancia.texture = load("res://Recursos/Objetos/primeira_instancia_correto.png")
		$"segunda instancia".texture = load("res://Recursos/Objetos/segunda_instancia_normal.png")
	$Pergunta.text = Global.perguntas_debate[Global.PEC_Escolhida][fase_atual][questao_atual]
	


func _on_popular_pressed():
	Global.carregar_resposta = Global.respostas_debate[Global.PEC_Escolhida]["Popular"][questao_atual]
	Global.carregar_react = "Popular"
	get_tree().change_scene("res://Debate_Dialogo.tscn")
	Global.Progresso += 1


func _on_governamental_pressed():
	Global.carregar_resposta = Global.respostas_debate[Global.PEC_Escolhida]["Governamental"][questao_atual]
	Global.carregar_react = "Governamental"
	get_tree().change_scene("res://Debate_Dialogo.tscn")
	Global.Progresso += 1


func _on_constitucional_pressed():
	Global.carregar_resposta = Global.respostas_debate[Global.PEC_Escolhida]["Constitucional"][questao_atual]
	Global.carregar_react = "Constitucional"
	get_tree().change_scene("res://Debate_Dialogo.tscn")
	Global.Progresso += 1
