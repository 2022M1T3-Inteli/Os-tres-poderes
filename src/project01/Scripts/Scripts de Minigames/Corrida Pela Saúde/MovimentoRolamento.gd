extends Node2D

export var velocidade_rolamento = 6.3
	## Aqui definimos a velocidade do rolamento, export var para que seja mais fácil alterá-la depois. 

func mover():
	## Função para que os objetos se movam. 
	self.position.x -= velocidade_rolamento
		## Atrelando a velocidade de rolamento ao eixo X. 
	
