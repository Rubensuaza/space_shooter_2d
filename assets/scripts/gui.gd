extends CanvasLayer


func _process(delta):
	%Credits.text = "CREDITS: " + str(GLOBAL.credits)
	%Score.text = "SCORE: " + str(GLOBAL.score)
