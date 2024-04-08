extends Area2D

# 적에게 부여하는 대미지
@export var HP_DAMAGE=20
# 속도와 방향
@export var SPEED=300

var velocity = Vector2()


func init(position, direction):
  self.z_index = 3
  self.position=position
  self.velocity=Vector2(direction*SPEED, 0)


func _physics_process(delta):
	self.position+=delta*self.velocity


func _on_collision(body):
	if body.name == "Enemy":
		body.damaged(HP_DAMAGE)
		self.queue_free()
	elif body.name == "Player":
		pass
	else:
		self.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
