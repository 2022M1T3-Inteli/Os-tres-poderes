extends "res://Scripts/MovimentoRolamento.gd"
## Aqui utilizamos do Script comum a todos os objetos que se movem para cortar a base "comum" entre eles. 

func _physics_process(delta):
	## Função do Godot que cuida das propriedades físicas de acordo com o FPS (Frames por segundo)
	mover()
	## Função do script "MovimentoRolamento.gd"

func _on_Pegou_body_entered(body):
	## Detecta se algo entrou em contato com a água
	if body.name == "Jogador":
		## Checa se é o jogador que esta tocando, para ter a certeza de que é o jogador que esta tocando a água e não outra coisa. 
		Sinais.emit_signal("recompensar", 10)
			## Emite o sinal para recompensar o jogador. Emitindo esse sinal, permite a outros scripts que utilizam desse chamado, alterar suas propriedades de acordo com os parâmetros. 
		queue_free()
			## Faz a água desaparecer quando for pega pelo Jogador. 

func _on_VisibilityNotifier2D_screen_exited():
	# VisibilityNotifier2D cuida da visibilidade de um objeto na tela, e o Screen Exited é a função que acontece especificamente quando um objeto (após entrar na tela) sai da tela. 
	queue_free()
		## Faz a água desaparecer quando não estiver na tela. 
	


