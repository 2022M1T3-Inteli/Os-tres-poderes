extends Control

onready var poder_escolhido = $RichTextLabel

func _ready():
	pass

func _process(delta):
	poder_escolhido.text = String(Global.poder_escolhido)

func _on_TextureButton_pressed():
	OS.shell_open("https://www.jfsp.jus.br/")
