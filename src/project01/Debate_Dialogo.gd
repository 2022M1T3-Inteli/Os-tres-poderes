extends Control

func _ready():
	$presidente.texture = Global.NPC[Global.Presidente]["Lado"]["Half"]
	$conselheiro.texture_normal = Global.NPC[Global.Conselheiro]["Lado"]["Hidden"]["Half"]
	$conselheiro.texture_hover = Global.NPC[Global.Conselheiro]["Lado"]["Half"]
	if Global.Progresso == 10:
		$Texto.text = String(Global.perguntas_debate[Global.PEC_Escolhida]["Inicio"][0])
	if Global.Progresso == 12: 
		$Balao.texture = load("res://Recursos/Objetos/frase_pres.png")
		$Texto.text = Global.carregar_resposta
	if Global.Progresso == 15: 
		$Balao.texture = load("res://Recursos/Objetos/frase_pres.png")
		$Texto.text = Global.carregar_resposta
	if Global.Progresso == 18: 
		$Texto.text = String(Global.perguntas_debate[Global.PEC_Escolhida]["Inicio"][2])
	if Global.Progresso == 20:
		$Balao.texture = load("res://Recursos/Objetos/frase_pres.png")
		$Texto.text = Global.carregar_resposta
	if Global.Progresso == 24:
		$Balao.texture = load("res://Recursos/Objetos/frase_pres.png")
		$Texto.text = Global.carregar_resposta

func _input(event):
	if event.is_action_pressed("proximo"): 
		if Global.Progresso == 10: 
			get_tree().change_scene("res://Debate_Novo.tscn")
			Global.Progresso = 11
		elif Global.Progresso == 12: 
			$Balao.texture = load("res://Recursos/Objetos/frase_opos.png")
			$Texto.text = Global.react_debate[Global.PEC_Escolhida][Global.carregar_react][0]
			if Global.carregar_react == "Popular":
				Global.Progresso = 13
			else: 
				Global.deputado_falho = true
				Global.Progresso = -1
		elif Global.Progresso == 13: 
			$Texto.text = String(Global.perguntas_debate[Global.PEC_Escolhida]["Inicio"][1])
			Global.Progresso = 14 
		elif Global.Progresso == 14: 
			get_tree().change_scene("res://Debate_Novo.tscn")
		elif Global.Progresso == 15: 
			$Balao.texture = load("res://Recursos/Objetos/frase_opos.png")
			$Texto.text = Global.react_debate[Global.PEC_Escolhida][Global.carregar_react][1]
			if Global.carregar_react == "Constitucional":
				Global.Progresso = 16
			else:
				Global.deputado_falho = true
				Global.Progresso = -1
		elif Global.Progresso == 16: 
			$Texto.text = "A câmara decide que a PEC prosseguirá ao Senado."
			Global.Progresso = 17
		elif Global.Progresso == 17: 
			get_tree().change_scene("res://Cenas/Poderes/Legislativo/Menu.tscn")
		elif Global.Progresso == 18: 
			get_tree().change_scene("res://Debate_Novo.tscn")
			Global.Progresso = 19
		elif Global.Progresso == 20: 
			$Balao.texture = load("res://Recursos/Objetos/frase_opos.png")
			$Texto.text = Global.react_debate[Global.PEC_Escolhida][Global.carregar_react][2]
			if Global.carregar_react == "Popular":
				Global.Progresso = 21
			else:
				Global.senado_falho = true
				Global.Progresso = -1
		elif Global.Progresso == 21: 
			$Texto.text = String(Global.perguntas_debate[Global.PEC_Escolhida]["Inicio"][3])
			Global.Progresso = 22
		elif Global.Progresso == 22:
			get_tree().change_scene("res://Debate_Novo.tscn")
			Global.Progresso = 23
		elif Global.Progresso == 24: 
			$Balao.texture = load("res://Recursos/Objetos/frase_opos.png")
			$Texto.text = Global.react_debate[Global.PEC_Escolhida][Global.carregar_react][3]
			if Global.carregar_react == "Constitucional":
				Global.Progresso = 25
			else:
				Global.senado_falho = true
				Global.Progresso = -1
		elif Global.Progresso == 25: 
			$Texto.text = "O Senado decide que a PEC deverá ser promulgada."
			Global.Progresso = 26
		elif Global.Progresso == 26: 
			get_tree().change_scene("res://Cenas/Poderes/Legislativo/Menu.tscn")
			Global.Progresso = 27
		elif Global.Progresso == -1: 
			get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn")
