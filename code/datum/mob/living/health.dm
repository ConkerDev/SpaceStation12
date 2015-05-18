/datum/health
	var/brute_damage
	var/burn_damage
	var/tox_damage
	var/oxy_damage
	var/clone_damage

	//Should this contain an observer list?

/datum/health/New()
	brute_damage = 0
	burn_damage = 0
	tox_damage = 0
	oxy_damage = 0
	clone_damage = 0

/datum/health/proc/isCrit()
	return ((brute_damage + burn_damage + tox_damage + oxy_damage + clone_damage) >= 100)

/datum/health/proc/isDead()
	return ((brute_damage + burn_damage + tox_damage + oxy_damage + clone_damage) >= 200)

/datum/health/proc/addDamage(bruDamage = 0, burnDamage = 0, toxDamage = 0, oxyDamage = 0, cDamage = 0)
	brute_damage += bruDamage
	burn_damage += burnDamage
	tox_damage += toxDamage
	oxy_damage += oxyDamage
	clone_damage += cDamage

/datum/health/proc/removeDamage(bruDamage = 0, burnDamage = 0, toxDamage = 0, oxyDamage = 0, cDamage = 0)
	brute_damage -= bruDamage
	burn_damage -= burnDamage
	tox_damage -= toxDamage
	oxy_damage -= oxyDamage
	clone_damage -= cDamage
