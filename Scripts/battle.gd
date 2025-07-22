extends Node2D

signal char1hit
signal char2hit
signal enem1hit
signal enem2hit
signal battleended

var battle_active = false
var safety_counter = 0

var Ability1_char1 = false
var Ability2_char1 = false
var Ability1_char2 = false
var Ability2_char2 = false

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("Esc"):
		#get_tree().paused = !get_tree().paused


#What we need here is: when battle selection, define what the effects(preset) of the abilities are, eg: if choice is 1, then the Ability preset is armor +1, attack +1
func _abilities():
	print("Ability function starts")
	while battle_active == true:
		if Ability1_char1 == true:
			pass

func _battle():
	print("--- 战斗开始 ---")
	battle_active = true
	
	while battle_active:
		

		#while get_tree().paused:
			#await get_tree().process_frame
			#
		#if get_tree().paused: # If the game is paused, skip this iteration and wait
			#await get_tree().process_frame # Or some other short delay
			#continue # Go to the next loop iteration
			
		# 检查游戏结束条件
		if Global.char1_hp <= 0 and Global.char2_hp <= 0:
			print("游戏结束 - 所有角色死亡")
			battle_active = false
			break
		
		# 检查胜利条件
		if Global.enem1_hp <= 0 and Global.enem2_hp <= 0:
			print("胜利 - 所有敌人被击败")
			battle_active = false
			break
		
		# 敌人1攻击
		if Global.enem1_hp > 0:
			if Global.char1_hp > 0:
				var damage = max(0, Global.enem1_dmg - Global.char1_armor)
				Global.char1_hp = Global.char1_hp - damage
				emit_signal("char1hit")
				print("dmg dealt char 1 hp:", Global.char1_hp)
				$band.visible = true
				$EnemUniversal.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$EnemUniversal.visible = false

			elif Global.char1_hp <= 0 and Global.char2_hp > 0:
				var damage = max(0, Global.enem1_dmg - Global.char2_armor)
				Global.char2_hp = Global.char2_hp - damage
				emit_signal("char2hit")
				print("dmg dealt char 2 hp:", Global.char2_hp)
				$band.visible = true
				$EnemUniversal.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$EnemUniversal.visible = false
				

		#if get_tree().paused: # If the game is paused, skip this iteration and wait
			#await get_tree().process_frame # Or some other short delay
			#continue # Go to the next loop iteration

		
		# 敌人2攻击
		if Global.enem2_hp > 0:
			if Global.char1_hp > 0:
				var damage = max(0, Global.enem2_dmg - Global.char1_armor)
				Global.char1_hp = Global.char1_hp - damage
				emit_signal("char1hit")
				print("dmg dealt char 1 hp:", Global.char1_hp)
				$band.visible = true
				$EnemUniversal.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$EnemUniversal.visible = false
				

			if Global.char1_hp <= 0 and Global.char2_hp > 0:
				var damage = max(0, Global.enem2_dmg - Global.char2_armor)
				Global.char2_hp = Global.char2_hp - damage
				emit_signal("char2hit")
				print("dmg dealt char 2 hp:", Global.char2_hp)
				$band.visible = true
				$EnemUniversal.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$EnemUniversal.visible = false
				

		#if get_tree().paused: # If the game is paused, skip this iteration and wait
			#await get_tree().process_frame # Or some other short delay
			#continue # Go to the next loop iteration

		
		# 角色1攻击
		if Global.char1_hp > 0:
			if Global.enem1_hp > 0:
				var damage = max(0, Global.char1_dmg - Global.enem1_armor)
				Global.enem1_hp = max(0, Global.enem1_hp - damage)
				emit_signal("enem1hit")
				print("dmg dealt enem1 hp:", Global.enem1_hp)
				$band.visible = true
				$Char1illu.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$Char1illu.visible = false

			if Global.enem1_hp <= 0 and Global.enem2_hp > 0:
				var damage = max(0, Global.char1_dmg - Global.enem2_armor)
				Global.enem2_hp = max(0, Global.enem2_hp - damage)
				emit_signal("enem2hit")
				print("dmg dealt enem2 hp:", Global.enem2_hp)
				$band.visible = true
				$Char1illu.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$Char1illu.visible = false

		#if get_tree().paused: # If the game is paused, skip this iteration and wait
			#await get_tree().process_frame # Or some other short delay
			#continue # Go to the next loop iteration

		# 角色2攻击
		if Global.char2_hp > 0:
			if Global.enem1_hp > 0:
				var damage = max(0, Global.char2_dmg - Global.enem1_armor)
				Global.enem1_hp = max(0, Global.enem1_hp - damage)
				emit_signal("enem1hit")
				print("dmg dealt enem1 hp:", Global.enem1_hp)
				$band.visible = true
				$Char2illu.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$Char2illu.visible = false
			if Global.enem1_hp <= 0 and Global.enem2_hp > 0:
				var damage = max(0, Global.char2_dmg - Global.enem2_armor)
				Global.enem2_hp = max(0, Global.enem2_hp - damage)
				emit_signal("enem2hit")
				print("dmg dealt enem2 hp:", Global.enem2_hp)
				$band.visible = true
				$Char2illu.visible = true
				$band/AnimationPlayer.play("band_attack")
				await get_tree().create_timer(2.0).timeout
				$Char2illu.visible = false

		#if get_tree().paused: # If the game is paused, skip this iteration and wait
			#await get_tree().process_frame # Or some other short delay
			#continue # Go to the next loop iteration
	
	
	emit_signal("battleended")
	#print("--- 战斗结束 ---")
	#if safety_counter >= 200:
		#print("警告: 安全计数器触发")


