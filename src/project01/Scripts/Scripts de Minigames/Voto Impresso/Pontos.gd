extends Label

func _process(_delta):
	self.text = String(Global.pontuacao)
		
		#quando a urna pegar a cédula temos que a variável atualiza somando 1 na global,
		#sendo escrita na RichTextLabel.
		
#func sair ():
#	self.hide
func _input(event):
	pass
	#isso para colocar os Inputs aqui dentro, como if event.is_action_pressed 
