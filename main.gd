extends Node2D

var total_currency = 0
var clickMultiplier = 1
var clickMulti_cost = 1

@onready var click_button = $main__area/click__area/button
@onready var click_label = $main__area/click__area/label
@onready var clickMulti_button = $main__area/store__area/click__multiplier/button
@onready var clickMulti_label = $main__area/store__area/click__multiplier/label
@onready var error_label = $main__area/error_label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	click_button.pressed.connect(click_pressed)
	clickMulti_button.pressed.connect(clickMulti_add)
	clickMulti_button.text = "Increse multiplier \n" + str(clickMulti_cost) + "c"
	
func click_pressed():
	total_currency = total_currency + (1 * clickMultiplier)
	click_label.text = "Total Currency: " + str(total_currency)
	
func clickMulti_add():
	
	if total_currency >= clickMulti_cost:
		clickMultiplier += 1
		total_currency = total_currency - clickMulti_cost
		clickMulti_label.text = "Current Multiplier: " + str(clickMultiplier)
		click_label.text = "Total Currency: " + str(total_currency)
		
	else:
		error_label.text = "Not enough currency"
		await get_tree().create_timer(2.5).timeout
		error_label.text = " "
