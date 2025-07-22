extends Node

var start1 = true
var start2 = false

var char1_hp = 100.0
var char1_freq = 100
var char1_dmg = 100
var char1_armor = 100

var char2_hp = 100.0
var char2_freq = 100
var char2_dmg = 100
var char2_armor = 100

var enem1_hp = 100.0
var enem1_freq = 100
var enem1_dmg = 100
var enem1_armor = 100

var enem2_hp = 100.0
var enem2_freq = 100
var enem2_dmg = 100
var enem2_armor = 100

var battlestarted = false
var char_renhai
var char_liaoning
var renhai_placement
var liaoning_placement
var char_placeholder
var placeholder_placement

func wait(seconds: float) -> void:
  await get_tree().create_timer(2).timeout
