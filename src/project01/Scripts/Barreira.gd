extends "res://Scripts/MovimentoRolamento.gd"
## Aqui utilizamos do Script comum a todos os objetos que se movem para cortar a base "comum" entre eles. 

func _physics_process(delta):
	## Função do Godot que cuida das propriedades físicas de acordo com o FPS (Frames por segundo)
	mover()
	## Função do script "MovimentoRolamento.gd"


func _on_Dano_body_entered(body):
	## Detecta se algo entrou em contato com a água
	if body.name == "Jogador":
		## Checa se é o jogador que esta tocando, para ter a certeza de que é o jogador que esta tocando a barreira e não outra coisa. 
		Sinais.emit_signal("morreu")
		## Emite o sinal para matar o jogador. Emitindo esse sinal, permite a outros scripts que utilizam desse chamado, alterar suas propriedades de acordo com os parâmetros. 
		queue_free()
		## Remove o objeto do jogo, quando o jogador morre.


func _on_VisibilityNotifier2D_screen_exited():
	# VisibilityNotifier2D cuida da visibilidade de um objeto na tela, e o Screen Exited é a função que acontece especificamente quando um objeto (após entrar na tela) sai da tela. 
	queue_free()
		## Faz a barreira desaparecer quando não estiver na tela. 


