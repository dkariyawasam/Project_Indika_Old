## Advance Map - Map Scripts
Type 3 - Load on entering the map, move person events, change visibilty, cannot apply movement

Type 2 - Load on warping into map (door), uses vars, can apply movement, must be above Type 3 in Script Number order, if game freezes after a Type 2 event go into Header tab detialed mode(Ctrl+H) and open script in Map Script Offset. If a movement sequence ends in 0xffff, change it to 0x0.



## XSE
setflag 0x#### - sets anything with flag to 0x1, or hidden

clearflag 0x### - sets anything with flag to 0x0, or visibile

checkflag 0x#### - looks for flag

if 0x0 goto @dynamic - if clear or not set go to dynamic script

if 0x1 go to @dynamic - if set go to dynamic script

Used Vars:
- 4002 - 0x1 Moves parcel delivery girl to pallet town exit after player has chosen starter, sets itself to 0x0 after receiving parcel
- 4011 - Counts number of badges
- 4012 - Pewter Gym Aide greets you on first entry
- 4013 - Cerulean Gym Aide greets you on first entry
- 4014 - Vermilion Gym Aide greets you on first entry
- 4032 - Meeting Brock in Mt Moon
- 4033 - Meeting Misty in Power Plant
- 4034 - Meeting Lt Surge in Diglett's Cave  

Used Flags:
- 0x202 - Sets Mt Moon Brock's visibility
- 0x203 - Sets Gym Brock's visibility
- 0x204 - Sets Power Plant Misty's visibility
- 0x205 = Sets Gym Misty's visiblity
- 0x206 - Sets Diglett's Cave Surge's visibility
- 0x207 - Sets Gym Surge's visibility
- 0x291 - Set when player has chosen starter


----

\n - next line (one per paragraph)

\l - next line, continued

\p - next paragraph

special 0x17B - Plays the Seagull animation

## HEX editing

0x46AEFC to 0x46AF24 - 11 entries the Seagull warps to 
|Entry|Default|Edited|
|-----|-------|------|
|0|03 05 17 20|n/a|
|1|20 04 08 05|n/a|
|2|21 04 08 05|n/a|
|3|26 00 08 05|n/a|
|4|23 05 08 05|n/a|
|5|24 02 08 05|n/a|
|6|25 02 08 05|n/a|
|7|1F 06 08 05|n/a|
|8|03 08 15 07(Cinnabar Island)|03 28 0C 2D (Route 21)|
|9|02 3B 08 05|n/a|
|10|02 3A 08 05|n/a|

![image](https://github.com/user-attachments/assets/eb28918e-9f92-43b7-84c5-2b99ea0d87ac)

- Bytes 1-4: Pointer to map footer offset
- Bytes 5-8: Pointer to event offset
- Bytes 9-12: Pointer to map script offset
- Bytes 13-16: Pointer to connection offset
- Bytes 17-18: Music in reverse hex form.
- Byte 19: Map footer #. Used for setmapfooter command, which changes the map to another. You should probably leave it be unless you're adding a new map.
- Byte 20: ??
- Byte 21: Defines what map name the map belongs to. (Thanks to Jambo51 for clearing this up)
- Byte 22: Cave type
- Byte 23: Weather type
- Byte 24: Similar to byte 28. The trainer battle background may or may not change depending on the value chosen.
- Byte 25: Set to 01 to be able to ride a bicycle on the map.
- Byte 26: Changes the "Show name on entering" value that is visible in simple header mode. 06, 07 allow you to run on the map, 05, 08 do not.
- Byte 27: Species floor number. Above-ground floors count up from 01, where 01 is "F1." Below-ground (basement) floor count down from FF, where FF is "BF1."
- Byte 28: Species a battle background that will override the trainer battle background AND wild battle background. Leave at 00 if you do not want this. You can choose from 00-09.
