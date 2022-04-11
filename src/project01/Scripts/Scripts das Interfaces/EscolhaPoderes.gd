extends Control

var Qtde_PECs
var progresso_atual = Global.Progresso

func _ready():
	Qtde_PECs = len(Global.PECs_Available)
	print(Qtde_PECs)
	if Qtde_PECs >= 1:
		$HUD_Principal/HBoxContainer/PEC_Available.show()
	if Qtde_PECs >= 2:
		$HUD_Principal/HBoxContainer/PEC_Available2.show()
	if Qtde_PECs >= 3:
		$HUD_Principal/HBoxContainer/PEC_Available3.show()
	if Qtde_PECs >= 4:
		$HUD_Principal/HBoxContainer/PEC_Available4.show()
	if Qtde_PECs >= 5:
		$HUD_Principal/HBoxContainer/PEC_Available5.show()
	if progresso_atual == 4:
		pass

func _on_Leg_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Legislativo/LegislativoMenu.tscn") 


func _on_Exec_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Executivo/Executivo.tscn") 


func _on_Jud_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Judiciário.tscn") 