#func _on_timer_timeout(wait_time: float):
	#print("dmg dealt")

func _ready():
	Global.start1 = false
	# 确保敌人变量初始化
	Global.enem1_hp = 100.0
	Global.enem2_hp = 100.0
	Global.enem1_dmg = 20
	Global.enem2_dmg = 15
	Global.enem1_freq = 1
	Global.enem2_freq = 1
	Global.enem1_armor = 0
	Global.enem2_armor = 0
	Global.char1_hp = 100.0
	Global.char1_freq = 1
	Global.char1_dmg = 30
	Global.char1_armor = 5
	Global.char2_hp = 100.0
	Global.char2_freq = 1
	Global.char2_dmg = 30
	Global.char2_armor = 5
	# ... 其他初始化 ...
	
	# 启动战斗
	get_tree().create_timer(2).timeout.connect(_battle)
	
var health_boost = 1
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("1") and health_boost == 1:
		Global.char1_hp += 10
		Global.char2_hp += 10
		health_boost = 0

"That was ai code, it works in some way?"
#var hp1 = Global.char1_hp
#var freq1 = Global.char1_freq
#var dmg1 = Global.char1_dmg
#var armor1 = Global.char1_armor
#
#var hpe1 = Global.enem1_hp
#var freqe1 = Global.enem1_freq
#var dmge1 = Global.enem1_dmg
#var armore1 = Global.enem1_armor
#
#func _battle():
	#while Global.enem1_hp > 0 and Global.enem2_hp > 0:
		#if Global.char1_hp > 0 and Global.char2_hp > 0:
			#Global.char1_hp = Global.char1_hp - Global.enem1_dmg + Global.char1_armor
			#await get_tree().create_timer(10.00/Global.enem1_freq).timeout
			#Global.char1_hp = Global.char1_hp - Global.enem2_dmg + Global.char1_armor
			#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
			#Global.enem1_hp = Global.enem1_hp - Global.char1_dmg + Global.enem1_armor
			#await get_tree().create_timer(10.00/Global.char1_freq).timeout
			#Global.enem1_hp = Global.enem1_hp - Global.char2_dmg + Global.enem1_armor
			#await get_tree().create_timer(10.00/Global.char2_freq).timeout
		#elif Global.char1_hp <= 0 and Global.char2_hp > 0:
			#Global.char2_hp = Global.char2_hp - Global.enem1_dmg + Global.char2_armor
			#await get_tree().create_timer(10.00/Global.enem1_freq).timeout
			#Global.char2_hp = Global.char2_hp - Global.enem2_dmg + Global.char2_armor
			#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
		#elif Global.char1_hp < 0 and Global.char2_hp < 0:
			#print("Game over")
			##bring up gameover node
	#while Global.enem1_hp <= 0 and Global.enem2_hp > 0:
		#if Global.char1_hp > 0 and Global.char2_hp > 0:
			#Global.char1_hp = Global.char1_hp - Global.enem2_dmg + Global.char1_armor
			#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
			#Global.enem2_hp = Global.enem2_hp - Global.char1_dmg + Global.enem2_armor
			#await get_tree().create_timer(10.00/Global.char1_freq).timeout
			#Global.enem2_hp = Global.enem2_hp - Global.char2_dmg + Global.enem2_armor
			#await get_tree().create_timer(10.00/Global.char2_freq).timeout
		#elif Global.char1_hp <= 0 and Global.char2_hp > 0:
			#Global.char2_hp = Global.char2_hp - Global.enem2_dmg + Global.char2_armor
			#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
		#elif Global.char1_hp < 0 and Global.char2_hp < 0:
			#print("Game over")
			##bring up gameover node
	#if Global.enem1_hp <= 0 and Global.enem2_hp <= 0:
		#print("Stage cleared!")
		##bring up stage cleared node or stage continue node
	#
			#
