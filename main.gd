extends Node2D

var total_currency = 0
var multiplier = 1
var multi_cost = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$Button.pressed.connect(button_pressed)
	$multiplier_button.pressed.connect(multiplier_add)
	$multiplier_button.text = "Increse multiplier \n" + str(multi_cost) + "c"
	
func button_pressed():
	total_currency = total_currency + (1 * multiplier)
	$Label.text = "Total Currency: " + str(total_currency)
	
func multiplier_add():
	
	if total_currency >= multi_cost:
		multiplier += 1
		total_currency = total_currency - multi_cost
		$multiplier_label.text = "Current Multiplier: " + str(multiplier)
		$Label.text = "Total Currency: " + str(total_currency)
		
	else:
		$error_label.text = "Not enough currency"
		await get_tree().create_timer(2.5).timeout
		$error_label.text = " "
