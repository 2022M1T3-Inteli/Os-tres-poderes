extends Node

##
## Códigos Gerais
##
var ideia 
var etapa2 = false
var Progresso
var poder_escolhido = ""

##
## Códigos do Minigame
##

var pontosminigame = 0.0

var pontostotal = 0.0
var aguamusic = false
var morreumusic = false 
# variaves do minigame corrida pela sáude 
signal morreu
signal recompensar
signal pontuar

var pontuacao = 0
#essa é a variável global, que salva o valor dos pontos obtidos no mini game

## 
## Códigos do Debate
##

var comissoes = {
	"Câmara dos Deputados" : {
		1 : {

			"pergunta" : "Sr. Presidente, sabendo que o sistema de votação em urna eletrônica não permite que o eleitor confira, com seus próprios olhos, uma prova que seu voto foi para o representante votado, por que não imprimir um comprovante de votação, mas que não contenha o nome do eleitor, somente que o voto foi para certo candidato?", 

			"respostas" :{
				0: "Boa ideia. Assim não apresentará fraudes nem os dados dos cidadãos, pela prova física em mãos.",
				1: "Embora possa ser um problema relevante, não há orçamento disponível.",
				2: "Esse é um problema que não existe, logo, apresenta uma solução desnecessária."
			},

			"expandidas" :{
				0: "Isso pode comprovar que não há fraudes nas eleições, uma vez que o cidadão terá em mãos uma prova física que seu voto foi para o candidato, sem envolver seus dados pessoais e, sendo assim, não sendo manipulável.",
				1: "Embora possa ser um problema relevante, não há orçamento disponível para arcar com bilhões de reais para refazer toda infraestrutura envolvida no custo de papel e mecanismos para entregar à população",
				2: "Esse é um problema que não existe, logo, apresenta uma solução desnecessária. As urnas possuem tecnologia extremamente segura, possibilitando a contagem dos votos em questão de segundos." 
			},

			"justificativa" :{
				0: "Novamente, a PEC foi bem defendida e atraiu políticos favoráveis a sua aprovação e desenvolvimento.",
				1: "Criou tensão ao ir contra a própria continuidade do processo da PEC, estimulando a oposição a atacar a proposta.",
				2: "A argumentação causou discussão e fortaleceu a defesa da urna eletrônica em vez da PEC que está sendo proposta."
			}
		},

		2 : {

			"pergunta" : "Sr. Presidente, na era tecnológica em que vivemos, cheia de ataques “hackers” e invasões de privacidade, as urnas eletrônicas são uma ameaça para a segurança das eleições. Então os votos impressos, sem essa ameaça, seriam soluções a esse problema?",

			"respostas" :{
				0: "É um bom ponto. Acredito que a segurança proporcionada pela impressão do voto garantirá a segurança das eleições.", 
				1: "De fato essa é uma solução a ataques hackers e pode evitar grandes manipulações, mas não evita pequenas fraudes.", 
				2: "Não, pois as urnas eletrônicas não são conectadas à internet e são muito testadas."
			},

			"expandidas" :{
				0: "É um bom ponto. Acredito que a segurança proporcionada pela impressão do voto garantirá a segurança das eleições. A população gostaria de ter em mãos a comprovação de que “aquele” candidato foi o escolhido a partir da impressão do nome e número do partido dele(a), assim mantendo a segurança do eleitor durante a eleição.",
				1: "De fato essa é uma solução a ataques hackers e pode evitar grandes manipulações, mas não evita pequenas fraudes. A partir da impressão do voto selecionado e salvo, o eleitor terá garantia que seu voto ocorreu com sucesso, mas poderá ter seu voto exposto.",
				2: "Não, pois as urnas eletrônicas não são conectadas à internet e são muito testadas. Elas não possuem os mecanismos para se conectar com ou sem fio a outros dispositivos, sendo aprovada em Testes Públicos de Segurança, em que a urna sofre ataques propositais. Qualquer mudança, após a lacração, nas 15 milhões de linhas de código das urnas resulta em seu desligamento instantâneo, sendo assim, são seguras."
			}, 
			"justificativa" :{
				0: "A PEC foi defendida e abordou desejos populares, utilizando de uma oratória política para justificar as ações pelo desejo da população, atraindo apoiadores.", 
				1: "Criou uma tensão nos políticos ao dizer, nas entrelinhas, que o próprio sistema de votação que está defendendo admite fraudes.", 
				2: "Foi contra a própria PEC que está tentando aprovar, ajudando a oposição a criar argumentos contra a aprovação da PEC do voto impresso."
			}
		}
	}
}

