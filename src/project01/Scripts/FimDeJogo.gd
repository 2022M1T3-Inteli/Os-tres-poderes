extends Control


func _ready():
	Sinais.connect("morreu", self, "fimdejogo")
	## Recebe o sinal que o jogador morreu


func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Cenas Principais/Executivo.tscn")
	## O botão recarrega o jogo

func fimdejogo():
	self.show()
	## O botão de reset fica escondido até o jogador morrer. 
