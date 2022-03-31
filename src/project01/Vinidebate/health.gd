extends Control

onready var player = $Jogador
onready var inimigos = $Inimigos
onready var certa = $"Resposta Certa"
onready var errada1 = $"Resposta Errada"
onready var errada2 = $"Resposta Errada"
onready var expansao = $"Resposta Expandida"

var HPJogador  = 100
var HPInimigo = 100
var dano =  30
var acertou = 0
var atual
var passadas = []
var alt1
var alt2 
var alt3 

func _ready():
	get_node("Jogador/HP").value = HPJogador
	get_node("Inimigos/HP").value = HPInimigo
	get_node("Inimigos/Nome").text = Global.comissao_atual
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

func _on_EscolhaCerta_pressed():
	if self.has_node("Inimigos"):
		if dano > 0:
			expansao.show()
			certa.hide()
		errada1.hide()
		errada2.hide()
		acertou = alt1

func _on_EscolhaErrada1_pressed():
	if self.has_node("Inimigos"):
		if dano > 0:
			expansao.show()
			certa.hide()
			errada1.hide()
			errada2.hide()
			acertou = alt2

func _on_Aceitar_pressed():
	proxima_questao()
	if acertou > 0:
		if HPJogador > 0:
			HPJogador = (HPJogador - dano)
			expansao.hide()
			certa.show()
			errada1.show()
			errada2.show()
			if HPJogador <= 0: 
				dano = 0
				player.queue_free()
			get_node("Jogador/HP").value = HPJogador
	else: 
			if dano > 0 :
				HPInimigo = (HPInimigo - dano)
				expansao.hide()
				certa.show()
				errada1.show()
				errada2.show()
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
	if passadas.has(1) and passadas.has(2):
		pass
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
		var resposta1 = respostas.randi_range(0, 2)
		var respassadas = []
		respassadas.append(resposta1)
		if respassadas.has(resposta1):
			respostas.randomize()
			var resposta2 = respostas.randi_range(0, 2)
			while respassadas.has(resposta2): 
				respostas.randomize()
				resposta2 = respostas.randi_range(0, 2)
			respassadas.append(resposta2)
			if respassadas.has(resposta2):
				respostas.randomize()
				var resposta3 = respostas.randi_range(0, 2)
				while respassadas.has(resposta3):
					respostas.randomize()
					resposta3 = respostas.randi_range(0, 2)
				respassadas.append(resposta3)
				alt1 = resposta1
				alt2 = resposta2
				alt3 = resposta3
