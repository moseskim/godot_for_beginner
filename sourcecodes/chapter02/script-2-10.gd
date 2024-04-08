extends Node2D


# _ready()는 프로그램 실행 시 1번만 실행된다
func _ready():

	var fruits:Array = ["Apple", "Orange", "Banana"]

	for f in fruits:
		print("과일: ", f)
