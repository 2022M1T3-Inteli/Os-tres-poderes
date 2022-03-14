## Este Script é um "singleton", que é configurado indo em "Project > Project Settings > AutoLoad". um singleton é um script que roda a todo o tempo no jogo, e não precisa ser atrelado a um nó específico. Extremamente útil para manter informações do jogo (Data Sheet) e armazenar dados ou sinais. 

extends Node2D

signal morreu
signal recompensar
signal pontuar
