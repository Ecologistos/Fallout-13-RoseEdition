/mob/living/simple_animal/hostile/cazador
	name = "cazador"
	desc = "A mutated insect known for its fast speed, deadly sting, and being huge bastards."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "cazador"
	icon_living = "cazador"
	icon_dead = "cazador_dead1"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/cazador_meat = 2, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/animalhide/chitin = 3)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("buzzes")
	emote_taunt_sound = 'sound/creatures/cazador_buzz.ogg'
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	taunt_chance = 30
	speed = 0
	maxHealth = 40
	health = 40
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 20
	melee_damage_upper = 20
	attacktext = "stings"
	attack_sound = 'sound/creatures/cazador_attack.ogg'
	speak_emote = list("buzzes")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("cazador")
	movement_type = FLYING
	a_intent = INTENT_HARM
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/cazador/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent("cazador_venom", 5)

/mob/living/simple_animal/hostile/cazador/death(gibbed)
	icon_dead = "cazador_dead[rand(1,5)]"
	. = ..()

/mob/living/simple_animal/hostile/cazador/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(50))
		return ..()
	else
		visible_message("<span class='danger'>[src] dodges [Proj]!</span>")
		return 0

/mob/living/simple_animal/hostile/cazador/young
	name = "young cazador"
	desc = "A mutated insect known for its fast speed, deadly sting, and being huge bastards. This one's little."
	maxHealth = 40
	health = 40
	speed = 1
	melee_damage_lower = 5
	melee_damage_upper = 10
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/cazador_meat = 1, /obj/item/stack/sheet/animalhide/chitin = 1, /obj/item/stack/sheet/sinew = 1)

/mob/living/simple_animal/hostile/cazador/young/Initialize()
	. = ..()
	resize = 0.8
	update_transform()

/datum/reagent/toxin/cazador_venom
	name = "Cazador venom"
	id = "cazador_venom"
	description = "A potent toxin resulting from cazador stings that quickly kills if too much remains in the body."
	color = "#801E28" // rgb: 128, 30, 40
	toxpwr = 1
	taste_description = "pain"
	taste_mult = 1.3
..
/datum/reagent/toxin/cazador_venom/on_mob_life(mob/living/M)
	if(volume >= 15)
		M.adjustToxLoss(5, 0)
	..()

/mob/living/simple_animal/hostile/radscorpion
	name = "giant radscorpion"
	desc = "A mutated arthropod with an armored carapace and a powerful sting."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "radscorpion"
	icon_living = "radscorpion"
	icon_dead = "radscorpion_dead"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/radscorpion_meat = 2)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("snips")
	emote_taunt_sound = 'sound/creatures/radscorpion_snip.ogg'
	taunt_chance = 30
	speed = 1.25
	maxHealth = 150
	health = 150
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 35
	melee_damage_upper = 35
	a_intent = INTENT_HARM
	attacktext = "stings"
	attack_sound = 'sound/creatures/radscorpion_attack.ogg'
	speak_emote = list("hisses")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("radscorpion")
	gold_core_spawnable = HOSTILE_SPAWN
	var/scorpion_color = "radscorpion" //holder for icon set
	var/list/icon_sets = list("radscorpion", "radscorpion_blue", "radscorpion_black")

/mob/living/simple_animal/hostile/radscorpion/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent("toxin", 5)

/mob/living/simple_animal/hostile/radscorpion/Initialize()
	. = ..()
	scorpion_randomify()
	update_icons()

/mob/living/simple_animal/hostile/radscorpion/proc/scorpion_randomify()
	scorpion_color = pick(icon_sets)
	icon_state = "[scorpion_color]"
	icon_living = "[scorpion_color]"
	icon_dead = "[scorpion_color]_dead"

