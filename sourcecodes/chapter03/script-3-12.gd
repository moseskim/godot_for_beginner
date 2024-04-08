extends CharacterBody2D

# 걷기 속도
@export var WALK_SPEED = 250
# 자녀 노드의 AnimatedSprite를 취득한다
@onready var sprite = $AnimatedSprite2D
# 이동 방향을 (0, 0)으로 초기화한다
@onready var direction = Vector2(0,0)

# 중력과 점프력
@export var GRAVITY = 15
@export var JUMP_POWER = 450
# 지면과의 접촉 판정에 이용하는 RayCast2D
@onready var raycast2d = $RayCast2D


func _ready():
	# 다른 게임 객체보다 앞쪽에 표시한다
	self.z_index = 100


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		# 오른쪽 방향 화살표 키가 눌렸을 때 오른쪽 방향으로 이동한다
		direction.x = WALK_SPEED
		sprite.flip_h = false
		sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		# 왼쪽 방향 화살표 키가 눌렸을 때 왼쪽 방향으로 이동한다
		direction.x = -WALK_SPEED
		sprite.flip_h = true
		sprite.play("walk")
	else:
		direction.x = 0
		sprite.play("idle")

	# 중력을 적용한다
	direction.y += GRAVITY
	if raycast2d.is_colliding():
		direction.y = 0
		if Input.is_action_just_pressed("ui_up"):
			# 지면과 접촉 중 위쪽 화살표 키가 눌렸을 때 점프한다
			direction.y = -JUMP_POWER

	self.velocity = direction
	self.move_and_slide()

##### 스크립트 3-2에서 추가 #####

# HP를 작성한다
@onready var hp=100


func hp_up(point):
	print("HP recovery : +", point)
	hp+=point
	if hp>100:
		hp=100

############################

##### 스크립트 3-4에서 추가 #####

func gameover():
	# 스크립트 3-12에서 삭제
	# print("Gameover")
	
	# 스크립트 3-12에서 추가
	var gameover = $"/root/Node2D/Gameover"
	gameover.z_index = 200
	gameover.visible=true
	get_tree().paused=true


func hp_down(point):
	print("HP decrease : -", point)
	hp-=point
	if hp<0:
		gameover()

############################

##### 스크립트 3-8에서 추가 #####

var attack = preload("res://attack.tscn")


func _process(delta):
	# 스크립트 3-10에서 추가
	$"/root/Node2D/ProgressBar".value=hp
	
	if Input.is_action_just_pressed("ui_select"):
		var attack_instance = attack.instantiate()
		attack_instance.z_index=100
		
		if sprite.flip_h:
			attack_instance.init(self.position,-1)
		else:
			attack_instance.init(self.position,1)
		get_parent().add_child(attack_instance)

############################
