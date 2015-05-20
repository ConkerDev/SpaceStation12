//First in last out queue datum.
//Allows you to store assoc lists with duplicate values.
/datum/queue
	var/list/queue1[0]
	var/list/queue2[0]

//Add something to the end of the queue.
/datum/queue/proc/add(var/value, var/assoc_value)
	queue1 += value
	queue2 += assoc_value

//Use this to get the next assoc value in the queue
/datum/queue/proc/next()
	var/list/assoc_list[1]
	assoc_list[queue1[1]] = queue2[1]

	queue1.Cut(End = 2)
	queue2.Cut(End = 2)

	return assoc_list