aSeaPorts= {}

--use this for understanding the regions. however do it as a region -> capital map and not the reverse. 
-- hmmm thats weird.
--this is for cost though, so return to it



--x = base price determined by army size and turn number like 1000 + 10 x unit size x turn number? so 5000 on turn 20 for a 20 stack. turn 60 this is 13000. turn 100 it is 17000
--moving a lord is then 1200 on turn 20. 10000 on turn 90

--price = 
--10% off if you control the major region of the departing port
--25% off if you control the major region of the arrival port
--50% off if the regions are in the same area.

--85% off for smae region with major port. becomes 750 for 20 stack on turn 20. 3550 on turn 100.

--HOWEVER, these discounts should not reduce the base 1000. 



--SOUTH GREAT OCEAN (and lustria) - CITADEL OF DUSK

aSeaPorts["wh3_main_combi_region_citadel_of_dusk"] =
{
	strName = "wh3_main_combi_region_citadel_of_dusk",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 302,
	y = 1013
}

aSeaPorts["wh3_main_combi_region_the_awakening"] =
{
	strName = "wh3_main_combi_region_the_awakening",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 277,
	y = 819
}

aSeaPorts["wh3_main_combi_region_the_star_tower"] =
{
	strName = "wh3_main_combi_region_the_star_tower",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 277,
	y = 877
}

aSeaPorts["wh3_main_combi_region_altar_of_the_horned_rat"] =
{
	strName = "wh3_main_combi_region_altar_of_the_horned_rat",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 246,
	y = 881
}

aSeaPorts["wh3_main_combi_region_kaiax"] =
{
	strName = "wh3_main_combi_region_kaiax",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 194,
	y = 984
}

aSeaPorts["wh3_main_combi_region_great_turtle_isle"] =
{
	strName = "wh3_main_combi_region_great_turtle_isle",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 33,
	y = 830
}

aSeaPorts["wh3_main_combi_region_grotrilexs_glare_lighthouse"] =
{
	strName = "wh3_main_combi_region_grotrilexs_glare_lighthouse",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 413,
	y = 1062
}

aSeaPorts["wh3_main_combi_region_the_blood_hall"] =
{
	strName = "wh3_main_combi_region_the_blood_hall",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 29,
	y = 737
}

aSeaPorts["wh3_main_combi_region_shrine_of_sotek"] =
{
	strName = "wh3_main_combi_region_shrine_of_sotek",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 49,
	y = 630
}

aSeaPorts["wh3_main_combi_region_temple_of_tlencan"] = --bregonne
{
	strName = "wh3_main_combi_region_temple_of_tlencan",
	strParent = "wh3_main_combi_region_citadel_of_dusk",
	strParent2 = "wh3_main_combi_region_citadel_of_dusk",
	x = 217,
	y = 737
}



--CENTRAL GREAT OCEAN - Lothern OR Galleans Graveyard

aSeaPorts["wh3_main_combi_region_the_galleons_graveyard"] =
{
	strName = "wh3_main_combi_region_the_galleons_graveyard",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 256,
	y = 598
}

aSeaPorts["wh3_main_combi_region_lothern"] =
{
	strName = "wh3_main_combi_region_lothern",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 254,
	y = 528
}

aSeaPorts["wh3_main_combi_region_skeggi"] =
{
	strName = "wh3_main_combi_region_skeggi",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 129,
	y = 530
}

aSeaPorts["wh3_main_combi_region_grey_rock_point"] =
{
	strName = "wh3_main_combi_region_grey_rock_point",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 105,
	y = 490
}

aSeaPorts["wh3_main_combi_region_arnheim"] =
{
	strName = "wh3_main_combi_region_arnheim",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 144,
	y = 444
}

aSeaPorts["wh3_main_combi_region_tor_anroc"] =
{
	strName = "wh3_main_combi_region_tor_anroc",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 179,
	y = 436
}

aSeaPorts["wh3_main_combi_region_monument_of_the_moon"] =
{
	strName = "wh3_main_combi_region_monument_of_the_moon",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 143,
	y = 597
}

aSeaPorts["wh3_main_combi_region_elessaeli"] =
{
	strName = "wh3_main_combi_region_elessaeli",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 318,
	y = 507
}

aSeaPorts["wh3_main_combi_region_evershale"] =
{
	strName = "wh3_main_combi_region_evershale",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 245,
	y = 436
}

aSeaPorts["wh3_main_combi_region_whitefire_tor"] =
{
	strName = "wh3_main_combi_region_whitefire_tor",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 221,
	y = 450
}

