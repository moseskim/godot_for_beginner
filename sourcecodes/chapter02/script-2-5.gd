extends Node2D


# _ready()는 프로그램 실행 시 1번만 실행된다
func _ready():

	# 배열 타입 변수를 작성한다
	var array_var : Array = []

	print("요소 추가 전: ", array_var)
	array_var.append(1)          # int 타입 요소를 추가한다
	array_var.append(5.3)        # float 타입 요소를 추가한다
	array_var.append(true)       # bool 타입 요소를 추가한다
	array_var.append("Apple")    # String 타입 요소를 추가한다
	print("요소 추가 전: ", array_var)

	array_var.reverse()
	print("요소 반전: ", array_var)

	array_var.append_array([2, "Orange"])
	print("배열 뒤에 배열 추가: ", array_var)
