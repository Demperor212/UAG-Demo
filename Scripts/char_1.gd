extends Sprite2D

@onready var texture1: Texture2D = load("res://icon.png") as Texture2D
@onready var texture2: Texture2D = load("res://Navigation.png") as Texture2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	# Example: toggle the boolean variable with a key press (for testing)
	#if Global.battlestarted == true: # Example Key, Change it to what you need
		#update_sprite()
		

func update_sprite() -> void:
		texture = texture1  # Change the texture

@onready var hp_bar = $"../Charhp1"
var hp1 = Global.char1_hp
var freq1 = Global.char1_freq
var dmg1 = Global.char1_dmg
var armor1 = Global.char1_armor

var hpe1 = Global.enem1_hp
var freqe1 = Global.enem1_freq
var dmge1 = Global.enem1_dmg
var armore1 = Global.enem1_armor

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


func _on_battle_char_1_hit() -> void:
	hit_effect()


#func _ready():
	#hp_bar.init(100)  # 初始化100点血


#func take_damage(amount: int):
	#amount = freqe1 * dmge1 - armor1
	#hp1 -= amount
	#hp_bar.update_hp(hp1)
