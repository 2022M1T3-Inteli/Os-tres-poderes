extends Control

onready var PL = $"Poder Legislativo"
onready var PJ = $"Poder Judiciário"
onready var PS = $"Poder Selecionado"

func _ready():
	if Global.etapa2: 
		PL.disabled = false
		PJ.disabled = false
	PS.hide()

func _on_voltar_pressed():
	get_tree().change_scene("res://Cenas/Interface do Usuário/MainMenu.tscn")


func _on_Poder_Judicirio_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Judiciário.tscn") 


func _on_Poder_Executivo_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Executivo.tscn") 
	#Escolhe o poder Executivo


func _on_Poder_Legislativo_pressed():
		get_tree().change_scene("res://Cenas/Poderes/Legislativo/LegislativoMenu.tscn") 
		#Escolhe o poder Legislativo

func _on_PJ_pressed():
	if Global.etapa2:
		get_tree().change_scene("res://Cenas/Poderes/Judiciário/Judiciário.tscn") 
		#Escolhe o poder Judiciário 

func _on_Poder_Executivo_mouse_entered():
	Global.poder_escolhido = "Poder Executivo"
	PS.show()
	PS.rect_position.x = 197
	PS.rect_position.y = 275

func _on_Poder_Judicirio_mouse_entered():
	Global.poder_escolhido = "Poder Judiciário"
	PS.show()
	PS.rect_position.x = 1112
	PS.rect_position.y = 191


func _on_Poder_Legislativo_mouse_entered():
	Global.poder_escolhido = "Poder Legislativo"
	PS.show()
	PS.rect_position.x = 587
	PS.rect_position.y = 106
