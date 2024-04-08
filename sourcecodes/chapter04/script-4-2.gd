extends Node


func _ready():
	# 게임 시작 시 커서를 표시하지 않게 한다
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	self.process_mode = Node.PROCESS_MODE_ALWAYS


func _process(delta):
	# Q키를 누르면 게임을 종료한다
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()
