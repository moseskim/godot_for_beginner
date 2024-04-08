extends Node2D

# 상수를 작성한다
const VAR_CONSTANT = 100


func _ready():
	VAR_CONSTANT = 200            # ← 상수를 변경하면 에러가 발생한다
	print("값 = ", VAR_CONSTANT)
