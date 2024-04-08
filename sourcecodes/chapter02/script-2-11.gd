extends Node2D


# 덧셈을 수행하는 함수
func add(x, y):
	return x+y


# 곱셈을 수행하는 함수
func multiply(x, y):
	return x*y


# _ready()는 프로그램 실행 시 1번만 실행된다
func _ready():
	# 함수를 이용해서 계산한다
	print("2 + 3 = ", add(2,3))
	print("2 × 3 = ", multiply(2,3))
