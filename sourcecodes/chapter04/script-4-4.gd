extends Node

# Enemy 씬을 취득한다
var enemy = preload("res://enemy.tscn")
# Enemy를 작성할 위치(Marker3D 노드)를 취득한다
@onready var points = self.get_children()
# Enemy를 생성하는 간격(초)을 설정한다
@export var interval = 10


func _ready():
  var timer = Timer.new()
  timer.set_wait_time(interval)
  timer.set_one_shot(false)
  timer.connect("timeout", self.generate)
  add_child(timer)
  timer.start()


func generate():
  # Position3D에서 Enemy의 초기 위치를 무작위로 설정한다
  var random = RandomNumberGenerator.new()
  random.randomize()
  var i = random.randi_range(0, points.size()-1)
  # Enemy를 생성한다
  var new_enemy = enemy.instantiate()
  new_enemy.position = points[i].position
  get_node("/root").add_child(new_enemy)
