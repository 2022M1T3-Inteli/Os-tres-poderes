extends Node

var comissoes = {
	"Câmara dos Deputados" : {
		1 : {
			"pergunta" : "voto impresso", 
			"respostas" :{
				0: "resposta certa",
				1: "resposta errada1",
				2: "resposta errada2"
			}
		},
		2 : {
			"pergunta" : "segunda vez",
			"respostas" :{
				0: "resposta certa", 
				1: "reinaldo", 
				2: "resposta errada2"
			}
		}
	}
}

var pergunta_atual = 0  
var comissao_atual = 0 
