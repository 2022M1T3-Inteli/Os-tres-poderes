extends Control

onready var imprensa = $Imprensa

func _ready():
	Singleton.connect("Unlock", self, "desbloqueia")

func _on_Button4_pressed():
	get_tree().change_scene("res://Cenas/Cenas de IU/EscolhaPoder.tscn") #Botão de voltar


func _on_Ideia_pressed():
	get_tree().change_scene("res://Cenas/Cenas Principais/Ideia.tscn")

func desbloqueia():
	imprensa.show()


func _on_Imprensa_pressed():
	get_tree().change_scene("res://Cenas/CorridaSaude.tscn")
