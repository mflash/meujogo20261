extends CanvasLayer

func setScore(score: int) -> void:
	$Score.text = "Score: " + str(score)

func mudaScore() -> void:
	print("Executando via chamada de grupo!")
