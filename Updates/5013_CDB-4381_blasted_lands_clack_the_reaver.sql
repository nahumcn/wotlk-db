
DELETE FROM `creature` WHERE `id` = 8301;
DELETE FROM `pool_template` WHERE (`entry` = 1035);
DELETE FROM `pool_creature_template` WHERE (`id` = 8301); -- 8301	1034	0	Clack the Reaver (8301)

SET @CGUID := 140400; -- free
SET @SGUID := 264; -- exists

UPDATE `creature_template` SET `SpeedWalk` = 1 WHERE (`Entry` = 8301); -- already fixed

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`) VALUES
(@CGUID + 00, 0, 0, 1, -11521.7470703125, -2770.985595703125, 3.213406324386596679, 0.399071425199508666, 37800, 57600, 00, 4);

UPDATE `spawn_group` SET `Name` = 'Blasted Lands - Clack the Reaver (1) Rare 000' WHERE (`Id` = @SGUID + 000);

INSERT INTO `spawn_group_spawn` (`Id`, `Guid`, `SlotId`, `Chance`) VALUES
(@SGUID + 00, @CGUID + 00, 0, 0);

INSERT INTO `spawn_group_entry` (`Id`, `Entry`, `MinCount`, `MaxCount`, `Chance`) VALUES
(@SGUID + 00, 8301, 0, 0, 0);

INSERT INTO `creature_movement` (`Id`, `Point`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `WaitTime`, `ScriptId`) VALUES
(@CGUID + 00, 01, -11519.8388671875, -2770.180908203125, 3.301811695098876953, 100, 0, 0),
(@CGUID + 00, 02, -11490.2314453125, -2786.429443359375, -0.98971033096313476, 100, 0, 0),
(@CGUID + 00, 03, -11460.0869140625, -2810.835205078125, -1.61365473270416259, 100, 0, 0),
(@CGUID + 00, 04, -11450.9160156250, -2846.786132812500, 0.141698062419891357, 100, 0, 0),
(@CGUID + 00, 05, -11426.4121093750, -2879.699218750000, 3.348172903060913085, 100, 0, 0),
(@CGUID + 00, 06, -11418.5439453125, -2926.678466796875, 3.117449283599853515, 100, 0, 0),
(@CGUID + 00, 07, -11421.3212890625, -2952.488037109375, 2.229515075683593750, 100, 0, 0),
(@CGUID + 00, 08, -11420.2851562500, -2993.229736328125, 1.101577281951904296, 100, 0, 0),
(@CGUID + 00, 09, -11422.8134765625, -3016.357177734375, 0.574937224388122558, 100, 0, 0),
(@CGUID + 00, 10, -11387.4394531250, -3042.765136718750, -4.21362113952636718, 100, 0, 0),
(@CGUID + 00, 11, -11380.2050781250, -3084.913330078125, 0.291237831115722656, 100, 0, 0),
(@CGUID + 00, 12, -11352.2998046875, -3118.329101562500, -1.53136742115020751, 100, 0, 0),
(@CGUID + 00, 13, -11356.8105468750, -3153.056640625000, 7.429010391235351562, 100, 0, 0),
(@CGUID + 00, 14, -11355.8076171875, -3185.689697265625, 10.81366443634033203, 100, 0, 0),
(@CGUID + 00, 15, -11352.8095703125, -3214.422851562500, 10.19730472564697265, 100, 0, 0),
(@CGUID + 00, 16, -11356.9111328125, -3248.562500000000, 8.821020126342773437, 100, 0, 0),
(@CGUID + 00, 17, -11371.9863281250, -3273.147949218750, 4.935072422027587890, 100, 0, 0),
(@CGUID + 00, 18, -11357.3164062500, -3309.518310546875, 8.610475540161132812, 100, 0, 0);

