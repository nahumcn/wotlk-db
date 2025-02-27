-- Stormwind Emissary - Updated
-- Stormwind Emissary Patrol
DELETE FROM creature_addon WHERE guid IN (115098,115952,112727,112725,112038,112042,111037,111036,114239,114164,114139,114141);
DELETE FROM creature_movement WHERE id IN (115098,115952,112727,112725,112038,112042,111037,111036,114239,114164,114139,114141);
DELETE FROM game_event_creature WHERE guid IN (115098,115952,112727,112725,112038,112042,111037,111036,114239,114164,114139,114141);
DELETE FROM game_event_creature_data WHERE guid IN (115098,115952,112727,112725,112038,112042,111037,111036,114239,114164,114139,114141);
DELETE FROM creature_battleground WHERE guid IN (115098,115952,112727,112725,112038,112042,111037,111036,114239,114164,114139,114141);
DELETE FROM creature_linking WHERE guid IN (115098,115952,112727,112725,112038,112042,111037,111036,114239,114164,114139,114141);
DELETE FROM creature where guid IN (115098,115952,112727,112725,112038,112042,111037,111036,114239,114164,114139,114141);

-- Make them sync with TDB
UPDATE creature SET guid = 190592, id = 15103 WHERE guid = 11559;
UPDATE creature SET guid = 190593, id = 15103 WHERE guid = 11560;
DELETE FROM game_event_creature WHERE guid IN (11559,11560); -- does not work with spawn_group
DELETE FROM game_event_creature_data WHERE guid IN (190592,190593);
INSERT INTO game_event_creature_data (guid, event, `entry_id`) VALUES
-- https://www.wowhead.com/tbc/npc=15103/stormpike-emissary
(190592,18, 15103),
(190593,18, 15103),
-- https://www.wowhead.com/tbc/npc=15102/silverwing-emissary
(190592,19, 15102),
(190593,19, 15102),
-- https://www.wowhead.com/tbc/npc=14991/league-of-arathor-emissary
(190592,20, 14991),
(190593,20, 14991),
-- https://www.wowhead.com/tbc/npc=22013/eye-of-the-storm-emissary
(190592,21, 22013),
(190593,21, 22013),
-- https://www.wowhead.com/wotlk/npc=30566/strand-of-the-ancients-emissary
(190592,25, 30566),
(190593,25, 30566),
-- https://www.wowhead.com/wotlk/npc=34950/isle-of-conquest-emissary
(190592,38, 34950),
(190593,38, 34950);

-- Spawn Groups
DELETE FROM `spawn_group` WHERE id = 19980;
INSERT INTO `spawn_group` (`Id`, `Name`, `Type`, `MaxCount`, `WorldState`, `Flags`) VALUES
(19980, 'Stormwind - Battleground Emissary x2 - Patrol', 0, 0, 20549, 0x02 | 0x08);
DELETE FROM conditions WHERE condition_entry IN (6018,6019,6020,6021,6025,6038,19998,20548,20549);
INSERT INTO conditions (condition_entry, `type`, value1, value2, value3, value4, flags, comments) VALUES
(6018, 12, 18, 0, 0, 0, 0, 'Event ID 18 Active'),
(6019, 12, 19, 0, 0, 0, 0, 'Event ID 19 Active'),
(6020, 12, 20, 0, 0, 0, 0, 'Event ID 20 Active'),
(6021, 12, 21, 0, 0, 0, 0, 'Event ID 21 Active'),
(6025, 12, 25, 0, 0, 0, 0, 'Event ID 25 Active'),
(6038, 12, 38, 0, 0, 0, 0, 'Event ID 25 Active'),
(19998, -2, 6018, 6019, 6020, 6021, 0, 'any classic/tbc Battleground Emissary Event Active'),
(20548, -2, 6025, 6038, 0, 0, 0, 'any wotlk Battleground Emissary Event Active'),
(20549, -2, 19998, 20548, 0, 0, 0, 'any classic/tbc/wotlk Battleground Emissary Event Active');
DELETE FROM `spawn_group_spawn` WHERE id = 19980;
INSERT INTO `spawn_group_spawn` (`Id`, `Guid`, `SlotId`) VALUES
(19980, 190592, 0),
(19980, 190593, 1);
DELETE FROM `spawn_group_formation` WHERE id = 19980;
INSERT INTO `spawn_group_formation` (`Id`, `FormationType`, `FormationSpread`, `FormationOptions`, `PathId`, `MovementType`, `Comment`) VALUES
(19980, 1, 2, 0, 19980, 4, 'Stormwind - Battleground Emissary x2 - Patrol'); -- linear
DELETE FROM `waypoint_path_name` WHERE PathId = 19980;
INSERT INTO `waypoint_path_name` (`PathId`, `Name`) VALUES
(19980,'Stormwind - Battleground Emissary x2 - Patrol');
-- Using same mothod we can reduce spawn numbers for all static spawns
-- we can remove all same xyz spawns now
DELETE FROM creature_addon WHERE guid IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035);
DELETE FROM creature_movement WHERE Id IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035);
DELETE FROM game_event_creature WHERE guid IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035);
DELETE FROM game_event_creature_data WHERE guid IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035);
DELETE FROM creature_battleground WHERE guid IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035);
DELETE FROM creature_linking WHERE guid IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035)
 OR master_guid IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035);
