/atom/proc/get_turf(const/atom/O)
	if (isnull(O) || isarea(O))
		return

	var/atom/A = O

	for (var/i = 0, ++i <= 16)
		if (isturf(A))
			return A

		if (istype(A))
			A = A.loc
		else
			return


/atom/proc/examine()
	return

/atom/proc/ShiftClick(var/mob/user)
	if(user.client && user.client.eye == user)
		examine()
		user.face_atom(src)
	return

/atom/proc/CtrlClick(var/mob/user)
	return

/atom/proc/AltClick(var/mob/user)
	var/turf/T = get_turf(src)
	if(T && T.Adjacent(user))
		if(user.listed_turf == T)
			user.listed_turf = null
		else
			user.listed_turf = T
			user.client.statpanel = T.name
	return

