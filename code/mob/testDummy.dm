
/mob/test_dummy
	icon = 'icons/mob/human.dmi'
	icon_state = "body_m_s"

/mob/test_dummy/verb/say(msg as text)
	view(src) << "[src] says, \"[msg]\""

