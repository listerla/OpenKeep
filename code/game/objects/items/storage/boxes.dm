/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes.
 *		Action Figure Boxes
 *		Various paper bags.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/storage/box
	name = "box"
	desc = ""
	icon_state = "box"
	item_state = "syringe_kit"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/items/matchboxdrop.ogg'
	pickup_sound =  'sound/blank.ogg'
	var/foldable
	var/illustration = "writing"

/obj/item/storage/box/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/storage/box/suicide_act(mob/living/carbon/user)
	var/obj/item/bodypart/head/myhead = user.get_bodypart(BODY_ZONE_HEAD)
	if(myhead)
		user.visible_message("<span class='suicide'>[user] puts [user.p_their()] head into \the [src], and begins closing it! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		myhead.dismember()
		myhead.forceMove(src)//force your enemies to kill themselves with your head collection box!
		playsound(user, "desceration-01.ogg", 50, TRUE, -1)
		return BRUTELOSS
	user.visible_message("<span class='suicide'>[user] beating [user.p_them()]self with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/obj/item/storage/box/update_icon()
	. = ..()
	if(illustration)
		cut_overlays()
		add_overlay(illustration)

/obj/item/storage/box/attack_self(mob/user)
	..()

	if(!foldable)
		return
	if(contents.len)
		to_chat(user, "<span class='warning'>I can't fold this box with items still inside!</span>")
		return
	if(!ispath(foldable))
		return

	to_chat(user, "<span class='notice'>I fold [src] flat.</span>")
	var/obj/item/I = new foldable
	qdel(src)
	user.put_in_hands(I)

/obj/item/storage/box/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stack/packageWrap))
		return 0
	return ..()

//Mime spell boxes

/obj/item/storage/box/mime
	name = "invisible box"
	desc = ""
	foldable = null
	icon_state = "box"
	item_state = null
	alpha = 0

/obj/item/storage/box/mime/attack_hand(mob/user)
	..()
	if(user.mind.miming)
		alpha = 255

/obj/item/storage/box/mime/Moved(oldLoc, dir)
	if (iscarbon(oldLoc))
		alpha = 0
	..()



// Ordinary survival box
/obj/item/storage/box/survival
	var/mask_type = /obj/item/clothing/mask/breath
	var/internal_type = /obj/item/tank/internals/emergency_oxygen
	var/medipen_type = /obj/item/reagent_containers/hypospray/medipen

/obj/item/storage/box/survival/PopulateContents()
	new mask_type(src)
	if(!isnull(medipen_type))
		new medipen_type(src)

	if(!isplasmaman(loc))
		new internal_type(src)
	else
		new /obj/item/tank/internals/plasmaman/belt(src)


/obj/item/storage/box/gloves
	name = "box of latex gloves"
	desc = ""
	illustration = "latex"

/obj/item/storage/box/gloves/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/clothing/gloves/color/latex(src)

/obj/item/storage/box/masks
	name = "box of sterile masks"
	desc = ""
	illustration = "sterile"

/obj/item/storage/box/masks/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/clothing/mask/surgical(src)

/obj/item/storage/box/syringes
	name = "box of syringes"
	desc = ""
	illustration = "syringe"

/obj/item/storage/box/syringes/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/syringe(src)

/obj/item/storage/box/syringes/variety
	name = "syringe variety box"

/obj/item/storage/box/syringes/variety/PopulateContents()
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/reagent_containers/syringe/lethal(src)
	new /obj/item/reagent_containers/syringe/noreact(src)
	new /obj/item/reagent_containers/syringe/piercing(src)
	new /obj/item/reagent_containers/syringe/bluespace(src)

/obj/item/storage/box/medipens
	name = "box of medipens"
	desc = ""
	illustration = "syringe"

/obj/item/storage/box/medipens/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/hypospray/medipen(src)

/obj/item/storage/box/medipens/utility
	name = "stimpack value kit"
	desc = ""
	illustration = "syringe"