aSeaPorts["wh3_main_combi_region_bilbali"] =
{
	strName = "wh3_main_combi_region_bilbali",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 398,
	y = 566
}

aSeaPorts["wh3_main_combi_region_bordeleaux"] =
{
	strName = "wh3_main_combi_region_bordeleaux",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 395,
	y = 452
}

aSeaPorts["wh3_main_combi_region_lyonesse"] =
{
	strName = "wh3_main_combi_region_lyonesse",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 360,
	y = 393
}

aSeaPorts["wh3_main_combi_region_temple_of_kara"] =
{
	strName = "wh3_main_combi_region_temple_of_kara",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
	x = 151,
	y = 967
}



--PIRATE COAST - sartosa

aSeaPorts["wh3_main_combi_region_sartosa"] =
{
	strName = "wh3_main_combi_region_sartosa",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 496,
	y = 672
}

aSeaPorts["wh3_main_combi_region_magritta"] =
{
	strName = "wh3_main_combi_region_magritta",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 415,
	y = 627
}

aSeaPorts["wh3_main_combi_region_miragliano"] =
{
	strName = "wh3_main_combi_region_miragliano",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 497,
	y = 594
}

aSeaPorts["wh3_main_combi_region_myrmidens"] =
{
	strName = "wh3_main_combi_region_myrmidens",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 571,
	y = 620
}

aSeaPorts["wh3_main_combi_region_matorca"] =
{
	strName = "wh3_main_combi_region_matorca",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 634,
	y = 538
}

aSeaPorts["wh3_main_combi_region_stonemine_tower"] =
{
	strName = "wh3_main_combi_region_stonemine_tower",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 628,
	y = 567
}

aSeaPorts["wh3_main_combi_region_gronti_mingol"] =
{
	strName = "wh3_main_combi_region_gronti_mingol",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 585,
	y = 644
}

aSeaPorts["wh3_main_combi_region_al_haikk"] =
{
	strName = "wh3_main_combi_region_al_haikk",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 512,
	y = 736
}

aSeaPorts["wh3_main_combi_region_sorcerers_islands"] =
{
	strName = "wh3_main_combi_region_sorcerers_islands",
	strParent = "wh3_main_combi_region_sartosa",
	strParent2 = "wh3_main_combi_region_sartosa",
	x = 420,
	y = 762
}



--SOUTHERN STRAITS - fortress of dawn OR sudenburg

aSeaPorts["wh3_main_combi_region_fortress_of_dawn"] =
{
	strName = "wh3_main_combi_region_fortress_of_dawn",
	strParent = "wh3_main_combi_region_fortress_of_dawn",
	strParent2 = "wh3_main_combi_region_sudenburg",
	x = 546,
	y = 1041
}

aSeaPorts["wh3_main_combi_region_sudenburg"] =
{
	strName = "wh3_main_combi_region_sorcerers_islands",
	strParent = "wh3_main_combi_region_fortress_of_dawn",
	strParent2 = "wh3_main_combi_region_sudenburg",
	x = 551,
	y = 829
}

aSeaPorts["wh3_main_combi_region_zlatlan"] =
{
	strName = "wh3_main_combi_region_zlatlan",
	strParent = "wh3_main_combi_region_fortress_of_dawn",
	strParent2 = "wh3_main_combi_region_sudenburg",
	x = 613,
	y = 979
}

aSeaPorts["wh3_main_combi_region_volulltrax"] =
{
	strName = "wh3_main_combi_region_volulltrax",
	strParent = "wh3_main_combi_region_fortress_of_dawn",
	strParent2 = "wh3_main_combi_region_sudenburg",
	x = 631,
	y = 1092
}

aSeaPorts["wh3_main_combi_region_deaths_head_monoliths"] =
{
	strName = "wh3_main_combi_region_deaths_head_monoliths",
	strParent = "wh3_main_combi_region_fortress_of_dawn",
	strParent2 = "wh3_main_combi_region_sudenburg",
	x = 499,
	y = 889
}



--THE SEA OF DREAD - tower of the sun

aSeaPorts["wh3_main_combi_region_tower_of_the_sun"] =
{
	strName = "wh3_main_combi_region_tower_of_the_sun",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 978,
	y = 972
}

aSeaPorts["wh3_main_combi_region_castle_of_splendour"] =
{
	strName = "wh3_main_combi_region_castle_of_splendour",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 757,
	y = 1066
}

aSeaPorts["wh3_main_combi_region_temple_avenue_of_gold"] =
{
	strName = "wh3_main_combi_region_temple_avenue_of_gold",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 723,
	y = 985
}

