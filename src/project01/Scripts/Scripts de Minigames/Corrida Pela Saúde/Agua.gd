extends "res://Scripts/Scripts de Minigames/Corrida Pela Saúde/MovimentoRolamento.gd"
## Aqui utilizamos do Script comum a todos os objetos que se movem para cortar a base "comum" entre eles. 

func _physics_process(delta):
	## Função do Godot que cuida das propriedades físicas de acordo com o FPS (Frames por segundo)
	mover()
	#$aguamusic.play()
	## Função do script "MovimentoRolamento.gd"

func _on_Pegou_body_entered(body):
	## Detecta se algo entrou em contato com a água
	if body.name == "Jogador":
	
		## Checa se é o jogador que esta tocando, para ter a certeza de que é o jogador que esta tocando a água e não outra coisa. 
		Global.emit_signal("recompensar", 1)
			## Emite o sinal para recompensar o jogador. Emitindo esse sinal, permite a outros scripts que utilizam desse chamado, alterar suas propriedades de acordo com os parâmetros. 
		queue_free()
			## Faz a água desaparecer quando for pega pelo Jogador. 
		$pick_sound.play()
		#Signals.emit_signal("rewardplayer", 1)
		#yield (pick_sound, 'null' )
		queue_free()
		
func _on_VisibilityNotifier2D_screen_exited():
	# VisibilityNotifier2D cuida da visibilidade de um objeto na tela, e o Screen Exited é a função que acontece especificamente quando um objeto (após entrar na tela) sai da tela. 
	queue_free()
		## Faz a água desaparecer quando não estiver na tela. 
	#extends "res://Scripts/ScrollMovement.gd"

onready var pick_sound = $aguamusic

#func _physics_process(delta):
#	move()


func _on_Pickup_body_entered(body):
	#if body.name == "Player":
	#	self.hide()
		pick_sound.play()
#		Signals.emit_signal("rewardplayer", 1)
#		yield (pick_sound, "finished")
#		queue_free()


#func _on_VisibilityNotifier2D_screen_exited():
	#queue_free()