/obj/item/storage/box/medipens/utility/PopulateContents()
	..() // includes regular medipens.
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/hypospray/medipen/stimpack(src)

/obj/item/storage/box/beakers
	name = "box of beakers"
	illustration = "beaker"

/obj/item/storage/box/beakers/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/glass/beaker( src )

/obj/item/storage/box/beakers/bluespace
	name = "box of bluespace beakers"
	illustration = "beaker"

/obj/item/storage/box/beakers/bluespace/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/glass/beaker/bluespace(src)

/obj/item/storage/box/beakers/variety
	name = "beaker variety box"

/obj/item/storage/box/beakers/variety/PopulateContents()
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/beaker/large(src)
	new /obj/item/reagent_containers/glass/beaker/plastic(src)
	new /obj/item/reagent_containers/glass/beaker/meta(src)
	new /obj/item/reagent_containers/glass/beaker/noreact(src)
	new /obj/item/reagent_containers/glass/beaker/bluespace(src)

/obj/item/storage/box/medigels
	name = "box of medical gels"
	desc = ""

/obj/item/storage/box/medigels/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/medigel( src )

/obj/item/storage/box/injectors
	name = "box of DNA injectors"
	desc = ""

/obj/item/storage/box/injectors/PopulateContents()
	var/static/items_inside = list(
		/obj/item/dnainjector/h2m = 3,
		/obj/item/dnainjector/m2h = 3)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/flashbangs
	name = "box of flashbangs (WARNING)"
	desc = ""
	icon_state = "secbox"
	illustration = "flashbang"

/obj/item/storage/box/flashbangs/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/grenade/flashbang(src)

/obj/item/storage/box/emps
	name = "box of emp grenades"
	desc = ""
	illustration = "flashbang"

/obj/item/storage/box/emps/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/grenade/empgrenade(src)

/obj/item/storage/box/trackimp
	name = "boxed tracking implant kit"
	desc = ""
	illustration = "implant"

/obj/item/storage/box/trackimp/PopulateContents()
	var/static/items_inside = list(
		/obj/item/implantcase/tracking = 4,
		/obj/item/implanter = 1,
		/obj/item/implantpad = 1)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/minertracker
	name = "boxed tracking implant kit"
	desc = ""
	illustration = "implant"

/obj/item/storage/box/minertracker/PopulateContents()
	var/static/items_inside = list(
		/obj/item/implantcase/tracking = 3,
		/obj/item/implanter = 1,
		/obj/item/implantpad = 1)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/chemimp
	name = "boxed chemical implant kit"
	desc = ""
	illustration = "implant"

/obj/item/storage/box/chemimp/PopulateContents()
	var/static/items_inside = list(
		/obj/item/implantcase/chem = 5,
		/obj/item/implanter = 1,
		/obj/item/implantpad = 1)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/exileimp
	name = "boxed exile implant kit"
	desc = ""
	illustration = "implant"

/obj/item/storage/box/exileimp/PopulateContents()
	var/static/items_inside = list(
		/obj/item/implantcase/exile = 5,
		/obj/item/implanter = 1)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/bodybags
	name = "body bags"
	desc = ""
	illustration = "bodybags"

/obj/item/storage/box/bodybags/PopulateContents()
	..()
	for(var/i in 1 to 7)
		new /obj/item/bodybag(src)

/obj/item/storage/box/rxglasses
	name = "box of prescription glasses"
	desc = ""
	illustration = "glasses"

/obj/item/storage/box/rxglasses/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/clothing/glasses/regular(src)

/obj/item/storage/box/drinkingglasses
	name = "box of drinking glasses"
	desc = ""

/obj/item/storage/box/drinkingglasses/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/drinks/drinkingglass(src)

/obj/item/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = ""

/obj/item/storage/box/condimentbottles/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/condiment(src)

/obj/item/storage/box/cups
	name = "box of paper cups"
	desc = ""

/obj/item/storage/box/cups/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/food/drinks/sillycup( src )

/obj/item/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = ""
	icon_state = "donkpocketbox"
	illustration=null

