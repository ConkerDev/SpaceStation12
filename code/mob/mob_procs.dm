// Simple helper to face what you clicked on, in case it should be needed in more than one place
/mob/proc/face_atom(var/atom/A)
	if( stat || !A || !x || !y || !A.x || !A.y ) return
	var/dx = A.x - x
	var/dy = A.y - y
	if(!dx && !dy) return

	if(abs(dx) < abs(dy))
		if(dy > 0)	usr.dir = NORTH
		else		usr.dir = SOUTH
	else
		if(dx > 0)	usr.dir = EAST
		else		usr.dir = WEST

/mob/proc/ClickOn( var/atom/A, var/params )

	if(world.time <= next_click)
		return
	next_click = world.time + 1

	var/list/modifiers = params2list(params)
	if(modifiers["middle"])
		MiddleClickOn(A)
		return
	if(modifiers["shift"])
		ShiftClickOn(A)
		return
	if(modifiers["alt"]) // alt and alt-gr (rightalt)
		AltClickOn(A)
		return
	if(modifiers["ctrl"])
		CtrlClickOn(A)
		return

	if(stat & (M_INACTIVE | M_PARALYSIS | M_STUNNED | M_WEAKENED))
		return

	face_atom(A)

	if(next_move > world.time) // in the year 2000...
		return

	if(!isturf(loc)) // This is going to stop you from telekinesing from inside a closet, but I don't shed many tears for that
		return


// Default behavior: ignore double clicks, consider them normal clicks instead
/mob/proc/DblClickOn(var/atom/A, var/params)
	//ClickOn(A,params)
	return

/mob/proc/MiddleClickOn(var/atom/A)
	return

/mob/proc/ShiftClickOn(var/atom/A)
	A.ShiftClick(src)
	return

/mob/proc/CtrlClickOn(var/atom/A)
	A.CtrlClick(src)
	return

/mob/proc/AltClickOn(var/atom/A)
	A.AltClick(src)
	return