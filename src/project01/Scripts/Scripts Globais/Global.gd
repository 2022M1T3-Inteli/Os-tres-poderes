extends Node

##
## Códigos Gerais
##
var ideia = false
var etapa2 = false
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
