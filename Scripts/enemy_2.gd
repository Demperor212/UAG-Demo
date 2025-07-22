extends Sprite2D

func hit_effect():
	# 创建抖动动画
	var tween = create_tween()
	# 向左移动
	tween.tween_property(self, "position", position + Vector2(-5, 0), 0.05)
	# 向右移动
	tween.tween_property(self, "position", position + Vector2(5, 0), 0.05)
	# 再次向左
	tween.tween_property(self, "position", position + Vector2(-3, 0), 0.05)
	# 再次向右
	tween.tween_property(self, "position", position + Vector2(3, 0), 0.05)
	
	tween.tween_property(self, "position", position, 0.05)

func _process(delta: float) -> void:
	if Global.enem2_hp == 0:
		$Destroyed.visible = true
		
func _on_battle_enem_2_hit() -> void:
	hit_effect()