/obj/item/storage/box/donkpockets/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(/obj/item/reagent_containers/food/snacks/donkpocket))

/obj/item/storage/box/donkpockets/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/snacks/donkpocket(src)

/obj/item/storage/box/monkeycubes
	name = "monkey cube box"
	desc = ""
	icon_state = "monkeycubebox"
	illustration = null
	var/cube_type = /obj/item/reagent_containers/food/snacks/monkeycube

/obj/item/storage/box/monkeycubes/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/reagent_containers/food/snacks/monkeycube))

/obj/item/storage/box/monkeycubes/PopulateContents()
	for(var/i in 1 to 5)
		new cube_type(src)

/obj/item/storage/box/monkeycubes/syndicate
	desc = ""
	cube_type = /obj/item/reagent_containers/food/snacks/monkeycube/syndicate

/obj/item/storage/box/gorillacubes
	name = "gorilla cube box"
	desc = ""
	icon_state = "monkeycubebox"
	illustration = null

/obj/item/storage/box/gorillacubes/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 3
	STR.set_holdable(list(/obj/item/reagent_containers/food/snacks/monkeycube))

/obj/item/storage/box/gorillacubes/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/snacks/monkeycube/gorilla(src)

/obj/item/storage/box/ids
	name = "box of spare IDs"
	desc = ""
	illustration = "id"

/obj/item/storage/box/ids/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/card/id(src)

/obj/item/storage/box/silver_ids
	name = "box of spare silver IDs"
	desc = ""
	illustration = "id"

/obj/item/storage/box/silver_ids/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/card/id/silver(src)

/obj/item/storage/box/prisoner
	name = "box of prisoner IDs"
	desc = ""
	illustration = "id"

/obj/item/storage/box/prisoner/PopulateContents()
	..()
	new /obj/item/card/id/prisoner/one(src)
	new /obj/item/card/id/prisoner/two(src)
	new /obj/item/card/id/prisoner/three(src)
	new /obj/item/card/id/prisoner/four(src)
	new /obj/item/card/id/prisoner/five(src)
	new /obj/item/card/id/prisoner/six(src)
	new /obj/item/card/id/prisoner/seven(src)

/obj/item/storage/box/firingpins
	name = "box of standard firing pins"
	desc = ""
	illustration = "id"

/obj/item/storage/box/firingpins/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin(src)

/obj/item/storage/box/firingpins/paywall
	name = "box of paywall firing pins"
	desc = ""
	illustration = "id"

/obj/item/storage/box/firingpins/paywall/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/paywall(src)

/obj/item/storage/box/handcuffs
	name = "box of spare handcuffs"
	desc = ""
	icon_state = "secbox"
	illustration = "handcuff"

/obj/item/storage/box/handcuffs/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/restraints/handcuffs(src)

/obj/item/storage/box/zipties
	name = "box of spare zipties"
	desc = ""
	icon_state = "secbox"
	illustration = "handcuff"

/obj/item/storage/box/zipties/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/restraints/handcuffs/cable/zipties(src)

/obj/item/storage/box/alienhandcuffs
	name = "box of spare handcuffs"
	desc = ""
	icon_state = "alienbox"
	illustration = "handcuff"

/obj/item/storage/box/alienhandcuffs/PopulateContents()
	for(var/i in 1 to 7)
		new	/obj/item/restraints/handcuffs/alien(src)

/obj/item/storage/box/fakesyndiesuit
	name = "boxed space suit and helmet"
	desc = ""
	icon_state = "syndiebox"

/obj/item/storage/box/fakesyndiesuit/PopulateContents()
	new /obj/item/clothing/head/syndicatefake(src)
	new /obj/item/clothing/suit/syndicatefake(src)

/obj/item/storage/box/mousetraps
	name = "box of Pest-B-Gon mousetraps"
	desc = ""
	illustration = "mousetrap"

/obj/item/storage/box/mousetraps/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/assembly/mousetrap(src)

