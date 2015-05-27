
/mob
	//var/name
	var/real_name
	var/mind = /datum/mind
	// 1 decisecond click delay (above and beyond mob/next_move)
	var/next_click	= 0

	var/stat = 0 //Mob status. Defined in mob_defines

	var/next_move = null
	var/turf/listed_turf = null  //the current turf being examined in the stat panel