extends RichTextLabel

func _ready():
	Sinais.connect("pontuar", self, "atualizarpontos")
	
func atualizarpontos(pontos):
	self.text = String(pontos)
		## Conecta ao sinal de pontuar. 