/obj/item/storage/box/pillbottles
	name = "box of pill bottles"
	desc = ""
	illustration = "pillbox"

/obj/item/storage/box/pillbottles/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/storage/pill_bottle(src)

/obj/item/storage/box/snappops
	name = "snap pop box"
	desc = ""
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"

/obj/item/storage/box/snappops/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(/obj/item/toy/snappop))
	STR.max_items = 8

/obj/item/storage/box/snappops/PopulateContents()
	SEND_SIGNAL(src, COMSIG_TRY_STORAGE_FILL_TYPE, /obj/item/toy/snappop)

/obj/item/storage/box/matches
	name = "matchbox"
	desc = ""
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "matchbox"
	item_state = "zippo"
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BELT
	foldable = FALSE

/obj/item/storage/box/matches/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.set_holdable(list(/obj/item/match))

/obj/item/storage/box/matches/PopulateContents()
	SEND_SIGNAL(src, COMSIG_TRY_STORAGE_FILL_TYPE, /obj/item/match)

/obj/item/storage/box/matches/attackby(obj/item/match/W as obj, mob/user as mob, params)
	if(istype(W, /obj/item/match))
		if(prob(30))
			W.matchignite()
		else
			playsound(src, "sound/items/match_fail.ogg", 100, FALSE)

/obj/item/storage/box/lights
	name = "box of replacement bulbs"
	icon = 'icons/obj/storage.dmi'
	illustration = "light"
	desc = ""
	item_state = "syringe_kit"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	foldable = /obj/item/stack/sheet/cardboard //BubbleWrap

/obj/item/storage/box/lights/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 21
	STR.set_holdable(list(/obj/item/light/tube, /obj/item/light/bulb))
	STR.max_combined_w_class = 21
	STR.click_gather = FALSE //temp workaround to re-enable filling the light replacer with the box

/obj/item/storage/box/lights/bulbs/PopulateContents()
	for(var/i in 1 to 21)
		new /obj/item/light/bulb(src)

/obj/item/storage/box/lights/tubes
	name = "box of replacement tubes"
	illustration = "lighttube"

/obj/item/storage/box/lights/tubes/PopulateContents()
	for(var/i in 1 to 21)
		new /obj/item/light/tube(src)

/obj/item/storage/box/lights/mixed
	name = "box of replacement lights"
	illustration = "lightmixed"

/obj/item/storage/box/lights/mixed/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/light/tube(src)
	for(var/i in 1 to 7)
		new /obj/item/light/bulb(src)


/obj/item/storage/box/deputy
	name = "box of deputy armbands"
	desc = ""

/obj/item/storage/box/deputy/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/clothing/accessory/armband/deputy(src)

/obj/item/storage/box/hug
	name = "box of hugs"
	desc = ""
	icon_state = "hugbox"
	illustration = "heart"
	foldable = null

/obj/item/storage/box/hug/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] clamps the box of hugs on [user.p_their()] jugular! Guess it wasn't such a hugbox after all..</span>")
	return (BRUTELOSS)

/obj/item/storage/box/hug/attack_self(mob/user)
	..()
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, "rustle", 50, TRUE, -5)
	user.visible_message("<span class='notice'>[user] hugs \the [src].</span>","<span class='notice'>I hug \the [src].</span>")


//////
/obj/item/storage/box/hug/medical/PopulateContents()
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_containers/hypospray/medipen(src)

// Clown survival box
/obj/item/storage/box/hug/survival/PopulateContents()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/reagent_containers/hypospray/medipen(src)

	if(!isplasmaman(loc))
		new /obj/item/tank/internals/emergency_oxygen(src)
	else
		new /obj/item/tank/internals/plasmaman/belt(src)

/obj/item/storage/box/rubbershot
	name = "box of rubber shots"
	desc = ""
	icon_state = "rubbershot_box"
	illustration = null

/obj/item/storage/box/rubbershot/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/rubbershot(src)

/obj/item/storage/box/lethalshot
	name = "box of lethal shotgun shots"
	desc = ""
	icon_state = "lethalshot_box"
	illustration = null

