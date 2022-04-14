extends Control

onready var player = $Jogador
onready var inimigos = $Inimigos
onready var certa = $"Resposta Certa"
onready var errada1 = $"Resposta Errada"
onready var errada2 = $"Resposta Errada"
onready var expansao = $"Resposta Expandida"
onready var pergunta = $Pergunta
onready var explicar = $Explicar

var HPJogador  = 100
var HPInimigo = 100
var dano =  50
var acertou = 0
var atual
var passadas = []
var alt1
var alt2 
var alt3 

func _ready():
	get_node("Jogador/HP").value = HPJogador
	get_node("Inimigos/HP").value = HPInimigo
	##get_node("Inimigos/Nome").text = Global.comissao_atual
	proxima_questao()

func _process(delta):
	get_node("Pergunta/Texto").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["pergunta"])
	get_node("Resposta Certa/Texto").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["respostas"][alt1])
	get_node("Resposta Errada/Texto").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["respostas"][alt2])
	get_node("Resposta Errada2/Texto").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["respostas"][alt3])

func _on_EscolhaErrada2_pressed():
	if self.has_node("Inimigos"):
		if dano > 0:
			expansao.show()
			certa.hide()
			errada1.hide()
			errada2.hide()
			acertou = alt3
			get_node("Resposta Expandida/Expansão").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["expandidas"][alt3])

func _on_EscolhaCerta_pressed():
	if self.has_node("Inimigos"):
		if dano > 0:
			expansao.show()
			certa.hide()
		errada1.hide()
		errada2.hide()
		acertou = alt1
		get_node("Resposta Expandida/Expansão").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["expandidas"][alt1])

func _on_EscolhaErrada1_pressed():
	if self.has_node("Inimigos"):
		if dano > 0:
			expansao.show()
			certa.hide()
			errada1.hide()
			errada2.hide()
			acertou = alt2
			get_node("Resposta Expandida/Expansão").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["expandidas"][alt2])

func _on_Aceitar_pressed():
	get_node("Resposta Expandida").hide()
	explicar.show()
	get_node("Explicar/Texto").text = String(Global.comissoes[Global.comissao_atual][Global.pergunta_atual]["justificativa"][acertou])
	pergunta.hide()
	if acertou > 0:
		if HPJogador > 0:
			HPJogador = (HPJogador - dano)
			expansao.hide()
			if HPJogador <= 0: 
				dano = 0
				player.queue_free()
			get_node("Jogador/HP").value = HPJogador
	else: 
			if dano > 0 :
				HPInimigo = (HPInimigo - dano)
				expansao.hide()
				if HPInimigo <= 0 :
					dano = 0
					inimigos.queue_free()
				get_node("Inimigos/HP").value = HPInimigo

func _on_Recusar_pressed():
	expansao.hide()
	certa.show()
	errada1.show()
	errada2.show()
	acertou = 3 

func proxima_questao(): 
	if HPInimigo < 50 :
		get_tree().change_scene("res://vitoria.tscn")
	#	get_tree().change_scene("res://derrota_vitoria.tscn")
	if HPJogador < 50 :
		get_tree().change_scene("res://derrota_vitoria.tscn")
	if passadas.has(1) and passadas.has(2):
		
		print("kkkk")
		
	else:
		var pergunta = RandomNumberGenerator.new()
		pergunta.randomize()
		var pergunta_selecionada = pergunta.randi_range(1, 2)
		while passadas.has(pergunta_selecionada):
			pergunta.randomize()
			pergunta_selecionada = pergunta.randi_range(1, 2)
		passadas.append(pergunta_selecionada)
		Global.pergunta_atual = pergunta_selecionada
		var respostas = RandomNumberGenerator.new()
		respostas.randomize()
		alt1 = respostas.randi_range(0, 2)
		var respassadas = []
		respassadas.append(alt1)
		if respassadas.has(alt1):
			respostas.randomize()
			alt2 = respostas.randi_range(0, 2)
			while respassadas.has(alt2): 
				respostas.randomize()
				alt2 = respostas.randi_range(0, 2)
			respassadas.append(alt2)
			if respassadas.has(alt2):
				respostas.randomize()
				alt3 = respostas.randi_range(0, 2)
				while respassadas.has(alt3):
					respostas.randomize()
					alt3 = respostas.randi_range(0, 2)
				respassadas.append(alt3)

func _on_Explicar_pressed():
	explicar.hide()
	pergunta.show()
	certa.show()
	errada1.show()
	errada2.show()
	proxima_questao()
