extends Area2D

# 이 아이템을 취득했을 때의 HP 회복량
@export var HP_RECOVERY=10


func _ready():
	# 나무나 바위 보다 앞쪽에 표시한다
	self.z_index = 1


func player_hp_up(body):
	if body.name == "Player":
		body.hp_up(HP_RECOVERY)
		self.queue_free()
