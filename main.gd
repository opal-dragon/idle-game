extends Node2D

var total_currency = 0
var multiplier = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$Button.pressed.connect(button_pressed)
	$multiplier_button.pressed.connect(multiplier_add)
	
func button_pressed():
	total_currency = total_currency + (1 * multiplier)
	$Label.text = "Total Currency: " + str(total_currency)
	
func multiplier_add():
	multiplier += .5
	$multiplier_label.text = "Current Multiplier: " + str(multiplier)