/obj/item/storage/box/lethalshot/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/buckshot(src)

/obj/item/storage/box/beanbag
	name = "box of beanbags"
	desc = ""
	icon_state = "rubbershot_box"
	illustration = null

/obj/item/storage/box/beanbag/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_casing/shotgun/beanbag(src)

/obj/item/storage/box/actionfigure
	name = "box of action figures"
	desc = ""
	icon_state = "box"

/obj/item/storage/box/actionfigure/PopulateContents()
	for(var/i in 1 to 4)
		var/randomFigure = pick(subtypesof(/obj/item/toy/figure))
		new randomFigure(src)

#define NODESIGN "None"
#define NANOTRASEN "NanotrasenStandard"
#define SYNDI "SyndiSnacks"
#define HEART "Heart"
#define SMILEY "SmileyFace"

/obj/item/storage/box/papersack
	name = "paper sack"
	desc = ""
	icon_state = "paperbag_None"
	item_state = "paperbag_None"
	resistance_flags = FLAMMABLE
	foldable = null
	var/design = NODESIGN

/obj/item/storage/box/papersack/update_icon()
	if(contents.len == 0)
		icon_state = "[item_state]"
	else icon_state = "[item_state]_closed"

/obj/item/storage/box/papersack/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/pen))
		//if a pen is used on the sack, dialogue to change its design appears
		if(contents.len)
			to_chat(user, "<span class='warning'>I can't modify [src] with items still inside!</span>")
			return
		var/list/designs = list(NODESIGN, NANOTRASEN, SYNDI, HEART, SMILEY, "Cancel")
		var/switchDesign = input("Select a Design:", "Paper Sack Design", designs[1]) in sortList(designs)
		if(get_dist(usr, src) > 1)
			to_chat(usr, "<span class='warning'>I have moved too far away!</span>")
			return
		var/choice = designs.Find(switchDesign)
		if(design == designs[choice] || designs[choice] == "Cancel")
			return 0
		to_chat(usr, "<span class='notice'>I make some modifications to [src] using your pen.</span>")
		design = designs[choice]
		icon_state = "paperbag_[design]"
		item_state = "paperbag_[design]"
		switch(designs[choice])
			if(NODESIGN)
				desc = ""
			if(NANOTRASEN)
				desc = ""
			if(SYNDI)
				desc = ""
			if(HEART)
				desc = ""
			if(SMILEY)
				desc = ""
		return 0
	else if(W.get_sharpness())
		if(!contents.len)
			if(item_state == "paperbag_None")
				user.show_message("<span class='notice'>I cut eyeholes into [src].</span>", MSG_VISUAL)
				new /obj/item/clothing/head/papersack(user.loc)
				qdel(src)
				return 0
			else if(item_state == "paperbag_SmileyFace")
				user.show_message("<span class='notice'>I cut eyeholes into [src] and modify the design.</span>", MSG_VISUAL)
				new /obj/item/clothing/head/papersack/smiley(user.loc)
				qdel(src)
				return 0
	return ..()

#undef NODESIGN
#undef NANOTRASEN
#undef SYNDI
#undef HEART
#undef SMILEY

/obj/item/storage/box/ingredients //This box is for the randomely chosen version the chef spawns with, it shouldn't actually exist.
	name = "ingredients box"
	illustration = "fruit"
	var/theme_name

/obj/item/storage/box/ingredients/Initialize()
	. = ..()
	if(theme_name)
		name = "[name] ([theme_name])"
		desc = ""
		item_state = "syringe_kit"

/obj/item/storage/box/ingredients/wildcard
	theme_name = "wildcard"

/obj/item/storage/box/ingredients/wildcard/PopulateContents()
	for(var/i in 1 to 7)
		var/randomFood = pick(
							/obj/item/reagent_containers/food/snacks/chocolatebar,
							/obj/item/reagent_containers/food/drinks/bottle/wine)
		new randomFood(src)

