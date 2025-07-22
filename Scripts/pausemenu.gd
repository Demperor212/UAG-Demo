
# PauseMenu.gd
extends CanvasLayer

func _ready():
	# 关键！确保菜单即使在游戏暂停时也能处理输入和逻辑。
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	
	# 游戏开始时，暂停菜单是隐藏的
	hide()

func _process(delta):
	# 检查 'pause' 动作是否被触发
	if Input.is_action_just_pressed("Esc"):
		# 切换暂停状态
		get_tree().paused = !get_tree().paused

		# 根据暂停状态显示或隐藏菜单
		if get_tree().paused:
			show() # 暂停时，显示菜单
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) # 显示鼠标指针以便点击按钮
		else:
			hide() # 恢复时，隐藏菜单
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # 隐藏并锁定鼠标以进行游戏
