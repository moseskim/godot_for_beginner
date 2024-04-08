extends Node2D


# _ready()는 프로그램 실행 시 1번만 실행된다
func _ready():

	var i:int = 1
	var sum:int = 0

	while i <= 10:
		sum = sum + i
		i = i + 1

	print("1~10의 합 ＝ ", sum)
