extends Node2D

var tempo = 30

func _on_Timer_timeout():
	if tempo > 0:
		tempo -= 1
	$Timer_number.text = str (tempo)

	#Temos uma contagem regressiva do tempo limite ao 0, quando chega em 1 para de subtrair.
	#Por padrão, o Timer conta de 1 em 1 segundo, mas pode ser mudado em: Timer -->
	# Inspector --> Wait Time --> valor a ser colocado
		

