extends Node2D


# _ready()는 프로그램 실행 시 1번만 실행된다
func _ready():

	# 딕셔너리 타입 변수를 작성한다
	var dict_var : Dictionary = {}

	# 딕셔너리에 요소를 추가한다
	dict_var["나이"] = 20
	dict_var["성별"] = "남"
	dict_var["키"] = 168.3

	print("딕셔너리 타입 변수: ", dict_var)
	print("나이：", dict_var.get("나이"))

	dict_var.erase("나이")
	print("나이 요소를 삭제", dict_var)
