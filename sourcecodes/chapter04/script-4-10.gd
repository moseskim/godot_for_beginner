extends RigidBody3D

# 적 캐릭터의 이동 속도를 설정한다
const SPEED = 0.5
# 적 캐릭터의 이동 경로를 저장한다
var path = []
# 이동 경로의 재 계산 간격을 세기 위한 변수
var count=0

@onready var map = get_world_3d().get_navigation_map()
@onready var player  = get_node("/root/Node3D/Player")


func _ready():
	# 불필요한 회전을 억제한다
	self.gravity_scale = 0
	self.axis_lock_linear_x = true
	self.axis_lock_linear_y = true
	self.axis_lock_linear_z = true
	self.axis_lock_angular_x = true
	self.axis_lock_angular_y = true
	self.axis_lock_angular_z = true
	# 다른 객체와의 충돌 감지를 동시 3개까지 활성화한다
	self.contact_monitor = true
	self.max_contacts_reported = 3
	# 플레이어까지의 이동 경로를 취득한다
	path = NavigationServer3D.map_get_path(map,self.position, player.position, true)


func _physics_process(delta):
	count += 1
	if count > 5:
		# 5번에 1번 빈도로 이동 경로를 재 취득한다
		path = NavigationServer3D.map_get_path(map,self.position, player.position, true)
		count = 0

	if path.size() > 0:
		# 이동 방향과 이동량을 계산한다
		var step_size = delta * SPEED
		var destination = path[0]
		var direction = destination - self.position
	
		# 이동량 보다 목적지가 가까우면 목적지에 도달한 것으로 판단한다
		if step_size > direction.length():
			path.remove_at(0)
			return

		# 이동 방향을 향해 이동한다
		self.look_at(self.position - direction)
		self.position += direction.normalized() * step_size

########## 스크립트 4-7에서 추가 ##########

# 적 캐릭터의 HP
@export var hp = 10


func _process(delta):
	if self.hp <= 0:
		self.queue_free()

######################################

########## 스크립트 4-10에서 추가 ##########

func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.hp -= 10

######################################

