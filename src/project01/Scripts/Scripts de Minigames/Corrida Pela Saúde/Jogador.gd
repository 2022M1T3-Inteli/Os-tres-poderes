extends KinematicBody2D

var pontos = 0 
	## Variável para manter conta dos pontos.  


var velocidade = Vector2.ZERO 
	## Criamos a variável velocidade, e como o jogo é um "auto-runner" (corre automaticamente), nós queremos que a velocidade inicial seja 0, logo, utilizamos do Vector2, que é a referÊncia cartesiana do Godot.

export var forca_pulo = 650.0
export var gravidade = 25.0
	## Utilizamos variáveis exportadas pois queremos alterar elas sem ter que voltar no script, fazendo assim com que elas possam ser alteradas diretamente pelo "Inspector", embaixo de "Script Variables". Esse método é de comum utilidade em testes. 



enum {
	## enum é a função de enumerador. Estamos utilizando dela para fazer 3 estados possíveis em que o jogador pode se encontrar; Pulando, Correndo ou no meio do ar.
	PULAR,
	CORRER,
	AR
}

var estado = CORRER
## O jogador começa o jogo no estado de correr. 

onready var animacao = $AnimatedSprite
	## Identificamos o nó de animação no código utilizando o símbolo do sifrão e o guardamos em uma variável

func _ready():
	Global.connect("recompensar", self, "recompensar")
		## Aqui conectamos o script do jogador ao sinal recompensa, ou seja, toda vez que esse sinal for emitido, esse script vai receber. Aplicamos ele nele mesmo, "self". E, ao receber esse sinal, acionamos a função "recompensar".

	Global.connect("morreu", self, "morreu")
		## Mesma coisa do código acima, porém para o sinal de morrer. 
func _physics_process(delta):
	## Função do Godot que cuida das propriedades físicas de acordo com o FPS (Frames por segundo)
	match estado: 
		## Aqui definimos o que cada estado fará em questão de código
		CORRER: 
			animacao.play("Corrida")
				## Animação para o personagem correr. 
		PULAR: 
			velocidade = Vector2.ZERO
				## Aqui, é bom ter um reset da velocidade, para que o pulo não saia como algo na diagonal.
			velocidade.y -= forca_pulo
				## Como já foi explicado, o plano cartesiano se encontra "invertido" então, para irmos para cima, precisamos subtrair a força do pulo. 
			animacao.play("Pulo")
				## Utilizamos o bloco de animação que foi criado no Animated Sprite > Frames > Sprite Frames, e chamado de "Pulo". 
			estado = AR
				## Se o jogador pulou, ele está no meio do ar. 
		AR:
			pass
	velocidade.y += gravidade
		## Em 2D, graças a inversão do Godot, caso tenhamos um y positivo, nosso personagem se encontrará na direção abaixo, e caso negativo, ele se encontrará acima. Logo, o efeito da gravidade será positivo ao invés de negativo, então utilizamos a soma. 
	move_and_collide(velocidade * delta)
		## O "move_and_collide" serve para realizar o movimento do personagem, e aqui, multiplicamos a velocidade pelo delta, que é uma maneira de fazer com que a velocidade escale de acordo com o FPS

func _input(event):
	## Detecta qualquer input que entra, dentro de seu próprio loop no Godot. Aqui, estamos utilizando ela para eventos, com a função básica de assistir aos botões do teclado. 
	if estado == CORRER:
		## Se o jogador estiver no chão
		if event.is_action_pressed("Pulo"):
			$jump.play()
			## Adicionamos uma condição que faz com que toda vez que o botão de pulo (configurado no menu Project > Project Settings > Input Map) for pressionado, algo aconteça.
			estado = PULAR
				## Se o jogador pressionar o botão de pular, ele está pulando. 


func _on_Pes_body_entered(body):
	## Aqui, o nó "Pes" checa se algum outro corpo de colisão entrou em contato com ele. Neste caso, o nó representa o pé do jogador. E nossa intenção é saber se os pés dele estão no chão. 
	if body is StaticBody2D:
		## Aqui nós checamos se o corpo que está em contato com os pés do jogador é o StaticBody2D, que, na cena "Frente" representa a caixa de colisão do chão. 
		estado = CORRER
			## Se os pés estão no chão, o jogador está correndo.

func _on_Pes_body_exited(body):
	## Aqui, o nó "Pes" checa se algum corpo que estava em colisão com ele deixou de estar. Neste caso, o nó representa o pé do jogador. E nossa intenção é saber se os pés dele sairam do chão. 
	if body is StaticBody2D:
		#$aguamusic.play()
		## Aqui nós checamos se o corpo que parou de entrar em contato com os pés do jogador é o StaticBody2D, que, na cena "Frente" representa a caixa de colisão do chão. 
		estado = PULAR
			## Se os pés estiverem no ar, o jogador está pulando. 

func recompensar(addponto):
	$aguamusic.play()
	## Função para recompensar o jogador por pegar uma água.  
	pontos += addponto
		## Aqui, somamos cada ponto para a pontuação. Somente aciona com o sinal.  
	Global.emit_signal("pontuar", pontos)
		## Emite o sinal de pontuar para ser possível atualizá-lo. 
	Global.pontosminigame = pontos
	if pontos <= 30: 
		Global.pontostotal = pontos * 0.1

func morreu():
	## Função para remover o jogador do jogo. 
	queue_free()
		## Remove o jogador da cena, somente aciona com o sinal.
	Global.etapa2 = true
	print(Global.pontosminigame) 
	print(Global.pontostotal)


func _process(delta):
	if Global.aguamusic: 
		$aguamusic.play()
		Global.aguamusic = false
	if Global.morreumusic:
		$morreumusic.play()
		Global.morreumusic = false
