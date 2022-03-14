shader_type canvas_item;
	/*
	Aqui definimos o tipo de Shader, o tipo de Shader para jogos 2D é 
	sempre canvas_item no Godot.
	*/

uniform float velocidade_rolamento; 
	/*
	Aqui temos uma variável uniforme, do tipo de dado float, onde o que 
	declaramos é a velocidade de rolamento da tela. A função dessa linha de 
	código é, basicamente, para mudar o valor no "inspector", e a partir daí, 
	poderemos manipular o script tanto pelo inspector, quanto pelo código.  
	*/
void fragment() 
	/*
	Aqui utilizamos a shader "fragment", que tem como função executar em cada pixel 
	da cena que contem o nó "FundoInfinito", e então fará algumas modificações 
	para que ela consiga mover os UVs (Um mapeamento de onde certos pixeis da 
	textura estão localizados no componente).
	*/
{
	vec2 u = UV; 
		/* 
		Aqui estamos pegando o UV e o colocando em uma variável 
		*/
	u.x += velocidade_rolamento * TIME; 
		/* 
		Permite a velocidade do rolamento ser incrementada conforme o tempo, no eixo X 
		*/
	vec4 cor = texture(TEXTURE, u); 
		/*
		Aqui utilizamos vec4, que é a cor, e armazenamos em uma variável, e então 
		a colocamos na textura, utilizando a coordenada UV. Basicamente, pegamos um 
		fragmento da textura.
		*/
	COLOR = cor; 
		/*
		Aqui, atribuimos a variável de volta a cor, utilizando o fragmento que 
		pegamos. Funcionalmente, resetando o plano de fundo.
		*/
}