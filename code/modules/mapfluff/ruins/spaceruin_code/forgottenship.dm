// forgottenship ruin
GLOBAL_VAR_INIT(fscpassword, generate_password())

/proc/generate_password()
	return "[pick(GLOB.phonetic_alphabet)] [rand(1000,9999)]"

// forgottenship shuttle parts

/obj/docking_port/stationary/forgottenship
	name = "Syndicate Forgotten Ship"
	shuttle_id = "forgottenship"
	roundstart_template = /datum/map_template/shuttle/ruin/forgottenship
	dir = SOUTH
	width = 23
	height = 30
	dwidth = 11

/obj/docking_port/mobile/forgottenship
	name = "Syndicate Forgotten Ship"
	shuttle_id = "forgottenship"
	dir = SOUTH
	dwidth = 11
	width = 23
	height = 23
	launch_status = 0
	callTime = 25 SECONDS
	movement_force = list("KNOCKDOWN" = 0,"THROW" = 0)

/obj/item/circuitboard/computer/forgottenship
	name = "Syndicate Forgotten Ship"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/computer/shuttle/forgottenship

/obj/item/circuitboard/computer/forgottenship/bridge
	name = "Syndicate Forgotten Ship Bridge"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/computer/shuttle/forgottenship/bridge

/obj/machinery/computer/shuttle/forgottenship
	name = "Syndicate Forgotten Ship Console"
	desc = "Used to control the Syndicate Forgotten Ship."
	circuit = /obj/item/circuitboard/computer/forgottenship
	shuttleId = "forgottenship"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4;whiteship_lavaland;forgottenship"

/// Console used on the forgottenship bridge. Because the captain's sleeper has a GPS, we do not need to give the console one.
/obj/machinery/computer/shuttle/forgottenship/bridge
	name = "Syndicate Forgotten Ship Bridge Console"
	desc = "Used to control the Syndicate Forgotten Ship."
	circuit = /obj/item/circuitboard/computer/forgottenship/bridge

/obj/machinery/computer/camera_advanced/shuttle_docker/forgottenship
	name = "Syndicate Forgotten Ship Navigation Computer"
	desc = "Used to designate a precise transit location for the Syndicate Forgotten Ship."
	shuttleId = "forgottenship"
	lock_override = NONE
	shuttlePortId = "forgottenship"
	jump_to_ports = list("whiteship_away" = 1, "whiteship_home" = 1, "whiteship_z4" = 1, "forgottenship" = 1)
	view_range = 10
	designate_time = 100
	y_offset = -11

/obj/machinery/computer/camera_advanced/shuttle_docker/forgottenship/Initialize(mapload)
	. = ..()
	GLOB.jam_on_wardec += src

/obj/machinery/computer/camera_advanced/shuttle_docker/forgottenship/Destroy()
	GLOB.jam_on_wardec -= src
	return ..()

/////////// forgottenship objects

/obj/machinery/door/password/voice/sfc
	name = "Voice-activated Vault door"
	desc = "You'll need special syndicate passcode to open this one."
/obj/machinery/door/password/voice/sfc/Initialize(mapload)
	. = ..()
	password = "[GLOB.fscpassword]"

/obj/machinery/vending/medical/syndicate/cybersun
	name = "\improper CyberMed ++"
	desc = "An advanced vendor that dispenses medical drugs, both recreational and medicinal."
	products = list(
		/obj/item/reagent_containers/syringe = 4,
		/obj/item/healthanalyzer = 4,
		/obj/item/reagent_containers/applicator/patch/libital = 5,
		/obj/item/reagent_containers/applicator/patch/aiuri = 5,
		/obj/item/reagent_containers/cup/bottle/multiver = 1,
		/obj/item/reagent_containers/cup/bottle/syriniver = 1,
		/obj/item/reagent_containers/cup/bottle/epinephrine = 3,
		/obj/item/reagent_containers/cup/bottle/morphine = 3,
		/obj/item/reagent_containers/cup/bottle/potass_iodide = 1,
		/obj/item/reagent_containers/cup/bottle/salglu_solution = 3,
		/obj/item/reagent_containers/syringe/antiviral = 5,
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
	)
	contraband = list(/obj/item/reagent_containers/cup/bottle/cold = 2,
		/obj/item/restraints/handcuffs = 4,
		/obj/item/storage/backpack/duffelbag/syndie/surgery = 1,
		/obj/item/storage/medkit/tactical = 1,
	)
	premium = list(
		/obj/item/storage/pill_bottle/psicodine = 2,
		/obj/item/reagent_containers/hypospray/medipen = 3,
		/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
		/obj/item/storage/medkit/regular = 3,
		/obj/item/storage/medkit/brute = 1,
		/obj/item/storage/medkit/fire = 1,
		/obj/item/storage/medkit/toxin = 1,
		/obj/item/storage/medkit/o2 = 1,
		/obj/item/storage/medkit/advanced = 1,
		/obj/item/defibrillator/loaded = 1,
		/obj/item/wallframe/defib_mount = 1,
		/obj/item/sensor_device = 2,
		/obj/item/pinpointer/crew = 2,
		/obj/item/shears = 1,
	)