var pergunta_atual = 0  
var comissao_atual = 0 

##
## Códigos do Conselheiro
##

var dialogos_dados = {
	"Introdução": {
		0: "Parabéns, presidente! Seu mandato começa aqui, rumo a melhor presidência da história de nosso país!", 
		1: "Para ter um bom mandato, o Sr. deve aprovar o maior número de PECs possíveis, para que a população brasileira possa desfrutar de um país mais eficiente e próspero.",
		2: "Isso só será possível se o Sr. tomar boas decisões que agradem o Congresso",
		3: "Mas vamos aos poucos, primeiro, que tal irmos para a praça dos três poderes?"
	}, 
	"Planalto": {
		0: "Seja bem vindo a famosa praça dos três poderes em Brasília, capital de nosso país! Foi construída por Oscar Niemeyer e Lúcio Costa, e inaugurada em 21 de abril de 1960.",
		1: "É aqui onde se localizam os prédios que fazem parte da tripartição de funções do governo brasileiro, ou, em termos mais simples; esta é a praça onde os três poderes se encontram.",
		2: "Esses Poderes representam o tripé da República brasileira, uma vez que simbolizam a divisão do poder político em três partes independentes.", 
		3: "Isso acontece por conta do modo de distribuição da autoridade, para evitar a tirania, o conflito e a violência na sociedade brasileira.",
		4: "Certo! Então vamos dar nome aos bois"
	},
	"Executivo": {
		0: "Esse é o prédio do poder Executivo!",
		1: "Tambem conhecido como Palácio do Planalto, é aqui onde trabalha o Presidente da República, que, também é conhecido como você, os Ministérios e Secretarias, além das Agências Governamentais.",
		2: "Sendo dividido em 3 níveis de Governo: Nível Municipal, Nível Estadual e Nível Federal/Nacional",
		3: "Hm? O que você deve fazer?",
		4: "(Esse é meu presidente...)",
		5: "Ok, vou te explicar.",
		6: "O poder executivo é o Poder que coloca em prática as leis, aplicando-as. O poder atua de forma a representar os cidadãos, de modo a tirar do papel os direitos e deveres e fazê-los serem cumpridos, por meio de planos governamentais, propostas de orçamentos e, às vezes, a partir da edição das medidas provisórias.",
		7: "Porém, tenho certeza que você vai se aclimar com suas funções quando for executá-las (Pelo bem da nação, se não seu próprio)",
		8: "Agora, que tal falarmos de seu vizinho mais próximo?"
	}, 
	"Legislativo": {
		0: "Este prédio é o Palácio do Congresso Nacional, onde se concentra aqueles que fazem parte do poder Legislativo.", 
		1: "Eles possuem a função de criar leis e fiscalizar os atos do poder Executivo, englobando o plano Federal, Estadual e Municipal.",
		2: "Você deve ter percebido um padrão, não é mesmo? Nosso país, além de tripartir as funções de poder, também triparte a autoridade em âmbitos. Porém, por enquanto, vamos focar no poder Legislativo. (Os ultimos presidentes todos se perderam...)",
		3: "O poder legislativo é dividido em dois, ou seja, é uma bipartição. Idealmente, ela existe para combater a tirania da maioria e dar lugar a representação de toda a população.",
		4: "Como estamos no planalto central, neste prédio se concentram, principalmente, deputados e senadores federais",
		5: "Os deputados se concentram na 'Câmara dos Deputados', onde eles decidem, em voto de maioria, quais decisões deverão ser tomadas atender as demandas específicas da população.",
		6: "No total, temos 513 deputados federais, com mandatos de 4 anos.",
		7: "Os deputados federais são os guardiões das leis. Eles apresentam projetos de leis, melhorias que podem ser adicionadas na Constituição e votam o processo de impeachment, quando necessário.",
		8: "Também temos os senadores, que se concentram no Senado Federal, onde eles decidem, em voto de maioria, quais decisões deverão ser tomadas quanto a problemas mais gerais.",
		9: "No total, temos 81 senadores, com mandatos de 8 anos.",
		10: "Os senadores da república são representantes de seus Estados, eleitos para mandatos de 8 anos, e fazem debates sobre economia, segurança, e tópicos dos projetos de lei mais profundamente, revendo aqueles aprovados pela Câmara dos Deputados, como um filtro.",
		11: "Ufa...", 
		12: "Sei que é bastante, porém, como já disse, você irá interagir muito com eles daqui em diante, então, não se preocupe com todos os detalhes.",
		13: "Agora, que tal irmos visitar seu terceiro, último, porém não menos importante vizinho?"
	}, 
	"Judiciário": {
		0: "Este é o prédio do poder Judiciário, o Tribunal da Justiça.",
		1: "Aqui se concentram os juizes do Supremo Tribunal Federal (STF), Superior Tribunal de Justiça (STJ), tribunais regionais federais e tribunais dos estados, do distrito federal e dos territórios.",
		2: "Tendo a competência para processar e julgar, esse poder tem a função de interpretar as Leis, garantindo os direitos individuais, coletivos e sociais, além de solucionar conflitos entre cidadãos, entidades e Estado.",
		3: "Para isso, o poder judiciário tem autonomia administrativa e financeira garantidas pela Constituição Federal.",
		4: "O poder Judiciário tem uma regra: O Poder Judiciário só se movimenta quando é provocado",
		5: "Não, seu presidente, não é uma provocação de xingamentos.",
		6: "O poder Judiciário é provocado quando um processo judicial é iniciado. Dependendo da situação, diferentes âmbitos serão acionados. Caso um processo seja iniciado contra você, o poder Judicial Federal será acionado.",
		7: "Seu presidente, caso chegarmos a esse ponto, será um péssimo sinal de seu governo.",
		8: "Contudo, mesmo que o ele seja inerte, o poder Judiciário pode livremente interagir com os outros poderes em conselho.",
		9: "Conselho... entende?",
		10: "...",
		11: "É aqui onde você me encontrará, seu presidente!",
		12: "Todo seu progresso será mantido aqui, e você pode consultá-lo livremente ao me visitar. Faz parte da nossa transparência.",
		13: "Hm? por que eu faço isso?",
		14: "Bom, caso o pior venha a acontecer, você terá que ter fatos para se defender, certo?",
		15: "Tudo bem que, esses fatos podem ser utilizados para te ferir, também. Porém, eu pessoalmente, acredito que você tem o bem da nação em mente. Então, acho que não tem muito a se preocupar."
	},
	"FimDoTour" :{
		0: "E é aqui que terminamos nosso tour!",
		1: "Espero que tenha entendido o básico de como tudo aqui funciona.",
		2: "Agora, devo voltar a assumir meus deveres, porém, não hesite em me contatar caso tenha alguma dúvida, a grande beleza da tripartição de poderes é que nenhuma decisão deve cair nos ombros de uma só pessoa.",
		3: "...",
		4: "*Ahem*, você deve voltar para assumir seus deveres também, seu presidente. Que tal idealizar aquela PEC que você tinha em mente?",
		5: "Vá para o prédio do executivo e comece a trabalhar!"
	}
}

