#dyn 0x740000
#org @surge
'-----------------------------------
setvar 0x8004 0x4
setvar 0x8005 0x2
special FAME_CHECKER_NEW

checkflag 0x231 ' check if TM34 Shockwave acquired
if false jump @battlesorter

//default message
msgbox @msgbeaten
callstd MSG_NOCLOSE ' Non-closing message
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

//surge gym challenge 1
#org @battle1
trainerbattle 0x1 0xC 0x0 @msggreeting @msgdefeated @afterbattle
return

//surge gym challenge 2
#org @battle2
trainerbattle 0x1 0xD 0x0 @msggreeting @msgdefeated @afterbattle
return

//surge gym challenge 3
#org @battle3
trainerbattle 0x1 0x1A0 0x0 @msggreeting @msgdefeated @afterbattle
return

//surge gym challenge 4
#org @battle4
trainerbattle 0x1 0xE 0x0 @msggreeting @msgdefeated @afterbattle
return

//surge gym challenge 5
#org @battle5
trainerbattle 0x1 0xF 0x0 @msggreeting @msgdefeated @afterbattle
return

//surge gym challenge 6
#org @battle6
trainerbattle 0x1 0x10 0x0 @msggreeting @msgdefeated @afterbattle
return

//surge gym challenge 7
#org @battle7
trainerbattle 0x1 0x11 0x0 @msggreeting @msgdefeated @afterbattle
return

//after battle
#org @afterbattle
setvar 0x8004 0x4
setvar 0x8005 0x1
special FAME_CHECKER
checkflag 0x23B
if false call 0x816B9AB ' Flag is unset
clearflag 0xA0
setflag 0x4B2 'Champ-in-the-making guy recognises you beat Lt. Surge
setflag FR_BADGE_3 'Player has the thunderbadge
setvar 0x8008 0x3
call 0x81A6B18
msgbox @msgtm
callstd MSG_NOCLOSE
checkitemspaceinbag TM34 1
compare LASTRESULT 0x0
if 0x1 goto @nospace
additem TM34 1
msgbox @msgtm2
copyvarifnotzero 0x8000 TM34
copyvarifnotzero 0x8001 0x1
copyvarifnotzero 0x8002 0x101
callstd MSG_ITEM
setflag 0x231
addvar 0x4011 0x1
msgbox @msgtm3
callstd MSG_NOCLOSE
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
msgbox @msgnospace ' Yo, kid, make room i...
callstd MSG_NOCLOSE
release
end

#org 0x816B9AB
'-----------------------------------
clearflag 0xA1
return

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
= Hey, kid! What do you think you're\ndoing here?\pYou won't live long in combat!\nNot with your puny power!\pI tell you, kid, electric POK\eMON\nsaved me during the war!\pThey zapped my enemies into\nparalysis!\pThe same as I'll do to you!\c\h0B\h56\h01

#org @msgdefeated
= Now that's a shocker!\pYou're the real deal, kid!\pFine, then, take the THUNDERBADGE!

#org @msgbeaten
= A little word of advice, kid!\pElectricity is sure powerful!\pBut, it's useless against GROUND-\ntype POK\eMON!

#org @msgtm
= The THUNDERBADGE cranks up your\nPOK\eMON's SPEED!\pIt also lets your POK\eMON FLY\nlightning-quick anytime, kid!\pYou're special, kid!\nTake this!

#org @msgtm2
= \v\h01 received TM34\nfrom LT. SURGE.

#org @msgtm3
= TM34 contains SHOCK WAVE!\pTeach it to an ELECTRIC POK\eMON!

#org @msgnospace
= Yo, kid, make room in your BAG!