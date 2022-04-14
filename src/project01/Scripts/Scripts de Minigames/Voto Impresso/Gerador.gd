extends Node2D

const PRE_VOTO = preload ("res://Cenas/Poderes/Executivo/Minigames/Voto Impresso/Votos.tscn")

func _ready():
	restartTimer()

func _on_Spawn_voto_timeout():
	var caindo_voto = PRE_VOTO.instance()      
	add_child(caindo_voto)
	caindo_voto.global_position = Vector2(rand_range(380, 650), -60) 
	restartTimer()
	#essa função é executada após o tempo que o contador indica na func_ready
	#a posição global é de onde começa a spawmar, sendo que varia a posição de X


func restartTimer():
	$Spawn_voto.wait_time = rand_range(0.1, 0.5)
	$Spawn_voto.start ()
#faz com que entre 1 e 2 segundos, aleatoriamente, aconteça algo a ser dito.
#no caso, essa função é responsável por, sempre que der o tempo, dar um valor aleatório
#para a geração dos votos


