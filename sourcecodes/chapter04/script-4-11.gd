extends CharacterBody3D

# 중력의 크기
@export var gravity = 980
# 점프력
@export var jump_power = 500
# 이동 속도
@export var move_speed = 500
# 상하좌우 방향의 회전 속도를 조정하기 위한 값
@export var mouse_sensitivity = 0.002
# 이동 방향과 속도를 저장하기 위한 변수
var move_velocity = Vector3(0,0,0)
# 시점을 회전시키기 위해 라플 노드를 취득한다
@onready var rifle = get_node("Rifle")

########## 스크립트 4-6에서 추가 ##########

# 총탄을 취득한다
var bullet = preload("res://bullet.tscn") 
# 총탄의 발사점이 되는 Muzzle 노드를 취득한다
@onready var muzzle = get_node("Rifle/Muzzle")

######################################

########## 스크립트 4-9에서 추가 ##########

# 플레이어의 HP
var hp = 100

######################################

########## 스크립트 4-11에서 추가 ##########

# 라이플을 발사할 때의 소리를 취득한다
@onready var gun_shot = get_node("/root/Node3D/GunShotAudio")

######################################


func _physics_process(delta):
	# 지면과 접촉했을 때 이동할 수 있게 한다
	if is_on_floor():
		move_velocity = Vector3(0,0,0)
		if Input.is_key_pressed(KEY_D):
			move_velocity += self.global_transform.basis.z
		elif Input.is_key_pressed(KEY_A):
			move_velocity += - self.global_transform.basis.z
		if Input.is_key_pressed(KEY_W):
			move_velocity += self.global_transform.basis.x
		elif Input.is_key_pressed(KEY_S):
			move_velocity += - self.global_transform.basis.x
		move_velocity = move_speed * move_velocity.normalized ()

		if Input.is_key_pressed(KEY_SPACE):
			move_velocity.y = jump_power

	move_velocity.y -= gravity * delta
	set_velocity(move_velocity * delta)
	set_up_direction(Vector3(0, 1, 0))
	move_and_slide()


func _input(event):
	# 마우스 이동량에 따라 시점을 회전시킨다
	if event is InputEventMouseMotion:
		self.rotate_y(-mouse_sensitivity*event.get_relative().x)
		rifle.rotate_object_local(Vector3(0,0,1), -mouse_sensitivity*event.get_relative().y)

	# 상하 방향 시점의 회전은 45도로 제한한다
	if rifle.rotation.z > 0.25*PI:
		rifle.rotation.z = 0.25*PI
	elif rifle.rotation.z < -0.25*PI:
		rifle.rotation.z = -0.25*PI

########## 스크립트 4-6에서 추가 ##########

	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# 마우스 왼쪽 버튼 클릭으로 총탄을 발사한다
			var newBullet = bullet.instantiate()
			newBullet.look_at_from_position(muzzle.global_transform.origin,
				muzzle.global_transform.origin - muzzle.global_transform.basis.x)
			get_node("/root").add_child(newBullet)

			########## 스크립트 4-11에서 추가 ##########
			gun_shot.play()
			######################################

######################################
	