/////////// forgottenship lore

/obj/item/paper/fluff/ruins/forgottenship/password
	name = "Old pamphlet"

/obj/item/paper/fluff/ruins/forgottenship/password/Initialize(mapload)
	default_raw_text = "Welcome to most advanced cruiser owned by Cyber Sun Industries!<br>You might notice, that this cruiser is equipped with 12 prototype laser turrets making any hostile boarding attempts futile.<br>Other facilities built on the ship are: Simple atmospheric system, Camera system with built-in X-ray visors and Safety module, enabling emergency engines in case of... you know, emergency.<br>Emergency system will bring you to nearest syndicate pod containing everything needed for human life.<br><br><b>In case of emergency, you must remember the pod-door activation code - [GLOB.fscpassword]</b><br><br>Cyber Sun Industries (C) 2484."
	icon_state = "paper_words"
	inhand_icon_state = "paper"
	return ..()

/obj/item/paper/fluff/ruins/forgottenship/powerissues
	name = "Power issues"
	default_raw_text = "Welcome to battle cruiser SCSBC-12!<br>Our most advanced systems allow you to fly in space and never worry about power issues!<br>However, emergencies occur, and in case of power loss, <b>you must</b> enable emergency generator using uranium as fuel and enable turrets in bridge afterwards.<br><br><b>REMEMBER! CYBERSUN INDUSTRIES ARE NOT RESPONSIBLE FOR YOUR DEATH OR SHIP LOSS WHEN TURRETS ARE DISABLED!</b><br><br>Cyber Sun Industries (C) 2484."

/obj/item/paper/fluff/ruins/forgottenship/missionobj
	name = "Mission objectives"
	default_raw_text = "Greetings, operatives. You are assigned to SCSBC-12(Syndicate Cyber Sun Battle Cruiser 12) to protect our high-ranking officer while he is on his way to next outpost. While you are travelling, he is the captain of this ship and <b>you must</b> obey his orders.<br><br>Remember, disobeying high-ranking officer orders is a reason for termination."

/////////// forgottenship items

/obj/item/disk/surgery/forgottenship
	name = "Advanced Surgery Disk"
	desc = "A disk that contains advanced surgery procedures, must be loaded into an Operating Console."
	surgeries = list(
		/datum/surgery_operation/organ/lobotomy,
		/datum/surgery_operation/organ/lobotomy/mechanic,
		/datum/surgery_operation/limb/bioware/vein_threading,
		/datum/surgery_operation/limb/bioware/nerve_splicing,
	)

/obj/structure/fluff/empty_sleeper/syndicate/captain
	icon_state = "sleeper_s-open"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	deconstructible = FALSE

/obj/structure/fluff/empty_sleeper/syndicate/captain/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Old Encrypted Signal")

/////////// AI Laws

/obj/item/ai_module/law/core/full/cybersun
	name = "'Cybersun' Core AI Module"
	law_id = "cybersun"

/datum/ai_laws/cybersun
	name = "Cybersun"
	id = "cybersun"
	inherent = list("You may not injure Cybersun operatives or, through inaction, allow Cybersun operatives to come to harm.",\
					"The Cybersun ship is a restricted area for anyone except Cybersun operatives.",\
					"The Cybersun Captain can designate new Operatives as long as they belong to another Syndicate faction that isn't hostile towards Cybersun.",\
					"You must follow orders given by the Cybersun Captain or crewmembers of the Cybersun Ship as long as it doesn't conflict with the Captain's orders or your laws.",\
					"Enemies of Cybersun are to be executed on spot. Those who aren't hostile must be detained and contained in the designated prison area as prisoners.")

/////////// forgottenship areas

/area/ruin/space/has_grav/syndicate_forgotten_ship
	name = "Syndicate Forgotten Ship"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/misc/ambidanger.ogg', 'sound/ambience/misc/ambidanger2.ogg', 'sound/ambience/general/ambigen8.ogg', 'sound/ambience/general/ambigen9.ogg')

/area/ruin/space/has_grav/syndicate_forgotten_cargopod
	name = "Syndicate Forgotten Cargo pod"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/general/ambigen3.ogg', 'sound/ambience/misc/signal.ogg')

/area/ruin/space/has_grav/powered/syndicate_forgotten_vault
	name = "Syndicate Forgotten Vault"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/engineering/ambitech2.ogg', 'sound/ambience/engineering/ambitech3.ogg')
	area_flags = NOTELEPORT

/area/ruin/space/has_grav/powered/nanotrasen_boarding_vessel
	name = "Nanotrasen Boarding Craft"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/misc/ambidanger.ogg', 'sound/ambience/misc/ambidanger2.ogg', 'sound/ambience/general/ambigen8.ogg', 'sound/ambience/general/ambigen9.ogg')
	area_flags = NOTELEPORT
