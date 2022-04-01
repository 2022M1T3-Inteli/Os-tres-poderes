extends Node2D

#em Area2D --> Collision: colocar a layer para simbolizar quem representa (project settings -->
#layer name --> 2D physics --> layers. Colocando quem possui collision shape.
#já em Mask, coloca em quem aquela layer bate (ex: layer = voto; mask = urna).
export var vel = 100.0
#para poder mudar a velocidade de outros votos no script variable, no Inspector do Votos
var velY = rand_range(5, 8)
#a velocidade que cai varia de vinte a sessenta, aleatoriamente
var velX = rand_range(-3, 3)
var chosen = 0

func _ready(): 
	randomize()
	for a in $Votos.get_children():
		a.visible = false
	#deixa todos os votos invisíveis
	chosen = (randi() % $Votos.get_child_count()) + 1
	#randi gera um valor de 0 até o número de sprites dentro de votos (pela %, que é o 
	#o que limita o resultado até o limite númerico das sprites)
	
	#get_node("Votos/Vote-" + str (chosen)).visible = true ##caso dê ruim o de baixo
	var node = get_node("Votos/Vote_" + str(chosen))
	node.visible = true
	#Torna visível a sprite que completa o valor de Vote-"X"
	
	for b in $Area2D.get_children():
		b.disabled = true
	#deixa as collisionShapes dos votos desabilitadas
	var collision_shape = get_node("Area2D/CollisionShape2D_" + str (chosen))
	collision_shape.disabled = false
	#habilitamos o collision shape somente do voto sorteado
	
func _process(delta):
	translate(Vector2 (velX, velY))	
	if self.global_position.x >=700 or self.global_position.x <= 330:
		velX = -velX
		#aqui estamos configurando para, quando o voto sair da tela, rebater
	if self.global_position.y >= 680:
		queue_free()
		#quando o voto chega em certa altura fora da tela, ele some para não sobrecarregar
		
func _on_Area2D_area_entered(area):
	Global.pontuacao += 1
	queue_free()

