extends Control


func _ready():
	Sinais.connect("morreu", self, "fimdejogo")
	## Recebe o sinal que o jogador morreu


func _on_Button_pressed():
	get_tree().reload_current_scene()
	## O botão recarrega o jogo

func fimdejogo():
	self.show()
	## O botão de reset fica escondido até o jogador morrer. 
