#dyn 0x740000
#org @erika
'-----------------------------------
setvar 0x8004 0x5
setvar 0x8005 0x2
special FAME_CHECKER_NEW

checkflag 0x293 'check if TM19 Giga Drain acquired 
if false jump @battlesorter

//default message
setvar 0x8004 0x5
setvar 0x8005 0x4
special FAME_CHECKER
msgbox @msgbeaten
callstd MSG_NOCLOSE
release
end

//battlesorter
#org @battlesorter
compare 0x4011 0x0 'var used to count how many gym badges the player has acquired.
if 0x1 goto @battle1

compare 0x4011 0x1
if 0x1 goto @battle2

compare 0x4011 0x2
if 0x1 goto @battle3

compare 0x4011 0x3
if 0x1 goto @battle4

compare 0x4011 0x4
if 0x1 goto @battle5

compare 0x4011 0x5
if 0x1 goto @battle6

compare 0x4011 0x6
if 0x1 goto @battle7
return

//erika gym challenge 1
#org @battle1
trainerbattle 0x1 0x12 0x0 @msggreeting @msgdefeated @afterbattle
return

//erika gym challenge 2
#org @battle2
trainerbattle 0x1 0x13 0x0 @msggreeting @msgdefeated @afterbattle
return

//erika gym challenge 3
#org @battle3
trainerbattle 0x1 0x14 0x0 @msggreeting @msgdefeated @afterbattle
return

//erika gym challenge 4
#org @battle4
trainerbattle 0x1 0x1A1 0x0 @msggreeting @msgdefeated @afterbattle
return

//erika gym challenge 5
#org @battle5
trainerbattle 0x1 0x15 0x0 @msggreeting @msgdefeated @afterbattle
return

//erika gym challenge 6
#org @battle6
trainerbattle 0x1 0x16 0x0 @msggreeting @msgdefeated @afterbattle
return

//erika gym challenge 7
#org @battle7
trainerbattle 0x1 0x17 0x0 @msggreeting @msgdefeated @afterbattle
return

//after battle
#org @afterbattle
setvar 0x8004 0x5
setvar 0x8005 0x1
special FAME_CHECKER
clearflag 0x9E
setflag 0x4B3
setflag FR_BADGE_4
setvar 0x8008 0x4
call 0x81A6B18
msgbox 0x8197327 ' The RAINBOWBADGE wil...
callstd MSG_NOCLOSE ' Non-closing message
checkitemspaceinbag TM19 1
compare LASTRESULT 0x0
if == jump 0x816D107 ' Equal To
additem TM19 1
msgbox 0x81973BA ' \v\h01 received TM19...
copyvarifnotzero 0x8000 TM19
copyvarifnotzero 0x8001 0x1
copyvarifnotzero 0x8002 0x101
callstd MSG_ITEM ' Shows a message, then... 'Player put the yyy in the zzz!'
setflag 0x293
addvar 0x4011 0x1
msgbox 0x81973D7 ' TM19 contains GIGA D...
callstd MSG_NOCLOSE ' Non-closing message
release
end

#org 0x81A6B18
'-----------------------------------
copyvar 0x8000 0x8008
compare 0x8000 0x1
if == jump 0x81A6B76 ' Equal To
compare 0x8000 0x2
if == jump 0x81A6B7A ' Equal To
compare 0x8000 0x3
if == jump 0x81A6B81 ' Equal To
compare 0x8000 0x4
if == jump 0x81A6B8B ' Equal To
compare 0x8000 0x5
if == jump 0x81A6BA1 ' Equal To
compare 0x8000 0x6
if == jump 0x81A6BB4 ' Equal To
compare 0x8000 0x7
if == jump 0x81A6BCA ' Equal To
compare 0x8000 0x8
if == jump 0x81A6BE0 ' Equal To
end

#org @nospace
'-----------------------------------
msgbox @msgnospace ' You should make room...
callstd MSG_NOCLOSE
release
end

#org 0x81A6B76
'-----------------------------------
cleartrainerflag 0x8E
return

#org 0x81A6B7A
'-----------------------------------
cleartrainerflag 0x96
cleartrainerflag 0xEA
return

#org 0x81A6B81
'-----------------------------------
cleartrainerflag 0x8D
cleartrainerflag 0xDC
cleartrainerflag 0x1A7
return

#org 0x81A6B8B
'-----------------------------------
cleartrainerflag 0x84
cleartrainerflag 0x85
cleartrainerflag 0xA0
cleartrainerflag 0x109
cleartrainerflag 0x10A
cleartrainerflag 0x10B
cleartrainerflag 0x192
return

#org 0x81A6BA1
'-----------------------------------
cleartrainerflag 0x126
cleartrainerflag 0x127
cleartrainerflag 0x120
cleartrainerflag 0x121
cleartrainerflag 0x124
cleartrainerflag 0x125
return

#org 0x81A6BB4
'-----------------------------------
cleartrainerflag 0x118
cleartrainerflag 0x119
cleartrainerflag 0x11A
cleartrainerflag 0x11B
cleartrainerflag 0x1CE
cleartrainerflag 0x1CF
cleartrainerflag 0x1D0
return

#org 0x81A6BCA
'-----------------------------------
cleartrainerflag 0xB1
cleartrainerflag 0xB2
cleartrainerflag 0xB3
cleartrainerflag 0xB4
cleartrainerflag 0xD5
cleartrainerflag 0xD6
cleartrainerflag 0xD7
return

#org 0x81A6BE0
'-----------------------------------
cleartrainerflag 0x128
cleartrainerflag 0x129
cleartrainerflag 0x142
cleartrainerflag 0x143
cleartrainerflag 0x144
cleartrainerflag 0x188
cleartrainerflag 0x190
cleartrainerflag 0x191
return


#org @msggreeting
= Hello[.]\nLovely weather, isn't it?\lIt's so pleasant[.]\p[.]Oh, dear[.]\nI must have dozed off. Welcome.\pMy name is ERIKA.\nI am the LEADER of CELADON GYM.\pI am a student of the art of\nflower arranging.\pMy POK\eMON are solely of the\nGRASS type.\p[.]Oh, I'm sorry, I had no idea that\nyou wished to challenge me.\pVery well, but I shall not lose.\c\h0B\h56\h01

#org @msgdefeated
= Oh!\nI concede defeat.\lYou are remarkably strong.\pI must confer on you the\nRAINBOWBADGE.

#org @msgbeaten
= You are cataloging POK\eMON?\nI must say I'm impressed.\pI would never collect POK\eMON if\nthey were unattractive.

#org @msgtm
= The RAINBOWBADGE will make\nPOK\eMON up to Lv. 50 obey.\pIt also allows POK\eMON to use\nSTRENGTH in and out of battle.\pPlease also take this with you.

#org @msgtm2
= \v\h01 received TM19\nfrom ERIKA.

#org @msgtm3
= TM19 contains GIGA DRAIN.\pHalf the damage it inflicts is\ndrained to heal your POK\eMON.\pWouldn't you agree that it's a\nwonderful move?

#org @msgnospace
= You should make room for this.