extends Control

var velocidade_dialogo = .001

var mensagem_atual
var display = ""
var letra_atual = 0

var texto = 0
var skip

var conselheiro_dialogo
var presidente_dialogo

var numero_questoes = 0
var resposta_escolhida = 0

var progresso_atual = Global.Progresso

var texto_final 
var resposta_final = 0
var mensagem_final


func _ready():
	dialogar()

func _process(delta):
	if mensagem_atual == "Apresentação" or mensagem_atual == "AcompanhamentoP1": 
		if $Frase.text == Global.conselheiro_dialogo["AcompanhamentoP1"][1]:
			$Background.texture = load("res://Recursos/Planos de Fundo/praca_1vez_ano.png")
		elif $Frase.text == Global.conselheiro_dialogo["AcompanhamentoP1"][2]:
			$Background.texture = load("res://Recursos/Planos de Fundo/praca_1vez_atual.png")
		elif $Frase.text == Global.conselheiro_dialogo["AcompanhamentoP1"][3]:
			$Background.texture = load("res://Recursos/Planos de Fundo/praca_1vez_disponiveis.png")
		elif $Frase.text == Global.conselheiro_dialogo["AcompanhamentoP1"][8]:
			$Background.texture = load("res://Recursos/Planos de Fundo/praca_exec1vez.png")
		else: 
			$Background.texture = load("res://Recursos/Planos de Fundo/praca_1vez.png")
	if mensagem_atual == "AcompanhamentoP2": 
		$Background.texture = load("res://Recursos/Planos de Fundo/exec_1_vez.png")

func dialogar():
	if progresso_atual >= 1: 
		conselheiro_dialogo = true
		presidente_dialogo = false
		if progresso_atual == 1:
			mensagem_atual = "Introdução"
		elif progresso_atual == 2:
			mensagem_atual = "Tutorial"
		elif progresso_atual == 3:
			mensagem_atual = "Apresentação"
		elif progresso_atual == 4: 
			mensagem_atual = "AcompanhamentoP1"
		elif progresso_atual == 5: 
			Global.Progresso = progresso_atual
			get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoderes.tscn")
		elif progresso_atual == 6:
			mensagem_atual = "AcompanhamentoP2" 
		elif progresso_atual == 7: 
			Global.Progresso = progresso_atual
			get_tree().change_scene("res://Cenas/Poderes/Executivo/executivo_novo.tscn")
	display = ""
	letra_atual = 0 
	arrumar_cena()
	$Escrever.set_wait_time(velocidade_dialogo)
	$Escrever.start()

func arrumar_cena(): 
	if conselheiro_dialogo == true: 
		$Dialogo_Presidente.hide()
		$Dialogo_Conselheiro.show()
		$Conselheiro.texture = Global.NPC[Global.Conselheiro]["Lado"]["Half"]
		$Presidente.texture = Global.NPC[Global.Presidente]["Lado"]["Hidden"]["Half"]
		$Botao_proximo.show()
	else: 
		if presidente_dialogo == false:
			$Dialogo_Conselheiro.hide()
			$Dialogo_Presidente.show()
			$Presidente.texture = Global.NPC[Global.Presidente]["Lado"]["Half"]
			$Conselheiro.texture = Global.NPC[Global.Conselheiro]["Lado"]["Hidden"]["Half"]
			$Botao_proximo.hide()
			escolhas_presidente()
		else: 
			$VBoxContainer/Op1.hide()
			$VBoxContainer/Op2.hide()
			$VBoxContainer/Op3.hide()
			$VBoxContainer/Op4.hide()
			$VBoxContainer/Op5.hide()

func _on_Escrever_timeout():
	if (letra_atual < len(Global.conselheiro_dialogo[mensagem_atual][texto])): 
		var proxima_letra = Global.conselheiro_dialogo[mensagem_atual][texto][letra_atual]
		display += proxima_letra
		$Frase.text = display
		letra_atual += 1
		skip = true
	else:
		skip = false

func proximo_dialogo():
	$Escrever.stop()
	if (mensagem_atual == mensagem_final and texto == texto_final and resposta_escolhida == resposta_final):
		conselheiro_dialogo = false
		arrumar_cena()
		escolhas_presidente()
	else:
		texto += 1
		dialogar()

