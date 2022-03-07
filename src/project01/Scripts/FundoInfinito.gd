extends TextureRect


func _ready():
	Sinais.connect("morreu", self, "sumiu")

func sumiu(): 
	queue_free()
