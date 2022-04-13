extends Node2D

onready var JornalDC = $JornalDC
onready var JornalDE = $JornalDE

func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Poderes/Judiciário/Opções/MenuDados.tscn")




func _on_Jornal_deu_certo_mouse_entered():
	JornalDC.show()


func _on_JornalDC_mouse_exited():
	JornalDC.hide()


func _on_Jornal_deu_errado_mouse_entered():
	JornalDE.show()


func _on_JornalDE_mouse_exited():
	JornalDE.hide()
