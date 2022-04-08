extends Node2D

export (Array, PackedScene) var cenas
	## Aqui criamos uma variável export, onde temos um array do tipo PackedScene. Isso vai nos permitir arrastar cenas para o Inspector.

func _ready():
	Global.connect("morreu", self, "sumiu")

var cena_aleatoria = RandomNumberGenerator.new()
var indice_cena_selecionada = 0 
	## Variáveis auto explicatórias. 

func _on_Timer_timeout(): 
	cena_aleatoria.randomize()
		## Atribui uma semente aleatória ao chamar a função randomize. 
	indice_cena_selecionada = cena_aleatoria.randi_range(0, cenas.size()-1)
	## Aqui utilizamos o indice para guardar o numero da cena selecionada, e armazenamos nela um número aleatório inteiro (rand = random, i = integer), entre 0 e quantas cenas tivermos - 1 para conseguirmos o número exato de cenas. 
	var tmp = cenas [indice_cena_selecionada].instance()
	## Aqui utilizamos uma variável temporária (tmp), e instanciamos a cena, que foi inserida dentro do array "cenas" no inspector, a cena escolhida será de acordo com o índice. 
	add_child_below_node(self, tmp)

func sumiu():
	queue_free()
