extends Node2D

onready var player = $Presidente
#variavel 1 para o player 1
onready var player2 = $Com1
#variavel 2 para o player 2
onready var rpcerta = $"Resposta Certa"
onready var rperrada1 = $"Resposta Errada 1"
onready var rperrada2 = $"Resposta Errada 2"
onready var pcex = $PerguntaExpandida
onready var textrpc = $TextoRPC
onready var pergunta = $Pergunta
onready var textperg = $TextoPergunta
onready var textrpe1 = $TextoRPE1
onready var textrpe2 = $TextoRPE2
onready var pe1ex = $PerguntaExpandida2
onready var pe2ex = $PerguntaExpandida3
onready var rcex = $RespostaExpandida1
onready var re1ex = $RespostaExpandida2
onready var re2ex = $RespostaExpandida3

var  vida  = 100
var vida2 = 100
var dano =  33
var rpescolhida = 0 

func _ready():
	get_node("VidaJogador").value = vida
	get_node("VidaOponente").value = vida2

func _input(event):
	if event.is_action_pressed("sair"):
		get_tree().reload_current_scene()
		DebateGlobal.aceitar = false

func _process(delta):
	if rpescolhida == 1: 
		if DebateGlobal.aceitar == true:
			if self.has_node("Com1"):
				if dano > 0 :
					vida2 = (vida2 - dano)
				if vida2 <= 66 :
					dano = 0
					player2.queue_free()
				get_node("VidaOponente").value = vida2
				print("vidaopp =", vida2)
				rcex.show()
				pcex.hide()
				rpcerta.hide()
				textrpc.hide()
				pergunta.hide()
				textperg.hide()
	elif rpescolhida == 2 or rpescolhida == 3: 
			if DebateGlobal.aceitar == true:
				if self.has_node("Presidente"):
					if dano > 0:
						vida = (vida - dano)
					if vida <= 0: 
						dano = 0
						player.queue_free()
					get_node("VidaJogador").value = vida
					if rpescolhida == 2: 
						pe1ex.hide()
						rperrada1.hide()
						textrpe1.hide()
						re1ex.show()
					if rpescolhida == 3:
						pe2ex.hide()
						rperrada2.hide()
						textrpe2.hide()
						re2ex.show()
					pergunta.hide()
					textperg.hide()

func _on_Resposta_Certa_pressed():
	rperrada1.hide()
	rperrada2.hide()
	pcex.show()
	textrpe1.hide()
	textrpe2.hide()
	rpescolhida = 1 

func _on_Resposta_Errada_1_pressed():
	rpcerta.hide()
	rperrada2.hide()
	textrpc.hide()
	textrpe2.hide()
	pe1ex.show()
	rperrada1.rect_position.x = 334 
	rperrada1.rect_position.y = 239
	textrpe1.rect_position.x = 394
	textrpe1.rect_position.y = 284
	rpescolhida = 2


func _on_Resposta_Errada_2_pressed():
	rpcerta.hide()
	rperrada1.hide()
	textrpc.hide()
	textrpe1.hide()
	pe2ex.show()
	rperrada2.rect_position.x = 334
	rperrada2.rect_position.y = 239
	textrpe2.rect_position.x = 394
	textrpe2.rect_position.y = 284
	rpescolhida = 3
