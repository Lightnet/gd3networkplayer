extends KinematicBody

var t
var r

var move_speed = 10
var rotation_speed = 0.1
var jump = 10
const SLOPE_SLIDE_STOP = 25.0
const FLOOR_NORMAL = Vector3(0,1,0)

var dir = Vector3()

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	dir.y = -1 * move_speed

func _input(event):
	pass
	
func _fixed_process(delta):
	t = get_transform()
	r = get_rotation()
	
	if Input.is_action_just_pressed("move_up"):
		t.origin += t.basis[2] * -move_speed
		dir = t.basis[2] * -move_speed
	if Input.is_action_just_pressed("move_down"):
		t.origin += t.basis[2] * move_speed
		dir = t.basis[2] * move_speed
	if Input.is_action_just_released("move_up") or Input.is_action_just_released("move_down"):
		dir.x = 0
		dir.y = -1 * move_speed
		dir.z = 0
	#print(dir)
	#move(dir)
	move_and_slide( dir, FLOOR_NORMAL, SLOPE_SLIDE_STOP )
	
	if(Input.is_action_pressed("move_right")):
		r += Vector3(0,-1,0) * rotation_speed
		
	if(Input.is_action_pressed("move_left")):
		r += Vector3(0,1,0) * rotation_speed
		
	if(Input.is_action_pressed("jump")):
		#move(Vector3(0,1,0))
		move_and_slide( Vector3(0,50,0), FLOOR_NORMAL, SLOPE_SLIDE_STOP )
	#set_transform(t)
	set_rotation(r)
	pass