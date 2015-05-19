/datum/mind
	var/key
	var/name
	var/mob/living/current //Holds the mob the mind is currently at
	var/active = 0

	var/memory	//IC Notes contents

	//Things to add: Objectives, roles, and station accounts

/datum/mind/New(var/key)
	src.key = key


/datum/mind/proc/store_memory(new_text)
	memory += "[new_text]<BR>"


/datum/mind/proc/show_memory(mob/recipient)
	var/output = "<B>[current.real_name]'s Memory</B><HR>"
	output += memory
	/*
	if(objectives.len>0)
		output += "<HR><B>Objectives:</B>"

		var/obj_count = 1
		for(var/datum/objective/objective in objectives)
			output += "<B>Objective #[obj_count]</B>: [objective.explanation_text]"
			obj_count++
	*/
	recipient << browse(output,"window=memory")


/datum/mind/proc/edit_memory()
	//if round hasnt begun, return with error

	//else
	var/out = "<B>[name]</B>[(current&&(current.real_name!=name))?" (as [current.real_name])":""]<br>"

	out += {"Mind currently owned by key: [key] [active?"(synced)":"(not synced)"]<br>
			<a href='?src=\ref[src];role_edit=1'>Edit</a><br>"}

	out += {"<br>
			<b>Memory:</b>
			<br>[memory]
			<br><a href='?src=\ref[src];memory_edit=1'>Edit memory</a>"}


/datum/mind/Topic(href, href_list)	//Receives href calls, and handles them
									//Mising necesary procs
/*	if (href_list["memory_edit"])
		var/new_memo = copytext(sanitize(input("Write new memory", "Memory", memory) as null|message),1,MAX_MESSAGE_LEN)
		if (isnull(new_memo)) return
		memory = new_memo

*/

//Initialisation procs
/mob/proc/mind_initialize() // ¿/mob instead of /mob/living?
	if(mind)
		//mind.key = key
	else
		mind = new /datum/mind(key)
		world.log << "## DEBUG: mind_initialize(): No ticker ready yet! Please inform Carn"
	//if(!mind.name)	mind.name = real_name
	//mind.current = src

