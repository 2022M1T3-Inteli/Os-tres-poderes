//aqui a linguagem é semelhante ao C+
shader_type canvas_item; 

uniform float vel = 0.4;
uniform float des = 0f;
//são as variáveis

void fragment () {
	COLOR = texture (TEXTURE, UV + vec2(1, 0f) * TIME * vel);
	/* cor é textura para manter a imagem dos confetes. 
	vec 2 é para mostrar que o efeito vem de cima para baixo, pois x não tem valor, só o eixo Y.
	multiplica-se pelo tempo para ter a animação com a mudança de frames e multiplica por uma variável
	para controlar a velocidade do confete caindo */
}