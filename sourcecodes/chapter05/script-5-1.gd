extends StaticBody3D

@onready var sphere = $CSGSphere3D
@onready var mat = StandardMaterial3D.new()
var h = 0.0
var change = false


func _ready():
	# 초기 색상은 흰색으로 설정한다
	mat.albedo_color = Color(1,1,1,1)
	sphere.material = mat


func _process(delta):
	# change가 true이면 색을 변화시킨다
	if change:
		h += 0.001
		if h > 1.0:
			h = 0
		# 색을 HSV(색상, 채도, 명도)로 지정한다. 색상만 변화시킨다
		mat.albedo_color = Color.from_hsv(h, 0.8, 0.9, 1)


func change_color():
	change = !change