var conselheiro_dados = {
	"HomemBranco": {
		"Busto": load("res://Recursos/Sprites/NPCs/HomemBrancoBusto.png"), 
		"Hidden": load("res://Recursos/Sprites/NPCs/HomemBrancoHidden.png")
	}, 
	"HomemNegro": {
		"Busto": load("res://Recursos/Sprites/NPCs/HomemNegroBusto.png"), 
		"Hidden": load("res://Recursos/Sprites/NPCs/HomemNegroHidden.png")
	}, 
	"MulherBranca": {
		"Busto": load("res://Recursos/Sprites/NPCs/MulherBrancaBusto.png"), 
		"Hidden": load("res://Recursos/Sprites/NPCs/MulherBrancaHidden.png")
	}, 
	"MulherNegra": {
		"Busto": load("res://Recursos/Sprites/NPCs/MulherNegraBusto.png"), 
		"Hidden": load("res://Recursos/Sprites/NPCs/MulherNegraHidden.png")
	}
}

var conselheiro_escolhido 
var contexto_atual

##
## Códigos de Avatar
##

var NPC = {
	"Homem_Branco" : {
		"Frente" : {
			"Full" : load("res://Recursos/Sprites/NPCs/Homem Branco/HB_Frente_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Mulher Negra/HB_Frente_Half.png")
			},
		"Lado" : { 
			"Full" : load("res://Recursos/Sprites/NPCs/Homem Branco/HB_Lado_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Homem Branco/HB_Lado_Half.png"),
			"Hidden" : {
				"Half" : load("res://Recursos/Sprites/NPCs/Homem Branco/HB_Lado_Half_Hidden.png"),
				"Quarter" : load("res://Recursos/Sprites/NPCs/Homem Branco/HB_Lado_Hidden_Quarter.png")
				}
			}, 
		"Apoio" : {
			"Sim" : load("res://Recursos/Sprites/NPCs/Homem Branco/HB_Apoio.png"), 
			"Não" : load("res://Recursos/Sprites/NPCs/Homem Branco/HB_Napoio.png")
		}
	}, 
	"Homem_Negro" : {
		"Frente" : {
			"Full" : load("res://Recursos/Sprites/NPCs/Homem Negro/HN_Frente_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Mulher Negra/HN_Frente_Half.png")
			},
		"Lado" : { 
			"Full" : load("res://Recursos/Sprites/NPCs/Homem Negro/HN_Lado_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Homem Negro/HN_Lado_Half.png"),
			"Hidden" : {
				"Half" : load("res://Recursos/Sprites/NPCs/Homem Negro/HN_Lado_Half_Hidden.png"),
				"Quarter" : load("res://Recursos/Sprites/NPCs/Homem Negro/HN_Lado_Hidden_Quarter.png")
				}
			}, 
		"Apoio" : {
			"Sim" : load("res://Recursos/Sprites/NPCs/Homem Negro/HN_Apoio.png"), 
			"Não" : load("res://Recursos/Sprites/NPCs/Homem Negro/HN_Napoio.png")
		}
	}, 
	"Mulher_Branca" : {
		"Frente" : {
			"Full" : load("res://Recursos/Sprites/NPCs/Mulher Branca/MB_Frente_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MB_Frente_Half.png")
			},
		"Lado" : { 
			"Full" : load("res://Recursos/Sprites/NPCs/Mulher Branca/MB_Lado_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Mulher Branca/MB_Lado_Half.png"),
			"Hidden" : {
				"Half" : load("res://Recursos/Sprites/NPCs/Mulher Branca/MB_Lado_Half_Hidden.png"),
				"Quarter" : load("res://Recursos/Sprites/NPCs/Mulher Branca/MB_Quarter_Hidden.png")
				}
			}, 
		"Apoio" : {
			"Sim" : load("res://Recursos/Sprites/NPCs/Mulher Branca/MB_Apoio.png"), 
			"Não" : load("res://Recursos/Sprites/NPCs/Mulher Branca/MB_Napoio.png")
		}
	}, 
	"Mulher_Negra" : {
		"Frente" : {
			"Full" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Frente_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Frente_Half.png")
			},
		"Lado" : { 
			"Full" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Lado_Full.png"),
			"Half" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Lado_Half.png"),
			"Hidden" : {
				"Half" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Lado_Half_Hidden.png"),
				"Quarter" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Lado_Quarter_Hidden.png")
				}
			}, 
		"Apoio" : {
			"Sim" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Apoio.png"), 
			"Não" : load("res://Recursos/Sprites/NPCs/Mulher Negra/MN_Napoio.png")
		}
	}
}

