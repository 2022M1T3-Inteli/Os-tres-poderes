extends Control

var time = 30
#O tempo do Timer
func _ready():
	pass
func _process(delta):
	if time == 0:
		self.show()
		get_tree().paused = true
	#faz a cena aparecer quando a variável (o Timer) chegar a 0
	#faz com que, quando time chegar em 0, o jogo inteiro pause (menos o fundo que é shader).
	#Com isso, necessita que o botão de voltar esteja com processamento, então vamos em:
	# Botão voltar menu --> Inspector --> Node --> pause mode --> process
	$Numero_pontuacao.text = String(Global.pontuacao)
	#escreve na caixinha a pontuação obtida
	
func _on_Temporizador_timeout():
	if time > 0:
		time -= 1
	#Para o temporizador começar a funcionar, tem que ativar o autostart em seu Inspector!
	#Assim, ele já começa a rodar com o jogo e realiza a subtração da variável, sendo que
	#a cada segundo o timer perde um segundo, até o 0
	

func _on_Voltar_menu_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Executivo.tscn")
	Global.etapa2 = true
	#colocar para onde a cena vai 



