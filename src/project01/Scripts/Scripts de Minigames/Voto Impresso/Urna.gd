extends Node2D

var vel = 10

func _process(_delta):
	
	var dirX = 0
	var dirY = 0
	var pontos = 0

	if Input.is_action_pressed ("ui_left"):
		dirX += -1
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	#quando clica nas teclas para o lado e direita, movimenta a urna
	
	translate (Vector2 (dirX,dirY) * vel)
	#movimenta a nave nos eixos X e Y, multiplicando por um valor
	
	global_position.x = clamp (global_position.x, 115, 1150)
	#faz com que o limite da urna seja o limite da tela
	
func _on_Area2D_area_entered(area):
	$Timer.start()
	$Som_colisao_voto.play() 
	#quando a urna bate no voto, solta um temporizador que indica o som de contato
	
#em Area2D --> Collision: colocar a layer para simbolizar quem representa (project settings -->
#layer name --> 2D physics --> layers. Colocando quem possui collision shape.
#já em Mask, coloca em quem aquela layer bate (ex: layer = voto; mask = urna).


func _on_Timer_timeout():
	$Som_colisao_voto.stop()
	$Timer.stop()
	#ao acabar o tempo da música, definido no Inspector --> wait time do Time, desliga ele
	#e a música