var Presidente
var Conselheiro

##
## Códigos de Diálogo
##

var conselheiro_dialogo = {
	"Introdução" : {
		0 : "Olá Presidente! Muito obrigado por ter me escolhido para ser seu conselheiro!",
		1 : "Gostei muito da sua proposta de governo, acho muito interessante focar seu mandato em PECs que irão melhorar nosso país!",
		2 : "Tenho um plano para que consigamos aprovar o maior número de PECs possíveis! Gostaria de ouvir?",
		3 : "Ótimo! Olha só...",
		4 : "Você que manda! Irei fazer os preparativos para nossa viagem ao planalto."
	}, 
	
	"Tutorial" : {
		0: "Para que uma PEC seja aprovada, precisamos passar por 3 fases muito importantes:",
		1: "A primeira é a apresentação da PEC; onde elaboraremos toda a ideia da PEC e iremos a colocar em papel. É aqui que fazemos o sonho virar realidade.",
		2: "É inevitável que assim que publicarmos essa PEC, a mídia faça barulho. Então, nós vamos ficar um pé a frente deles; iremos fazer um barulho própriamente nosso!",
		3: "Não se preocupe com o que precisa fazer agora, pois já tenho tudo planejado! A única coisa que você precisa fazer é realizar uma atividade e sorrir de ponta a ponta para as câmeras!",
		4: "Tenho certeza de que irá se divertir com elas.",
		5: "A segunda etapa é o Debate do poder legislativo.",
		6: "O debate é a parte mais importante do processo; seremos avaliados pela câmara dos deputados e pelo senado em 2 instâncias.",
		7: "Cada uma das instâncias tem uma pergunta principal, e precisaremos dar bons argumentos para convencer os deputados e senadores de que essa é, de fato, uma PEC essencial para o futuro próspero do Brasil.",
		8: "Sei que parece ser difícil, porém, caso tenhamos o apoio público da última etapa, temos boas chances de convencê-los, afinal, todo o poder emana do povo.",
		9: "A última etapa é a promulgação!",
		10: "Daqui pra frente é só alegria! Após ser aprovada pelo senado e câmara, a única coisa que pode parar a PEC é o poder Judiciário, caso provocado.",
		11: "Porém, não acho que chegaremos a esse ponto. Para provocarmos o Judiciário, teremos que ter feito algo que infringe a constituição ou outros fundamentos do Brasil.",
		12: "E nós temos somente o bem do país em mente e no coração! Então não acho que isso será problema.",
		13: "Bastante coisa, né? Você não entendeu alguma coisa?",
		14: "Mas é claro!",
		15: "Mais alguma dúvida?",
		16: "Tudo certo então! Vamos á Brasília!"
	},
	"Apresentação": {
		0: "Bem vindo ao Planalto Central! Onde todo o corpo governamental federal se encontra, o que nos inclui!",
		1: "Você estará no famoso Palácio do Planalto, e eu assumirei minha posição no STF.",
		2: "Documentarei todo seu processo para que o país se lembre da história que estamos escrevendo aqui!",
		3: "E... pois caso o poder judiciário for acionado, eu preciso de fatos para te defender em frente a meus colegas.",
		4: "Mas, como eu disse, isso é improvável.",
		5: "Antes de começarmos, você tem alguma dúvida sobre o que fazer agora?",
		6: "Certo, vou te explicar...",
		7: "Ótimo!, então mãos á obra!"
	},
	"AcompanhamentoP1" : {
		0: "Certo, vou começar pela apresentação de o que você tem em sua frente.",
		1: "Neste canto, temos o ano atual, onde você pode se localizar quanto ao seu tempo de mandato.",
		2: "Aqui, temos o nome da PEC Atual; como você ainda não escolheu uma PEC, ela está como nenhuma.",
		3: "Aqui, podemos ver o seu progresso total quanto as PECs; quantas PECs estão disponíveis, se você foi bem sucedido ou não em completá-las, e se há uma delas em progresso.",
		4: "Após iniciar uma PEC, você terá mais informações para analisar. Porém, é melhor você começar o processo antes de eu te apresentar a elas.",
		5: "Alguma dúvida?",
		6: "Claro!", 
		7: "Mais alguma dúvida?",
		8: "Ok, vamos agora focar em começar um processo de PEC, começando pela primeira fase; a apresentação. Toda a fase de apresentação se localiza no palácio do planalto, então clique no prédio para começar o processo."
	},
	"AcompanhamentoP2" : {
		0: "Seja bem vindo ao palácio do planalto! Esse é seu escritório, e onde um presidente passa a maior parte do seu tempo.",
		1: "Para iniciar o processo de PEC, precisamos, primeiro, a idealizar.",
		2: "Porém, caso você queira ainda mais informações sobre o poder executivo, clique no botão de dúvida acima de você.",
		3: "Com prazer!", 
		4: "Boa sorte! Clique no botão de idealizar PEC para começar."
	}
}