DELETE FROM creature WHERE guid IN 
(54704,110507,110509,6627,7630,112030,112728,115088,115918,111039,111040,110466,110467,4090,6337,112720,112032,138729,138722,138735,138734,112719,54621,
112035,138723,138730,138736,138737,11561,11562,112723,112724,115087,115917,111032,111033,110518,110522,518,4089,112464,112481,115097,115933,111034,111035);
-- Make them sync with TDB
UPDATE creature SET guid = 190008, id = 15103 WHERE guid = 83181;
UPDATE creature SET guid = 190009, id = 15103 WHERE guid = 83184;
UPDATE creature SET guid = 190017, id = 15103 WHERE guid = 51627;
UPDATE creature SET guid = 190016, id = 15103 WHERE guid = 20556;
UPDATE creature SET guid = 190000, id = 15103 WHERE guid = 13427;
UPDATE creature SET guid = 190001, id = 15103 WHERE guid = 13428;
UPDATE creature SET guid = 190176, id = 15103 WHERE guid = 114092;
UPDATE creature SET guid = 190177, id = 15103 WHERE guid = 114093;
UPDATE creature SET guid = 190152, id = 15103 WHERE guid = 138775;
UPDATE creature SET guid = 190153, id = 15103 WHERE guid = 138774;
DELETE FROM game_event_creature WHERE guid IN (83181,83184,51627,20556,13427,13428,114092,114093,138775,138774);
DELETE FROM game_event_creature_data WHERE guid IN (190008,190009,190017,190016,190000,190001,190176,190177,190152,190153);
INSERT INTO game_event_creature_data (guid, event, `entry_id`) VALUES
-- https://www.wowhead.com/tbc/npc=15103/stormpike-emissary
(190008,18, 15103),
(190009,18, 15103),
(190017,18, 15103),
(190016,18, 15103),
(190000,18, 15103),
(190001,18, 15103),
(190176,18, 15103),
(190177,18, 15103),
(190152,18, 15103),
(190153,18, 15103),
-- https://www.wowhead.com/tbc/npc=15102/silverwing-emissary
(190008,19, 15102),
(190009,19, 15102),
(190017,19, 15102),
(190016,19, 15102),
(190000,19, 15102),
(190001,19, 15102),
(190176,19, 15102),
(190177,19, 15102),
(190152,19, 15102),
(190153,19, 15102),
-- https://www.wowhead.com/tbc/npc=14991/league-of-arathor-emissary
(190008,20, 14991),
(190009,20, 14991),
(190017,20, 14991),
(190016,20, 14991),
(190000,20, 14991),
(190001,20, 14991),
(190176,20, 14991),
(190177,20, 14991),
(190152,20, 14991),
(190153,20, 14991),
-- https://www.wowhead.com/tbc/npc=22013/eye-of-the-storm-emissary
(190008,21, 22013),
(190009,21, 22013),
(190017,21, 22013),
(190016,21, 22013),
(190000,21, 22013),
(190001,21, 22013),
(190176,21, 22013),
(190177,21, 22013),
(190152,21, 22013),
(190153,21, 22013),
-- Wotlk ONLY
-- https://www.wowhead.com/wotlk/npc=30566/strand-of-the-ancients-emissary
(190008,25, 30566),
(190009,25, 30566),
(190017,25, 30566),
(190016,25, 30566),
(190000,25, 30566),
(190001,25, 30566),
(190176,25, 30566),
(190177,25, 30566),
(190152,25, 30566),
(190153,25, 30566),
-- https://www.wowhead.com/wotlk/npc=34950/isle-of-conquest-emissary
(190008,38, 34950),
(190009,38, 34950),
(190017,38, 34950),
(190016,38, 34950),
(190000,38, 34950),
(190001,38, 34950),
(190176,38, 34950),
(190177,38, 34950),
(190152,38, 34950),
(190153,38, 34950);
-- Spawn Groups
DELETE FROM `spawn_group` WHERE id = 19946;
INSERT INTO `spawn_group` (`Id`, `Name`, `Type`, `MaxCount`, `WorldState`, `Flags`) VALUES
(19946, 'Stormwind - Battleground Emissary x2 - Static', 0, 0, 20549, 0x02 | 0x08); -- TBC will have WorldState = 19998
DELETE FROM `spawn_group_spawn` WHERE id = 19946;
INSERT INTO `spawn_group_spawn` (`Id`, `Guid`, `SlotId`) VALUES
(19946, 190008, -1),
(19946, 190009, -1),
(19946, 190017, -1),
(19946, 190016, -1),
(19946, 190000, -1),
(19946, 190001, -1),
(19946, 190176, -1),
(19946, 190177, -1),
(19946, 190152, -1),
(19946, 190153, -1);
