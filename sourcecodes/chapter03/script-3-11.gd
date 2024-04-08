extends Area2D


func goal(body):
	if body.name == "Player":
		
		# 스크립트 3-11에서 삭제
		# print("Goal")
		
		# 스크립트 3-11에서 추가
		var gameclear = $"/root/Node2D/Gameclear"
		gameclear.z_index = 200
		gameclear.visible=true
		get_tree().paused=true