aSeaPorts["wh3_main_combi_region_serpent_coast"] =
{
	strName = "wh3_main_combi_region_serpent_coast",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 792,
	y = 867
}

aSeaPorts["wh3_main_combi_region_lybaras"] =
{
	strName = "wh3_main_combi_region_lybaras",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 826,
	y = 751
}

aSeaPorts["wh3_main_combi_region_bitter_bay"] =
{
	strName = "wh3_main_combi_region_bitter_bay",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 885,
	y = 654
}

aSeaPorts["wh3_main_combi_region_ruins_end"] =
{
	strName = "wh3_main_combi_region_ruins_end",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 948,
	y = 627
}

aSeaPorts["wh3_main_combi_region_dread_rock"] =
{
	strName = "wh3_main_combi_region_dread_rock",
	strParent = "wh3_main_combi_region_tower_of_the_sun",
	strParent2 = "wh3_main_combi_region_tower_of_the_sun",
	x = 975,
	y = 663
}



--JADE SEA - Haichai

aSeaPorts["wh3_main_combi_region_haichai"] =
{
	strName = "wh3_main_combi_region_haichai",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1351,
	y = 400
}

aSeaPorts["wh3_main_combi_region_beichai"] =
{
	strName = "wh3_main_combi_region_beichai",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1359,
	y = 478
}

aSeaPorts["wh3_main_combi_region_li_zhu"] =
{
	strName = "wh3_main_combi_region_li_zhu",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1371,
	y = 583
}

aSeaPorts["wh3_main_combi_region_dai_cheng"] =
{
	strName = "wh3_main_combi_region_dai_cheng",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1370,
	y = 681
}

aSeaPorts["wh3_main_combi_region_fu_hung"] =
{
	strName = "wh3_main_combi_region_fu_hung",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1233,
	y = 687
}

aSeaPorts["wh3_main_combi_region_bamboo_crossing"] =
{
	strName = "wh3_main_combi_region_bamboo_crossing",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1262,
	y = 625
}

aSeaPorts["wh3_main_combi_region_shi_long"] =
{
	strName = "wh3_main_combi_region_shi_long",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1242,
	y = 589
}

aSeaPorts["wh3_main_combi_region_zhanshi"] =
{
	strName = "wh3_main_combi_region_zhanshi",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1274,
	y = 521
}

aSeaPorts["wh3_main_combi_region_hanyu_port"] =
{
	strName = "wh3_main_combi_region_hanyu_port",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1129,
	y = 548
}

aSeaPorts["wh3_main_combi_region_xing_po"] =
{
	strName = "wh3_main_combi_region_xing_po",
	strParent = "wh3_main_combi_region_haichai",
	strParent2 = "wh3_main_combi_region_haichai",
	x = 1171,
	y = 443
}



--NORTH GREAT OCEAN - karond kar

aSeaPorts["wh3_main_combi_region_karond_kar"] =
{
	strName = "wh3_main_combi_region_karond_kar",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 276,
	y = 200
}

aSeaPorts["wh3_main_combi_region_the_twisted_glade"] =
{
	strName = "wh3_main_combi_region_the_twisted_glade",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 210,
	y = 321
}

aSeaPorts["wh3_main_combi_region_tor_anlec"] =
{
	strName = "wh3_main_combi_region_tor_anlec",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 236,
	y = 373
}

aSeaPorts["wh3_main_combi_region_tor_koruali"] =
{
	strName = "wh3_main_combi_region_tor_koruali",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 329,
	y = 422
}

aSeaPorts["wh3_main_combi_region_elisia"] =
{
	strName = "wh3_main_combi_region_elisia",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 300,
	y = 384
}

aSeaPorts["wh3_main_combi_region_isle_of_wights"] =
{
	strName = "wh3_main_combi_region_isle_of_wights",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 354,
	y = 287
}

aSeaPorts["wh3_main_combi_region_troll_fjord"] =
{
	strName = "wh3_main_combi_region_troll_fjord",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 388,
	y = 204
}

aSeaPorts["wh3_main_combi_region_fortress_of_the_damned"] =
{
	strName = "wh3_main_combi_region_fortress_of_the_damned",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 376,
	y = 114
}

aSeaPorts["wh3_main_combi_region_nagrar"] =
{
	strName = "wh3_main_combi_region_nagrar",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 271,
	y = 155
}

aSeaPorts["wh3_main_combi_region_blacklight_tower"] =
{
	strName = "wh3_main_combi_region_blacklight_tower",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 212,
	y = 207
}

aSeaPorts["wh3_main_combi_region_circle_of_destruction"] =
{
	strName = "wh3_main_combi_region_circle_of_destruction",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 161,
	y = 246
}

