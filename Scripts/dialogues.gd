extends Node2D


func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if Global.start1 == true:
		Dialogic.start("res://Dialogic/11.dtl")
	if Global.start2 == true:
		Dialogic.start("res://Dialogic/12.dtl")

func _on_dialogic_signal(argument:String):
	if argument == "11_ended":
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")
	if argument == "12_ended":
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
