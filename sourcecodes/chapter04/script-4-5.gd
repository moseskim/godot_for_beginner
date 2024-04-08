extends RigidBody3D

# 총탄을 날려 보내는 힘
var power = 2000


func _ready():
	# 중력의 영향을 비활성화한다
	self.gravity_scale = 0
	# 충돌 감지를 활성화한다
	self.contact_monitor = true
	self.max_contacts_reported = 1

	# 총탄이 계속해서 남지 않게 0.5초 후 삭제한다
	var timer = Timer.new()
	self.add_child(timer)
	timer.connect("timeout", self.queue_free)
	timer.set_wait_time(0.5)
	timer.start()

	# 힘을 가해 총탄을 발사한다
	add_constant_central_force(power * global_transform.basis.z)


func _on_Bullet_body_entered(body):
	if body.name == "Player":
		# Player 자신에게 충돌했을 때는 아무것도 하지 않는다
		return

	for g in body.get_groups():
		if g == "enemy":
			# 적에게 충돌했을 때의 처리
			pass
		else:
			# 적 이외의 객체에 충돌했을 때의 처리
			pass

	# 총탄을 삭제한다
	self.queue_free()
