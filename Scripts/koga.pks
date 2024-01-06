//---------------
#dyn 0x740000
#org @koga
setvar 0x8004 0x6
setvar 0x8005 0x2
special FAME_CHECKER_NEW

checkflag 0x259 ' check if TM06 acquired
if 0x0 goto @battlesorter

//default message
msgbox @msgbeaten ' When afflicted by TO...
callstd MSG_NOCLOSE ' Non-closing message
release
end

//battle sorter
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

//koga gym challenge 1
#org @battle1
trainerbattle 0x1 0x18 0x0 @msggreeting @msgdefeated @afterbattle
return

//koga gym challenge 2
#org @battle2
trainerbattle 0x1 0x19 0x0 @msggreeting @msgdefeated @afterbattle
return

//koga gym challenge 3
#org @battle3
trainerbattle 0x1 0x1A 0x0 @msggreeting @msgdefeated @afterbattle
return

//koga gym challenge 4
#org @battle4
trainerbattle 0x1 0x1B 0x0 @msggreeting @msgdefeated @afterbattle
return

//koga gym challenge 5
#org @battle5
trainerbattle 0x1 0x1A2 0x0 @msggreeting @msgdefeated @afterbattle
return

//koga gym challenge 6
#org @battle6
trainerbattle 0x1 0x1C 0x0 @msggreeting @msgdefeated @afterbattle
return

//koga gym challenge 7
#org @battle7
trainerbattle 0x1 0x1D 0x0 @msggreeting @msgdefeated @afterbattle
return

//after battle
#org @afterbattle
setvar 0x8004 0x6
setvar 0x8005 0x1
special FAME_CHECKER
clearflag 0x9F
setflag 0x4B4
setflag FR_BADGE_5
setvar 0x8008 0x5
call 0x81A6B18
msgbox @msgtm ' Now that you have th...
callstd MSG_NOCLOSE ' Non-closing message
checkitemspaceinbag TM06 1
compare LASTRESULT 0x0
if == jump 0x816D5E7 ' Equal To
additem TM06 1
msgbox @msgtm2 ' \v\h01 received TM06...
copyvarifnotzero 0x8000 TM06
copyvarifnotzero 0x8001 0x1
copyvarifnotzero 0x8002 0x101
callstd MSG_ITEM ' Shows a message, then... 'Player put the yyy in the zzz!'
setflag 0x259
addvar 0x4011 0x1
msgbox @msgtm3 ' Sealed within that T...
callstd MSG_NOCLOSE ' Non-closing message
release
end

#org 0x816D5E7
'-----------------------------------
msgbox @msgnospace ' Make space for this,...
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
= KOGA: Fwahahaha!\pA mere child like you dares to\nchallenge me?\pThe very idea makes me shiver\nwith mirth!\pVery well, I shall show you true\nterror as a ninja master.\pPoison brings steady doom.\nSleep renders foes helpless.\pDespair to the creeping horror of\nPOISON-type POK\eMON!\c\h0B\h56\h01

#org @msgdefeated
= Humph!\nYou have proven your worth!\pHere!\nTake the SOULBADGE!

#org @msgbeaten
= When afflicted by TOXIC, a POK\eMON\nsuffers more and more.\pIt suffers worsening damage as the\nbattle wears on!\pIt will surely terrorize foes!

#org @msgtm
= Now that you have the SOULBADGE,\nthe DEFENSE of your POK\eMON rises.\pIt also lets you SURF outside of\nbattle.\pAh!\nTake this, too!

#org @msgtm2
= \v\h01 received TM06\nfrom KOGA.

#org @msgtm3
= Sealed within that TM06 lies\nTOXIC!\pIt is a secret technique dating\nback some four hundred years.

#org @msgnospace
= Make space for this, child!