extends TextureProgressBar

var current_hp = 1.0

func init(max_hp: int):
	max_value = max_hp
	value = max_hp  # 初始满血

func update_hp(current_hp: int):
	value = current_hp
	## 可选：颜色变化
	#if value < max_value * 0.3:
		#add_theme_color_override("font_color", Color.RED)

func _process(delta: float) -> void:
	var target = float(Global.char1_hp)
	
	if current_hp >= 0.5:
		current_hp = Global.char1_hp
		value = lerp(float(value), float(current_hp), 0.1)
	else:
		value = 0
