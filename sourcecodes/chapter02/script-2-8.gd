extends Node2D


# _ready()는 프로그램 실행 시 1번만 실행된다
func _ready():

	var fruits:String = "Apple"
	print("fruits = ", fruits)

	match fruits:
		"Apple":
			print(fruits, "은(는) 사과입니다.")
		"Orange":
			print(fruits, "은(는) 오렌지입니다.")
		_:
			print(fruits, "은(는) 사과도 오렌지도 아닙니다.")