#func _ready():
	#if Global.char_liaoning == true:
		#if Global.liaoning_placement == 1:
			#Global.char1_hp = 100
			#Global.char1_freq = 1
			#Global.char1_dmg = 30
			#Global.char1_armor = 5
		#elif Global.liaoning_placement == 2:
			#Global.char2_hp = 100
			#Global.char2_freq = 1
			#Global.char2_dmg = 30
			#Global.char2_armor = 5
	#elif Global.char_renhai == true:
		#if Global.renhai_placement == 1:
			#Global.char1_hp = 100
			#Global.char1_freq = 3
			#Global.char1_dmg = 8
			#Global.char1_armor = 3
		#elif Global.renhai_placement == 2:
			#Global.char2_hp = 100
			#Global.char2_freq = 3
			#Global.char2_dmg = 8
			#Global.char2_armor = 3
	#await get_tree().create_timer(2).timeout
	#Global.battlestarted = true
	#print("prepare for battle")
	#_battle()
	#
	
	
	
	
	
	
	
	
	
	
#func _process(delta: float) -> void:
	#if Global.battlestarted == true:
		#while Global.enem1_hp > 0 and Global.enem2_hp > 0:
			#if Global.char1_hp > 0 and Global.char2_hp > 0:
				#Global.char1_hp = Global.char1_hp - Global.enem1_dmg + Global.char1_armor
				#await get_tree().create_timer(10.00/Global.enem1_freq).timeout
				#Global.char1_hp = Global.char1_hp - Global.enem2_dmg + Global.char1_armor
				#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
				#Global.enem1_hp = Global.enem1_hp - Global.char1_dmg + Global.enem1_armor
				#await get_tree().create_timer(10.00/Global.char1_freq).timeout
				#Global.enem1_hp = Global.enem1_hp - Global.char2_dmg + Global.enem1_armor
				#await get_tree().create_timer(10.00/Global.char2_freq).timeout
			#elif Global.char1_hp < 0 and Global.char2_hp > 0:
				#Global.char2_hp = Global.char2_hp - Global.enem1_dmg + Global.char2_armor
				#await get_tree().create_timer(10.00/Global.enem1_freq).timeout
				#Global.char2_hp = Global.char2_hp - Global.enem2_dmg + Global.char2_armor
				#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
			#elif Global.char1_hp < 0 and Global.char2_hp < 0:
				#pass
				##bring up gameover node
		#while Global.enem1_hp < 0 and Global.enem2_hp > 0:
			#if Global.char1_hp > 0 and Global.char2_hp > 0:
				#Global.char1_hp = Global.char1_hp - Global.enem2_dmg + Global.char1_armor
				#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
				#Global.enem2_hp = Global.enem2_hp - Global.char1_dmg + Global.enem2_armor
				#await get_tree().create_timer(10.00/Global.char1_freq).timeout
				#Global.enem2_hp = Global.enem2_hp - Global.char2_dmg + Global.enem2_armor
				#await get_tree().create_timer(10.00/Global.char2_freq).timeout
			#elif Global.char1_hp < 0 and Global.char2_hp > 0:
				#Global.char2_hp = Global.char2_hp - Global.enem2_dmg + Global.char2_armor
				#await get_tree().create_timer(10.00/Global.enem2_freq).timeout
			#elif Global.char1_hp < 0 and Global.char2_hp < 0:
				#pass
				##bring up gameover node
		#while Global.enem1_hp < 0 and Global.enem2_hp > 0:
			#pass
			##bring up stage cleared node or stage continue node

				
			