func _input(event):
	if event.is_action_pressed("proximo"):
		if conselheiro_dialogo == true:
			if skip == true: 
				skip = false
				$Frase.text = Global.conselheiro_dialogo[mensagem_atual][texto]
				$Escrever.stop()
			else:
				mensagem_final = mensagem_atual
				resposta_final = resposta_escolhida
				if mensagem_atual == "Introdução":
					texto_final = 2
				elif mensagem_atual == "Tutorial":
					if resposta_escolhida == 0: 
						texto_final = 13
					elif resposta_escolhida == 1: 
						texto_final = 4
					elif resposta_escolhida == 2:
						texto_final = 8
					elif resposta_escolhida == 3 or resposta_escolhida == 4:
						texto_final = 12
				elif mensagem_atual == "Apresentação": 
					texto_final = 5
				elif mensagem_atual == "AcompanhamentoP1": 
					if resposta_escolhida == 0: 
						texto_final = 5
					elif resposta_escolhida == 1: 
						texto_final = 1
					elif resposta_escolhida == 2: 
						texto_final = 2
					elif resposta_escolhida == 3 or resposta_escolhida == 4: 
						texto_final = 3
				elif mensagem_atual == "AcompanhamentoP2": 
					texto_final = 2
				proximo_dialogo()
		if presidente_dialogo == true: 
			conselheiro_dialogo = true
			presidente_dialogo = false
			arrumar_cena()
			if mensagem_atual == "Introdução": 
				if resposta_escolhida == 1: 
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][3]
					progresso_atual = 2
					texto = -1
					resposta_escolhida = 0
				else:
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][4]
					progresso_atual = 3
					texto = -1
					resposta_escolhida = 0
			elif mensagem_atual == "Tutorial": 
				if resposta_escolhida <= 4:
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][14]
				if resposta_escolhida == 1 or resposta_escolhida == 4: 
					texto = -1
				elif resposta_escolhida == 2: 
					texto = 4
				elif resposta_escolhida == 3: 
					texto = 8
				else: 
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][16]
					progresso_atual = 3
					texto = -1
			elif mensagem_atual == "Apresentação": 
				if resposta_escolhida == 1: 
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][6]
					progresso_atual = 4
					texto = -1
					resposta_escolhida = 0
				else:
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][7]
					progresso_atual = 5
					texto = -1
					resposta_escolhida = 0
			elif mensagem_atual == "AcompanhamentoP1": 
				if resposta_escolhida <= 3:
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][6]
				if resposta_escolhida == 1 or resposta_escolhida == 4: 
					texto = -1
				elif resposta_escolhida == 2: 
					texto = 1
				elif resposta_escolhida == 3: 
					texto = 2
				else: 
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][8]
					progresso_atual = 5
					texto = -1
			elif mensagem_atual == "AcompanhamentoP2": 
				if resposta_escolhida == 1: 
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][4]
					texto = -1
					progresso_atual = 7
					resposta_escolhida = 0
				else:
					$Frase.text = Global.conselheiro_dialogo[mensagem_atual][3]
					texto = -1
					resposta_escolhida = 0

func escolhas_presidente():
	$Frase.text = "(O que devo fazer?)"
	if (mensagem_atual == "Tutorial" and (resposta_escolhida >= 1 and resposta_escolhida < 5)):
		$Frase.text = Global.conselheiro_dialogo[mensagem_atual][15]
	elif (mensagem_atual == "Tutorial" and (resposta_escolhida >= 1 and resposta_escolhida < 5)):
		$Frase.text = Global.conselheiro_dialogo[mensagem_atual][7]
	numero_questoes = len(Global.presidente_dialogo[mensagem_atual])
	if numero_questoes >= 1:
		$VBoxContainer/Op1.show()
		$VBoxContainer/Op1/Resposta.text = Global.presidente_dialogo[mensagem_atual][1]["Escolha"]
	if numero_questoes >= 2: 
		$VBoxContainer/Op2.show()
		$VBoxContainer/Op2/Resposta.text = Global.presidente_dialogo[mensagem_atual][2]["Escolha"]
	if numero_questoes >= 3: 
		$VBoxContainer/Op3.show()
		$VBoxContainer/Op3/Resposta.text = Global.presidente_dialogo[mensagem_atual][3]["Escolha"]
	if numero_questoes >= 4: 
		$VBoxContainer/Op4.show()
		$VBoxContainer/Op4/Resposta.text = Global.presidente_dialogo[mensagem_atual][4]["Escolha"]
	if numero_questoes >= 5:
		$VBoxContainer/Op5.show()
		$VBoxContainer/Op5/Resposta.text = Global.presidente_dialogo[mensagem_atual][5]["Escolha"]

func resposta_presidente():
	$Frase.text = Global.presidente_dialogo[mensagem_atual][resposta_escolhida]["Dialogo"]
	$Botao_proximo.show()
	presidente_dialogo = true
	arrumar_cena()

func _on_Op1_pressed():
	resposta_escolhida = 1
	resposta_presidente()


func _on_Op2_pressed():
	resposta_escolhida = 2
	resposta_presidente()


func _on_Op3_pressed():
	resposta_escolhida = 3
	resposta_presidente()


func _on_Op4_pressed():
	resposta_escolhida = 4
	resposta_presidente()


func _on_Op5_pressed():
	resposta_escolhida = 5
	resposta_presidente()
