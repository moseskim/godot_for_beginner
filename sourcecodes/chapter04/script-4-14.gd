extends Label

var fmt = "HP %d"
@onready var player = get_node("/root/Node3D/Player")
@onready var gameover_sprite = get_node("/root/Node3D/Gameover")


func _ready():
	gameover_sprite.visible = false


func _process(delta):
	var hp = player.hp
	self.text = fmt % hp

	if hp <= 0:
		gameover_sprite.visible = true
		get_tree().paused = true
