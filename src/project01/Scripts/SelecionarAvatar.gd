extends Control

onready var candidato_visual = $"Candidato Selecionado"

var conselheiro_selecionado 
var candidato_selecionado = "Homem_Branco"

func _ready():
	pass

func _on_MulherBranca_mouse_entered():
	candidato_selecionado = "Mulher_Branca"


func _on_HomemNegro_mouse_entered():
	candidato_selecionado = "Homem_Negro"


func _on_MulherNegra_mouse_entered():
	candidato_selecionado = "Mulher_Negra"


func _on_HomemBranco_mouse_entered():
	candidato_selecionado = "Homem_Branco"

func _process(delta):
	candidato_visual.texture = Global.NPC[candidato_selecionado]["Lado"]["Half"]

func _on_HomemBranco_pressed():
	selecionar_candidato()

func _on_MulherNegra_pressed():
	selecionar_candidato()

func _on_HomemNegro_pressed():
	selecionar_candidato()

func _on_MulherBranca_pressed():
	selecionar_candidato()

func selecionar_candidato(): 
	if candidato_selecionado == "Homem_Branco":
		$VBoxContainer/HBoxContainer/HomemBranco.queue_free()
	elif candidato_selecionado == "Mulher_Negra":
		$VBoxContainer/HBoxContainer/MulherNegra.queue_free()
	elif candidato_selecionado == "Homem_Negro": 
		$VBoxContainer/HBoxContainer2/HomemNegro.queue_free()
	elif candidato_selecionado == "Mulher_Branca":
		$VBoxContainer/HBoxContainer2/MulherBranca.queue_free()
	if conselheiro_selecionado == true: 
		Global.Presidente = candidato_selecionado
		Global.Progresso = 1
		get_tree().change_scene("res://Cenas/Interface do Usuário/Dialogo.tscn")
	else:
		proxima_selecao()
		Global.Conselheiro = candidato_selecionado

func proxima_selecao():
	$"Candidato Passado".show()
	$"Candidato Passado".texture = Global.NPC[candidato_selecionado]["Lado"]["Hidden"]["Quarter"]
	$"Nome do Selecionado".texture = load("res://Recursos/Textos e Diálogos/presidente.png")
	conselheiro_selecionado = true

