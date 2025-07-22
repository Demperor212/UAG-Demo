extends Sprite2D


func _on_battle_battleended() -> void:
	Global.start2 = true
	$".".visible = not $".".visible
	$Continue.visible = true
