extends Control

onready var pontosfinais = $"HBoxContainer/Valor_Pontuação"

func _ready():
	Sinais.connect("morreu", self, "fimdejogo")
	## Recebe o sinal que o jogador morreu
	Sinais.connect("pontuar", self, "atualizarpontos")

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Executivo.tscn")
	## O botão recarrega o jogo
	Global.etapa2 = true

func fimdejogo():
	self.show()
	## O botão de reset fica escondido até o jogador morrer. 

func atualizarpontos(pontos):
	pontosfinais.text = String(pontos)
		## Conecta ao sinal de pontuar. 