var presidente_dialogo = {
	"Introdução" : {
		1 : {
			"Escolha" : "Sim",
			"Dialogo" : "Sim, adoraria ouvir!"
		},
		2 : {
			"Escolha" : "Não", 
			"Dialogo" : "Acho melhor não, tenho certeza que irei aprendendo com o tempo."
		}
	},
	"Tutorial" : {
		1 : {
			"Escolha" : "Fase 1",
			"Dialogo" : "Não entendi a fase 1, pode me explicar denovo?"
		},
		2 : {
			"Escolha" : "Fase 2", 
			"Dialogo" : "Não entendi a fase 2, pode me explicar denovo?"
		}, 
		3 : {
			"Escolha" : "Fase 3",
			"Dialogo" : "Não entendi a fase 3, pode me explicar denovo?"
		},
		4 : {
			"Escolha" : "Tudo",
			"Dialogo" : "Não entendi nada, pode me explicar denovo?"
		},
		5: {
			"Escolha" : "Entendi tudo",
			"Dialogo" : "Não, tudo OK, podemos prosseguir."
		}
	}, 
	"Apresentação" : {
		1: {
			"Escolha" : "Sim",
			"Dialogo" : "Sim, estou muito perdido. Você pode me guiar?"
		}, 
		2: {
			"Escolha" : "Não",
			"Dialogo" : "Não, acho que sei o que fazer."
		}
	},
	"AcompanhamentoP1" : {
		1 : {
			"Escolha" : "Ano atual",
			"Dialogo" : "Como eu sei o ano atual de meu mandato?"
		},
		2 : {
			"Escolha" : "PEC Atual", 
			"Dialogo" : "Como eu sei qual é a PEC atual?"
		}, 
		3 : {
			"Escolha" : "PECs Disponíveis", 
			"Dialogo" : "Como eu sei quantas PECs estão disponíveis e seus estados?"
		},
		4 : {
			"Escolha" : "Explique tudo",
			"Dialogo" : "Não entendi nada, pode explicar tudo denovo?"
		},
		5 : {
			"Escolha" : "Entendi tudo", 
			"Dialogo" : "Não, ficou tudo bem claro!"
		}
	},
	"AcompanhamentoP2" : {
		1 : {
			"Escolha" : "Ok",
			"Dialogo" : "Certo. Estou pronto para iniciar minha primeira PEC!"
		},
		2 : {
			"Escolha" : "Pode repetir?", 
			"Dialogo" : "Pode repetir novamente as instruções?"
		}
	}
}

