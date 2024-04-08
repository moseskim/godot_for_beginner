extends Node2D

# 이름 있는 열거 타입 변수를 작성한다
enum playerStatus { IDLE, WALK, JUMP }
# 이름 없는 열거 타입 변수를 작성한다
enum { STAGE_X, STAGE_Y, STAGE_Z }


func _ready():

	# 이름 있는 열거 타입 데이터 사용 예
	print("IDLE = ", playerStatus.IDLE)   # 0이 표시된다
	print("WALK = ", playerStatus.WALK)   # 1이 표시된다
	print("JUMP = ", playerStatus.JUMP)   # 2가 표시된다

	# 이름 없는 열거 타입 데이터 사용 예
	print("STAGE_X = ", STAGE_X)   # 0이 표시된다
	print("STAGE_Y = ", STAGE_Y)   # 1이 표시된다
	print("STAGE_Z = ", STAGE_Z)   # 2가 표시된다
