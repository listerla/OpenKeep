/obj/effect/landmark/mapGenerator/rogue/roguetownfield
	mapGeneratorType = /datum/mapGenerator/roguetownfield
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/roguetownfield
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/roguetownfield/grass,/datum/mapGeneratorModule/roguetowngrass,/datum/mapGeneratorModule/roguetownfield,/datum/mapGeneratorModule/roguetownfield/road,/datum/mapGeneratorModule/roguetownswampwaterturf,/datum/mapGeneratorModule/roguetownwaterturf)


/datum/mapGeneratorModule/roguetownfield
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 5,
							/obj/structure/flora/roguegrass/bush_meagre = 13,
							/obj/structure/flora/roguegrass = 50,
							/obj/structure/flora/roguegrass/maneater = 1,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 8,
							/obj/item/natural/rock = 7,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/closet/dirthole/closed/loot=12,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage=0.5)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=5)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownfield/road
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 8,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownfield/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 15)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetowngrass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 20,
						/obj/structure/flora/roguegrass/maneater = 1,
							/obj/item/natural/stone = 7,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/town,/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownwaterturf
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/water/cleanshallow)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 20,
	                        /obj/structure/flora/roguegrass/water/reeds = 12,
	                        /obj/structure/kneestingers = 6)

/datum/mapGeneratorModule/roguetownswampwaterturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water/swamp)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 20,
		                    /obj/structure/flora/roguegrass/water/reeds = 12,
	                        /obj/structure/kneestingers = 3)


// ----------------		ROUGE HAMLET 2.0	--------------------
/obj/effect/landmark/mapGenerator/rogue/roguetown_hamlet
	mapGeneratorType = /datum/mapGenerator/roguetown_hamlet
	endTurfX = 128
	endTurfY = 192
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/roguetown_hamlet
	modules = list(
		/datum/mapGeneratorModule/roguehamlet,
		/datum/mapGeneratorModule/roguehamlet/roadturf,
		/datum/mapGeneratorModule/roguehamlet/bonus_grassturfs,
		/datum/mapGeneratorModule/roguehamlet_grassturf,
		/datum/mapGeneratorModule/roguehamlet_swampturf,
		/datum/mapGeneratorModule/roguehamlet_waterturf,
		/datum/mapGeneratorModule/roguehamlet_buriedtreasure,
		/datum/mapGeneratorModule/ambushing/hamlet)

/datum/mapGeneratorModule/roguehamlet
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(
							/obj/structure/flora/roguegrass/bush_meagre = 10,
							/obj/structure/flora/roguegrass = 20,
							/obj/item/natural/stone = 5,
							/obj/item/natural/rock = 3,
							/obj/item/grown/log/tree/stick = 2)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=5)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguehamlet/roadturf
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 3,
							/obj/item/grown/log/tree/stick = 2)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguehamlet/bonus_grassturfs
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 5)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguehamlet_buriedtreasure
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(
							/obj/structure/closet/dirthole/closed/loot=2)		// add more stuff I guess
	allowed_areas = list(/area/rogue/outdoors/rtfield/spooky, /area/rogue/outdoors/rtfield/outlaw)

/datum/mapGeneratorModule/roguehamlet_grassturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 20,
							/obj/item/natural/stone = 5,
							/obj/item/grown/log/tree/stick = 2)
	allowed_areas = list(/area/rogue/outdoors/town,/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguehamlet_swampturf
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/water/swamp)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 12,
	                        /obj/structure/flora/roguegrass/water/reeds = 8,
							/obj/structure/flora/roguegrass/stalky = 4,
	                        /obj/structure/kneestingers = 4,
							/obj/structure/flora/roguegrass/maneater/real = 1)

/datum/mapGeneratorModule/roguehamlet_waterturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water/cleanshallow)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 8,
	                        /obj/structure/flora/roguegrass/water/reeds = 4)

/datum/mapGeneratorModule/ambushing/hamlet
	spawnableAtoms = list(/obj/effect/landmark/ambush=50)
	spawnableTurfs = list()
	clusterMax = 3
	clusterMin = 1
	checkdensity = FALSE
	allowed_areas = list(/area/rogue/outdoors)
	allowed_turfs = list(/turf/open/floor/rogue/dirt/ambush)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)

//bandaid sunlight
/obj/effect/landmark/mapGenerator/sunlights/bandaid
	mapGeneratorType = /datum/mapGenerator/sunlights/bandaid
	endTurfX = 128
	endTurfY = 192
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/sunlights/bandaid
	modules = list(/datum/mapGeneratorModule/sunlights/bandaid)

/datum/mapGeneratorModule/sunlights/bandaid
	spawnableAtoms = list(/obj/effect/sunlight = 100)
	spawnableTurfs = list()
	clusterMax = 7
	clusterMin = 7
	checkdensity = FALSE
	allowed_areas = list(/area/rogue/outdoors)