##
## Códigos de PEC
##

var PECs_Available = {
	0 : "Voto Impresso"
}

var PEC_Escolhida

var detalhe_pec = { 
	0 : {
		"Titulo" : "PEC Do Voto Impresso",
		"Conteudo" : "Querido Presidente, tenho percebido uma alta tendência de desconfiança do povo brasileiro quanto ao processo eleitoral. A raiz do problema parece ser a urna eletrônica, pois ela pode ser comprometida e manipulada dado o empenho de algum partido político ou grupo de pessoas poderosas, sem nenhuma maneira de recapturar os votos legítimos. Minha proposta é que implementemos um sistema de voto impresso, onde a urna eletrônica é utilizada para captar esses votos e legitimizar mais o processo eleitoral"
	}
}

var apoio 

var tempo = {
	"Meses" : {
		0 : "Janeiro",
		1 : "Fevereiro",
		2 : "Março",
		3 : "Abril",
		4 : "Maio",
		5 : "Junho",
		6 : "Julho",
		7 : "Agosto",
		8 : "Setembro",
		9 : "Outubro",
		10 : "Novembro",
		11 : "Dezembro",
	}, 
	"Ano" : {
		0 : "2022",
		1 : "2023", 
		2 : "2024", 
		3 : "2025"
	}
}

var midia = {
	0 : {
		"Apoio" : {
			"Site" : "noticias.com/presidente-revoluciona-brasil-co...", 
			"Titulo" : "Presidente luta pelo voto impresso e seguro, garante mais segurança no processo eleitoral Brasileiro",
			"Contexto" : "O presidente recentemente teve a brilhante idéia de introduzir o voto impresso, durante sua campanha...."
		}, 
		"Contra" : {
			"Site" : "noticias.com/presidente-ameaça-brasil-com-P....", 
			"Titulo" : "Seria este o fim da democracia? Presidente introduz PEC do Voto Impresso que facilita fraudes eleitorais.",
			"Contexto" : "Recentemente, o atual presidente da república brasileira fez campanha para sua nova PEC do voto impresso, que representa grande ..."
		}

	}
}
