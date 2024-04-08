extends Node2D


# _ready()는 프로그램 실행 시 1번만 실행된다
func _ready():

	var number:int = 15
	print("number = ", number)

	if number <= 10:
		print("number는 10 이하의 숫자입니다.")
	elif number <= 20:
		print("number는 10 초과 20 이하의 숫자입니다.")
	elif number <= 30:
		print("number는 20 초과 30 이하의 숫자입니다.")
	else:
		print("number는 30 초과의 숫자입니다.")