/mob/living/simple_animal/hostile/gecko
	name = "gecko"
	desc = "A large mutated reptile with sharp teeth."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "gekkon"
	icon_living = "gekkon"
	icon_dead = "gekkon_dead"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/gecko = 2, /obj/item/stack/sheet/animalhide/geckohide = 1)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("screeches")
	taunt_chance = 30
	speed = 1
	maxHealth = 40
	health = 40
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = "claws"
	speak_emote = list("hisses")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	a_intent = INTENT_HARM
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/radroach
	name = "radroach"
	desc = "A large mutated insect that finds its way everywhere."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "radroach"
	icon_living = "radroach"
	icon_dead = "radroach_dead"
	icon_gib = "radroach_gib"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/radroach_meat = 2, /obj/item/stack/sheet/sinew = 1)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("chitters")
	emote_taunt_sound = 'sound/creatures/radroach_chitter.ogg'
	taunt_chance = 30
	speed = 1
	maxHealth = 40
	health = 40
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "stings"
	attack_sound = 'sound/creatures/radroach_attack.ogg'
	speak_emote = list("skitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	a_intent = INTENT_HARM
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/giantant
	name = "fireant"
	desc = "A large mutated insect that finds its way everywhere."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "GiantAnt"
	icon_living = "GiantAnt"
	icon_dead = "GiantAnt_dead"
	icon_gib = "GiantAnt_gib"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/stack/sheet/sinew = 1, /obj/item/reagent_containers/food/snacks/meat/slab/ant_meat = 2)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("chitters")
	emote_taunt_sound = 'sound/creatures/radroach_chitter.ogg'
	taunt_chance = 30
	speed = 1
	maxHealth = 160
	health = 160
	harm_intent_damage = 15
	obj_damage = 20
	melee_damage_lower = 20
	melee_damage_upper = 20
	attacktext = "stings"
	attack_sound = 'sound/creatures/radroach_attack.ogg'
	speak_emote = list("skitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM
	decompose = TRUE

/mob/living/simple_animal/hostile/giantant/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/giantant/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/fireant
	name = "fireant"
	desc = "A large mutated insect that finds its way everywhere."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "FireAnt"
	icon_living = "FireAnt"
	icon_dead = "FireAnt_dead"
	icon_gib = "FireAnt_gib"
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/stack/sheet/sinew = 1, /obj/item/reagent_containers/food/snacks/meat/slab/ant_meat = 2, /obj/item/reagent_containers/food/snacks/rawantbrain = 1)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("chitters")
	emote_taunt_sound = 'sound/creatures/radroach_chitter.ogg'
	taunt_chance = 30
	speed = 1
	maxHealth = 140
	health = 140
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "stings"
	attack_sound = 'sound/creatures/radroach_attack.ogg'
	speak_emote = list("skitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	decompose = TRUE
	a_intent = INTENT_HARM

/mob/living/simple_animal/hostile/fireant/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/fireant/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/fireant/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent("napalm", 0.1)

/obj/item/clothing/head/f13/stalkerpelt
	name = "nightstalker pelt"
	desc = "A hat made from nightstalker pelt which makes the wearer feel both comfortable and elegant."
	icon_state = "stalkerpelt"
	item_state = "fedora"

/obj/structure/stalkeregg
	name = "nightstalker egg"
	desc = "A shiny egg coming from a nightstalker."
	icon = 'icons/mob/wastemobsdrops.dmi'
	icon_state = "stalker-egg"
	density = 1
	anchored = 0

/mob/living/simple_animal/hostile/stalkeryoung
	name = "young nightstalker"
	desc = "A juvenile crazed genetic hybrid of rattlesnake and coyote DNA."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "nightstalker"
	icon_living = "nightstalker"
	icon_dead = "nightstalker_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 2, /obj/item/stack/sheet/sinew = 1)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "bites"
	emote_taunt = list("growls")
	taunt_chance = 30
	speed = -1
	maxHealth = 50
	health = 100
	harm_intent_damage = 10
	obj_damage = 15
	melee_damage_lower = 10
	melee_damage_upper = 20
	attacktext = "bites"
	attack_sound = 'sound/creatures/nightstalker_bite.ogg'
	speak_emote = list("chitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM

/mob/living/simple_animal/hostile/stalker/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent("cazador_venom", 3)

/datum/reagent/toxin/cazador_venom/on_mob_life(mob/living/M)
	if(volume >= 12)
		M.adjustToxLoss(5, 0)
	..()

/mob/living/simple_animal/hostile/stalker
	name = "nightstalker"
	desc = "A crazed genetic hybrid of rattlesnake and coyote DNA."
	icon = 'icons/mob/wastemobslong.dmi'
	icon_state = "nightstalker"
	icon_living = "nightstalker"
	icon_dead = "nightstalker-dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 2, /obj/item/stack/sheet/sinew = 1, /obj/item/clothing/head/f13/stalkerpelt = 1)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "bites"
	emote_taunt = list("growls")
	taunt_chance = 30
	speed = -1
	maxHealth = 300
	health = 300
	harm_intent_damage = 30
	obj_damage = 15
	melee_damage_lower = 20
	melee_damage_upper = 40
	attacktext = "bites"
	attack_sound = 'sound/creatures/nightstalker_bite.ogg'
	speak_emote = list("chitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM

/mob/living/simple_animal/hostile/stalker/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent("cazador_venom", 7)

/datum/reagent/toxin/cazador_venom/on_mob_life(mob/living/M)
	if(volume >= 9)
		M.adjustToxLoss(5, 0)
	..()

/mob/living/simple_animal/hostile/bloatfly
	name = "bloatfly"
	desc = "A common mutated pest resembling an oversized blow-fly."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "bloatfly"
	icon_living = "bloatfly"
	icon_dead = "bloatfly_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 2, /obj/item/stack/sheet/sinew = 1)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "bites"
	emote_taunt = list("growls")
	taunt_chance = 30
	speed = -1
	maxHealth = 40
	health = 40
	harm_intent_damage = 5
	obj_damage = 15
	melee_damage_lower = 5
	melee_damage_upper = 8
	attacktext = "bites"
	attack_sound = 'sound/creatures/bloatfly_attack.ogg'
	speak_emote = list("chitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM

/mob/living/simple_animal/hostile/bloatfly/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(50))
		return ..()
	else
		visible_message("<span class='danger'>[src] dodges [Proj]!</span>")
		return 0

/mob/living/simple_animal/hostile/molerat
	name = "molerat"
	desc = "A large mutated rat-mole hybrid that finds its way everywhere. Common in caves and underground areas."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "mole_rat"
	icon_living = "mole_rat"
	icon_dead = "mole_rat_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/molerat = 2, /obj/item/stack/sheet/sinew = 1)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("hisses")
	taunt_chance = 30
	speed = -1
	maxHealth = 25
	health = 25
	harm_intent_damage = 8
	obj_damage = 15
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "bites"
	attack_sound = 'sound/creatures/molerat_attack.ogg'
	speak_emote = list("chitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM

/mob/living/simple_animal/hostile/radscorpion/black
	name = "giant rad scorpion"
	desc = "A giant irradiated scorpion with a black exoskeleton. Its appearance makes you shudder in fear.<br>This one has giant pincers."
	icon_state = "radscorpion_black"
	icon_living = "radscorpion_black"
	icon_dead = "radscorpion_black_d"
	icon_gib = "gib"
	maxHealth = 150
	health = 150
	melee_damage_lower = 10
	melee_damage_upper = 30
	move_to_delay = 4
	gold_core_spawnable = HOSTILE_SPAWN
