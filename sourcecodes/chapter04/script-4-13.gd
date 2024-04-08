extends Label

var fmt = "TIME %02d:%02d"
var time = 3*60
@onready var timer = get_node("/root/Node3D/Timer")
@onready var timeout_sprite = get_node("/root/Node3D/Timeout")


func _ready():
	timeout_sprite.visible = false
	timer.set_wait_time(time)
	timer.set_one_shot(true)
	timer.start()


func _process(delta):
	var minute = int(timer.time_left/60.0)
	var second = int(timer.time_left) % 60
	self.text = fmt % [minute, second]

	if timer.time_left <= 0:
		timeout_sprite.visible = true
		get_tree().paused = true