/obj/item/storage/box/ingredients/fiesta
	theme_name = "fiesta"

/obj/item/storage/box/ingredients/fiesta/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/tortilla(src)
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/food/snacks/chocolatebar(src)


/obj/item/storage/box/ingredients/italian
	theme_name = "italian"

/obj/item/storage/box/ingredients/italian/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/snacks/chocolatebar(src)
		new /obj/item/reagent_containers/food/snacks/faggot(src)
	new /obj/item/reagent_containers/food/drinks/bottle/wine(src)

/obj/item/storage/box/ingredients/vegetarian
	theme_name = "vegetarian"

/obj/item/storage/box/ingredients/vegetarian/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/food/snacks/chocolatebar(src)


/obj/item/storage/box/ingredients/american
	theme_name = "american"

/obj/item/storage/box/ingredients/american/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/faggot(src)

/obj/item/storage/box/ingredients/fruity
	theme_name = "fruity"

/obj/item/storage/box/ingredients/fruity/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/food/snacks/chocolatebar(src)



/obj/item/storage/box/ingredients/sweets
	theme_name = "sweets"

/obj/item/storage/box/ingredients/sweets/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/chocolatebar(src)

/obj/item/storage/box/ingredients/delights
	theme_name = "delights"

/obj/item/storage/box/ingredients/delights/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/chocolatebar(src)

/obj/item/storage/box/ingredients/carnivore
	theme_name = "carnivore"

/obj/item/storage/box/ingredients/carnivore/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/faggot(src)

/obj/item/storage/box/ingredients/exotic
	theme_name = "exotic"

/obj/item/storage/box/ingredients/exotic/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/chocolatebar(src)

/obj/item/storage/box/silver_sulf
	name = "box of silver sulfadiazine patches"
	desc = ""

/obj/item/storage/box/silver_sulf/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/patch/aiuri(src)

/obj/item/storage/box/fountainpens
	name = "box of fountain pens"

/obj/item/storage/box/fountainpens/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/pen/fountain(src)

/obj/item/storage/box/material
	name = "box of materials"
	illustration = "implant"

/obj/item/storage/box/material/PopulateContents() 	//less uranium because radioactive
	var/static/items_inside = list(
		/obj/item/stack/sheet/metal/fifty=1,\
		/obj/item/stack/sheet/glass/fifty=1,\
		/obj/item/stack/sheet/rglass=50,\
		/obj/item/stack/sheet/plasmaglass=50,\
		/obj/item/stack/sheet/titaniumglass=50,\
		/obj/item/stack/sheet/plastitaniumglass=50,\
		/obj/item/stack/sheet/plasteel=50,\
		/obj/item/stack/sheet/mineral/plastitanium=50,\
		/obj/item/stack/sheet/mineral/titanium=50,\
		/obj/item/stack/sheet/mineral/gold=50,\
		/obj/item/stack/sheet/mineral/silver=50,\
		/obj/item/stack/sheet/mineral/plasma=50,\
		/obj/item/stack/sheet/mineral/uranium=20,\
		/obj/item/stack/sheet/mineral/diamond=50,\
		/obj/item/stack/sheet/bluespace_crystal=50,\
		/obj/item/stack/sheet/mineral/bananium=50,\
		/obj/item/stack/sheet/mineral/wood=50,\
		/obj/item/stack/sheet/plastic/fifty=1,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/debugtools
	name = "box of debug tools"
	icon_state = "syndiebox"

/obj/item/storage/box/debugtools/PopulateContents()
	var/static/items_inside = list(
		/obj/item/flashlight/emp/debug=1,\
		/obj/item/geiger_counter=1,\
		/obj/item/card/emag=1,\
		/obj/item/card/id/departmental_budget/car=1,\
		/obj/item/stack/spacecash/c1000=50,\
		/obj/item/storage/box/beakers/bluespace=1,\
		/obj/item/storage/box/beakers/variety=1,\
		/obj/item/storage/box/material=1
		)
	generate_items_inside(items_inside,src)
