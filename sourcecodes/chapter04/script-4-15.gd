extends Label

var fmt = "Killed %d"
var killed = 0


func _process(delta):
	self.text = fmt % killed
