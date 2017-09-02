extends KinematicBody

var t
var r

var move_speed = 10
var rotation_speed = 0.1
var jump = 10
const SLOPE_SLIDE_STOP = 25.0
const FLOOR_NORMAL = Vector3(0,1,0)

var MOVE_LEFT = false
var MOVE_RIGHT = false
var MOVE_UP = false
var MOVE_DOWN = false

func _ready():
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	if Input.is_action_just_pressed("move_up"):
		MOVE_UP = true
	if Input.is_action_just_released("move_up"):
		MOVE_UP = false
	if Input.is_action_just_pressed("move_down"):
		MOVE_DOWN = true
	if Input.is_action_just_released("move_down"):
		MOVE_DOWN = false
	pass
	
func _fixed_process(delta):
	t = get_transform()
	r = get_rotation()
	#print(Input.is_action_just_pressed("move_up"))
	
	#var camera = get_node("Camera")
	#camera.get
	var dir = Vector3()
	if MOVE_UP:
		#move(Vector3(-1,0,0))
		t.origin += t.basis[2] * -move_speed
		dir = t.basis[2] * -move_speed
		#print(dir)
		#dir.y = 0.1
		#move(dir)
		#t.orthonormalized()
		#move(t)
	elif MOVE_DOWN:
		#move(Vector3(1,0,0))
		t.origin += t.basis[2] * move_speed
		dir = t.basis[2] * move_speed
		#dir.y = 0.1
		#move(dir)
		#t.orthonormalized()
		#move(t)
	else:
		#dir.y = -0.5
		dir.y = -1 * move_speed
		#move(Vector3(0,-0.5,0))
		pass
	#move(dir)
	move_and_slide( dir, FLOOR_NORMAL, SLOPE_SLIDE_STOP )
	
	if(Input.is_action_pressed("move_right")):
		r += Vector3(0,-1,0) * rotation_speed
		
	if(Input.is_action_pressed("move_left")):
		r += Vector3(0,1,0) * rotation_speed
		
	if(Input.is_action_pressed("jump")):
		move(Vector3(0,1,0))
	#set_transform(t)
	set_rotation(r)
		
	#var motion = velocity * delta;
	#motion = move(motion);
	
	if(self.is_on_floor()):
		#print("Floor")
		pass
	else:
		#print("AIR")
		pass
	#print(get_collision_count())
	
	
	
	#if (is_colliding()):
		#var norm = get_collision_normal()
		#var motion = motion.slide(norm)
		#velocity = velocity.slide(norm)
		#move(motion);
		
		
		
		
	pass
	
	
	
	
	