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
