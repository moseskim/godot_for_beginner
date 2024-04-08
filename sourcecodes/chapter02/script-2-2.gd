extends Node2D


func _ready():
	# 동적 타입(타입을 지정하지 않고) 변수를 작성한다
	var dynamic_typed_var = 1.0
	dynamic_typed_var = "문자열을 대입"     # ← 에러가 발생하지 않는다

	# 정적 타입(타입을 지정하고) 변수를 작성한다
	var static_typed_var : float = 1.0
	static_typed_var = "문자열을 대입"       # ← 여기에서 에러가 발생한다
