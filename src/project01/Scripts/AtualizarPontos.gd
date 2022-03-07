extends RichTextLabel


func _ready():
	Sinais.connect("pontuar", self, "atualizarpontos")
		## Conecta ao sinal de pontuar. 

func atualizarpontos(pontos):
	self.text = String(pontos)
		## Para alterar o numero do display, ele precisa ser convertido para uma string. 
	if pontos > 9:
		self.rect_position.x = 410
