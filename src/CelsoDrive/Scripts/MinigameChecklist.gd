extends Node2D

var arrowCrosshair = load("res://assets/items/crosshair.png")
const CHECK_ITEM = preload("res://scenes/CheckItem.tscn")
var i = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	Input.set_custom_mouse_cursor(arrowCrosshair)


func _on_ItemsTimer_timeout():
	$Path2D/PathFollow2D.offset = randi()
	$Path2D/PathFollow2D2.offset = randi()
	$Path2D/PathFollow2D3.offset = randi()
	var newItem = CHECK_ITEM.instance()
	var newItem2 = CHECK_ITEM.instance()
	var newItem3 = CHECK_ITEM.instance()
	var newItem4 = CHECK_ITEM.instance()
	add_child(newItem)
	add_child(newItem2)
	add_child(newItem3)
	add_child(newItem4)
	newItem.position = $Path2D/PathFollow2D.position
	newItem.connect("exploded", self, "_on_exploded")
	newItem2.position = $Path2D/PathFollow2D2.position
	newItem2.connect("exploded", self, "_on_exploded")
	newItem3.position = $Path2D/PathFollow2D3.position
	newItem3.connect("exploded", self, "_on_exploded")
	newItem4.position = $Path2D/PathFollow2D.position
	newItem4.connect("exploded", self, "_on_exploded")
	

func _on_exploded():
	$VBoxContainer.get_children()[i].visible = true
	i += 1
	
