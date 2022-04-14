extends Control

var qtde_PECs
var passagem_tempo = 0
var tempo_atual = 1
var ano_atual = 0
var pronto = load("res://Recursos/Objetos/Parte_Ok.png")
var falhou = load("res://Recursos/Objetos/Parte_Fail.png")

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
	passagem_tempo = 48 / (qtde_PECs * 5)
	if Global.Progresso == -2:
		$HUD_Principal/HBoxContainer/PEC_Available.texture = load("res://Recursos/Objetos/PEC_Ok.png")
		$HUD_Principal/Final.show()
		$HUD_Principal/Data.text = "Dezembro, 2024"
		$HUD_Principal/PEC_Atual.text = "Nenhum"
	if Global.Progresso == -1: 
		if Global.apoio == true: 
			Global.apoio = false
			$Progresso/Apoio.texture = load("res://Recursos/Objetos/napoio.png")
			if Global.deputado_falho == true:
				Global.Progresso = 9
			elif Global.senado_falho == true: 
				Global.Progresso = 17
		$Progresso.show()
		$HUD_Principal/Fase_Atual.show()
		$HUD_Principal/PEC_Atual.text = Global.PECs_Available[Global.PEC_Escolhida]
		$Progresso/Imprensa.texture = pronto
		$Progresso/Separador2.texture = load("res://Recursos/Objetos/Separador_Ok.png")
		$HUD_Principal/Fase_Atual.texture = load("res://Recursos/Objetos/HUD_Fase2.png")
		$Progresso/Progresso_Title.texture = load("res://Recursos/Objetos/Progresso_Title2.png")
		$Leg.disabled = true
		$Exec.disabled = true
		$Jud.disabled = true
		$HUD_Principal/HBoxContainer/PEC_Available.texture = load("res://Recursos/Objetos/PEC_Fail.png")
		$HUD_Principal/Final.show()
		if Global.deputado_falho == true: 
			$Progresso/Deputados.texture = falhou
		elif Global.senado_falho == true: 
			$Progresso/Senado.texture = falhou
	if Global.Progresso >= 8: 
		passar_tempo()
		$Progresso.show()
		$HUD_Principal/Fase_Atual.show()
		$HUD_Principal/HBoxContainer/PEC_Available.texture = load("res://Recursos/Objetos/PEC_Current.png")
		$HUD_Principal/PEC_Atual.text = Global.PECs_Available[Global.PEC_Escolhida]
		if Global.Progresso >= 9: 
			passar_tempo()
			if Global.apoio == true: 
				$Progresso/Apoio.texture = load("res://Recursos/Objetos/apoio.png")
			$Progresso/Apoio.show()
			$Progresso/Separador2.texture = load("res://Recursos/Objetos/Separador_Ok.png")
			$Progresso/Imprensa.texture = pronto
			$Progresso/Deputados.texture = load("res://Recursos/Objetos/Deputados_Current.png")
			$HUD_Principal/Fase_Atual.texture = load("res://Recursos/Objetos/HUD_Fase2.png")
			$Progresso/Progresso_Title.texture = load("res://Recursos/Objetos/Progresso_Title2.png")
			$Leg.disabled = false
			$Jud.disabled = false
			if Global.Progresso >= 17: 
				$Progresso/Deputados.texture = pronto
				$Progresso/Senado.texture = load("res://Recursos/Objetos/Senado_Current.png")
				if Global.Progresso >= 27: 
					$Progresso/Senado.texture = pronto 
					$Progresso/Promulgar.texture = load("res://Recursos/Objetos/Promulgar_Current.png")
					$HUD_Principal/Fase_Atual.texture = load("res://Recursos/Objetos/HUD_Fase3.png")
					$Progresso/Progresso_Title.texture = load("res://Recursos/Objetos/Progresso_Title3.png")

func _process(delta):
	$HUD_Principal/Data.text = String(Global.tempo["Meses"][tempo_atual] + "," + Global.tempo["Ano"][ano_atual])

func _on_Leg_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Legislativo/Menu.tscn") 


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


func _on_Final_pressed():
	get_tree().change_scene("res://Win.tscn")