aSeaPorts["wh3_main_combi_region_hag_graef"] =
{
	strName = "wh3_main_combi_region_hag_graef",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 140,
	y = 214
}

aSeaPorts["wh3_main_combi_region_naggarond"] =
{
	strName = "wh3_main_combi_region_naggarond",
	strParent = "wh3_main_combi_region_karond_kar",
	strParent2 = "wh3_main_combi_region_karond_kar",
	x = 115,
	y = 182
}



--SOUTH SEA OF CHAOS - marienburg or erengrad

aSeaPorts["wh3_main_combi_region_marienburg"] =
{
	strName = "wh3_main_combi_region_marienburg",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 455,
	y = 364
}

aSeaPorts["wh3_main_combi_region_erengrad"] =
{
	strName = "wh3_main_combi_region_erengrad",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 631,
	y = 225
}

aSeaPorts["wh3_main_combi_region_altdorf"] =
{
	strName = "wh3_main_combi_region_altdorf",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 538,
	y = 375
}

aSeaPorts["wh3_main_combi_region_languille"] =
{
	strName = "wh3_main_combi_region_languille",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 386,
	y = 357
}

aSeaPorts["wh3_main_combi_region_wreckers_point"] =
{
	strName = "wh3_main_combi_region_wreckers_point",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 479,
	y = 258
}

aSeaPorts["wh3_main_combi_region_altar_of_the_crimson_harvest"] =
{
	strName = "wh3_main_combi_region_altar_of_the_crimson_harvest",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 504,
	y = 215
}

aSeaPorts["wh3_main_combi_region_castle_alexandronov"] =
{
	strName = "wh3_main_combi_region_castle_alexandronov",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 610,
	y = 202
}

aSeaPorts["wh3_main_combi_region_norden"] =
{
	strName = "wh3_main_combi_region_norden",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 594,
	y = 234
}

aSeaPorts["wh3_main_combi_region_bay_of_blades"] =
{
	strName = "wh3_main_combi_region_bay_of_blades",
	strParent = "wh3_main_combi_region_marienburg",
	strParent2 = "wh3_main_combi_region_erengrad",
	x = 583,
	y = 182
}



--NORTH SEA OF CHAOS - monolith of flesh

aSeaPorts["wh3_main_combi_region_monolith_of_flesh"] =
{
	strName = "wh3_main_combi_region_monolith_of_flesh",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 599,
	y = 90
}

aSeaPorts["wh3_main_combi_region_winter_pyre"] =
{
	strName = "wh3_main_combi_region_winter_pyre",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 681,
	y = 121
}

aSeaPorts["wh3_main_combi_region_the_monolith_of_katam"] =
{
	strName = "wh3_main_combi_region_the_monolith_of_katam",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 456,
	y = 125
}

aSeaPorts["wh3_main_combi_region_the_folly_of_malofex"] =
{
	strName = "wh3_main_combi_region_the_folly_of_malofex",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 469,
	y = 76
}

aSeaPorts["wh3_main_combi_region_bilious_cliffs"] =
{
	strName = "wh3_main_combi_region_bilious_cliffs",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 610,
	y = 56
}

aSeaPorts["wh3_main_combi_region_port_of_secrets"] =
{
	strName = "wh3_main_combi_region_port_of_secrets",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 720,
	y = 83
}

aSeaPorts["wh3_main_combi_region_sjoktraken"] =
{
	strName = "wh3_main_combi_region_sjoktraken",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 726,
	y = 166
}

aSeaPorts["wh3_main_combi_region_temple_of_heimkel"] =
{
	strName = "wh3_main_combi_region_temple_of_heimkel",
	strParent = "wh3_main_combi_region_monolith_of_flesh",
	strParent2 = "wh3_main_combi_region_monolith_of_flesh",
	x = 787,
	y = 210
}



--chorf riverway, special

aSeaPorts["wh3_main_combi_region_the_daemons_stump"] =
{
	strName = "wh3_main_combi_region_the_daemons_stump",
	strParent = "",
	strParent2 = "",
	x = 972,
	y = 491
}











--oceans owned by places

aSeaRegions= {}

aSeaRegions["wh3_main_combi_region_the_jade_sea"] =
{
	strName = "wh3_main_combi_region_the_jade_sea",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
}

aSeaRegions["wh3_main_combi_region_northern_straits_of_the_jade_sea"] =
{
	strName = "wh3_main_combi_region_northern_straits_of_the_jade_sea",
	strParent = "wh3_main_combi_region_the_galleons_graveyard",
	strParent2 = "wh3_main_combi_region_lothern",
}




