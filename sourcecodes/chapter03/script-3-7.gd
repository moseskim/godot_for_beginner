extends CharacterBody2D

@export var HP_DAMAGE=1
@export var speed_scale=1.0


func _ready():
	# 나무나 바위 보다 앞쪽에 표시한다
	self.z_index = 2
	# move 애니메이션을 재생한다
	var anim = get_node("CollisionShape2D/Enemy/AnimationPlayer")
	anim.set_current_animation("move")
	anim.set_speed_scale(speed_scale)


func _physics_process(delta):
	var collision = move_and_collide(Vector2(0,0))
	if collision && collision.get_collider().name=="Player":
		collision.get_collider().hp_down(HP_DAMAGE)

@onready var HP=100


func damaged(point):
	HP-=point
	if HP<0:
		self.queue_free()
