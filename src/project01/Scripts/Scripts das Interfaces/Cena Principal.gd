extends Node2D

onready var texto = $"Caixa de Diálogo/MarginContainer/RichTextLabel"
onready var conselheiro = $Conselheiro
onready var trespoderes = $"Praça"

var textoatual = 0
var highplana = load("res://Recursos/Planos de Fundo/praça-hidden.png")
var highexec = load("res://Recursos/Planos de Fundo/praça-exec.png")
var highleg = load("res://Recursos/Planos de Fundo/praça-leg.png")
var highjud = load("res://Recursos/Planos de Fundo/praça-jud.png")

func _ready():
	conselheiro.texture = Global.conselheiro_dados[Global.conselheiro_escolhido]["Busto"]

func _input(event):
	if event.is_action_pressed("proximo"):
		textoatual += 1
		if Global.contexto_atual == "Introdução" and textoatual > 3: 
			Global.contexto_atual = "Planalto"
			trespoderes.show()
			textoatual = 0
		elif Global.contexto_atual == "Planalto" and textoatual > 4: 
			Global.contexto_atual = "Executivo"
			trespoderes.texture = highexec
			textoatual = 0
		elif Global.contexto_atual == "Executivo" and textoatual > 8:
			Global.contexto_atual = "Legislativo"
			trespoderes.texture = highleg
			textoatual = 0
		elif Global.contexto_atual == "Legislativo" and textoatual > 13: 
			Global.contexto_atual = "Judiciário"
			trespoderes.texture = highjud
			textoatual = 0 
		elif Global.contexto_atual == "Judiciário" and textoatual > 15: 
			Global.contexto_atual = "FimDoTour"
			trespoderes.texture = highplana
			if textoatual > 5: 
				get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoder.tscn")

func _process(delta):
	texto.text = String(Global.dialogos_dados[Global.contexto_atual][textoatual])


func _on_skip_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/EscolhaPoder.tscn")
