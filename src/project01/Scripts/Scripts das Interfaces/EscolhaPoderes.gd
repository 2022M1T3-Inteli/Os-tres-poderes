extends Control

var qtde_PECs
var passagem_tempo = 0
var tempo_atual = 1
var ano_atual = 0
var progresso_atual = Global.Progresso
var pronto = load("res://Recursos/Objetos/Parte_Ok.png")

func _ready():
	qtde_PECs = len(Global.PECs_Available)
	if qtde_PECs >= 1:
		$HUD_Principal/HBoxContainer/PEC_Available.show()
	if qtde_PECs >= 2:
		$HUD_Principal/HBoxContainer/PEC_Available2.show()
	if qtde_PECs >= 3:
		$HUD_Principal/HBoxContainer/PEC_Available3.show()
	if qtde_PECs >= 4:
		$HUD_Principal/HBoxContainer/PEC_Available4.show()
	if qtde_PECs >= 5:
		$HUD_Principal/HBoxContainer/PEC_Available5.show()
	if progresso_atual == 4:
		pass
	passagem_tempo = 48 / (qtde_PECs * 5)
	if Global.Progresso >= 8: 
		passar_tempo()
		$Progresso.show()
		$HUD_Principal/Fase_Atual.show()
		$HUD_Principal/HBoxContainer/PEC_Available.texture = load("res://Recursos/Objetos/PEC_Current.png")
		$HUD_Principal/PEC_Atual.text = Global.PECs_Available[Global.PEC_Escolhida]
	if Global.Progresso == 9: 
		passar_tempo()
		$Progresso/Imprensa.texture = pronto
		$Progresso/Deputados.texture = load("res://Recursos/Objetos/Deputados_Current.png")
		$Leg.disabled = false
		$Jud.disabled = false

func _process(delta):
	$HUD_Principal/Data.text = String(Global.tempo["Meses"][tempo_atual] + "," + Global.tempo["Ano"][ano_atual])

func _on_Leg_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Legislativo/LegislativoMenu.tscn") 


func _on_Exec_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/executivo_novo.tscn") 


func _on_Jud_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Judiciário.tscn") 

func passar_tempo(): 
	tempo_atual += passagem_tempo
	if tempo_atual > 11:
		ano_atual += 1 
		tempo_atual = 0 
		if ano_atual > 3: 
			ano_atual = 3
