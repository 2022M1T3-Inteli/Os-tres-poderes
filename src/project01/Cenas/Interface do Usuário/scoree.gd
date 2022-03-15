extends Label

func _process(delta):
	self.text = str(Global.scoree)

func _ready():
	Sinais.connect("pontuar", self, "atualizarpontos")
		Global.score += 0.3
			print(show)
