extends Node2D

var cur_question_no: int = 0

var questions: Array[String] = [
	"What do you feed your creature?",
	"What do you let your creature play with?",
]


enum AdjList{
	NAME, GROWTH_PATH, OPTIONS
}

enum{
	START,
	SAUSAGE,
	STINGRAY,
	EGG,
	DORITOS,
	SKATEBOARD,
	CAR,
	BOWLING,
	GOLDFISH,
	TOY_BLOCKS,
	TOY_FISH,
	NUMBERS,
}

var growth_adj_list: Array[Array] = [
	["Start", [SAUSAGE, EGG, STINGRAY, DORITOS], ["Sausage", "Eggs", "One Whole Stingray", "Doritos (for breakfast)"]],
	["Sausage", [SAUSAGE, EGG, STINGRAY, DORITOS], ["Sausage", "Eggs", "One Whole Stingray", "Doritos (for breakfast)"]],
	["Stingray", [SAUSAGE, EGG, STINGRAY, DORITOS], ["Sausage", "Eggs", "One Whole Stingray", "Doritos (for breakfast)"]],
	["Egg", [SAUSAGE, EGG, STINGRAY, DORITOS], ["Sausage", "Eggs", "One Whole Stingray", "Doritos (for breakfast)"]],
	["Doritos", [SAUSAGE, EGG, STINGRAY, DORITOS], ["Sausage", "Eggs", "One Whole Stingray", "Doritos (for breakfast)"]], 
]

var cur_pet_type: int = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(%OptionsGridContainer.get_child_count()):
		var option: Button = %OptionsGridContainer.get_child(i)
		option.pressed.connect(option_pressed.bind(i))
	update_options(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Control/CurPetLabel.text = "Current Pet: " + str(growth_adj_list[cur_pet_type][AdjList.NAME])
	


func update_options(pet_type: int) -> void:
	for i in range(%OptionsGridContainer.get_child_count()):
		var option: Button = %OptionsGridContainer.get_child(i)
		option.text = growth_adj_list[pet_type][AdjList.OPTIONS][i]


func option_pressed(option_no: int) -> void:
	cur_pet_type = growth_adj_list[cur_pet_type][AdjList.GROWTH_PATH][option_no]
