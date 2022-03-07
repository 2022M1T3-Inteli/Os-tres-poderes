extends Control

func _ready():
	Singleton.emit_signal("Unlock")

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Cenas Principais/Executivo.tscn")
