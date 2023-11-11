'---------------
#dyn 0x740000
#org @brock
setvar 0x8004 0x2
setvar 0x8005 0x2
special 0x174

checkflag 0x254 ' check if TM39 Rock Tomb acquired
if 0x0 goto @battlesorter

//default message
message @msgbeaten
callstd MSG_NOCLOSE
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


//brock gym challenge 1
#org @battle1
trainerbattle 0x1 0x19E 0x0 @msggreeting @msgdefeated @afterbattle
return

//brock gym challenge 2
#org @battle2
trainerbattle 0x1 0x0 0x0 @msggreeting @msgdefeated @afterbattle
return

//brock gym challenge 3
#org @battle3
trainerbattle 0x1 0x1 0x0 @msggreeting @msgdefeated @afterbattle
return

//brock gym challenge 4
#org @battle4
trainerbattle 0x1 0x2 0x0 @msggreeting @msgdefeated @afterbattle
return

//brock gym challenge 5
#org @battle5
trainerbattle 0x1 0x3 0x0 @msggreeting @msgdefeated @afterbattle
return

//brock gym challenge 6
#org @battle6
trainerbattle 0x1 0x4 0x0 @msggreeting @msgdefeated @afterbattle
return

//brock gym challenge 7
#org @battle7
trainerbattle 0x1 0x5 0x0 @msggreeting @msgdefeated @afterbattle
return

//after battle
#org @afterbattle
setvar 0x8004 0x2
setvar 0x8005 0x1
special 0x173
setflag 0x4B0 'Champ-in-the-making guy recognises you beat Brock
setflag 0x820 'Player has the boulderbadge
setvar 0x406C 0x1 'Disables man that traps you in pewter until you beat Brock
setflag 0x2E
clearflag 0x92
setvar 0x8008 0x1
call 0x1A6B18
message @msgtm
callstd MSG_NOCLOSE
checkitemroom 0x147 0x1
compare LASTRESULT 0x0
if 0x1 goto @nospace
additem 0x147 0x1
message @msgtm2
callstd MSG_NOCLOSE
giveitem2 0x147 0x1 0x101
setflag 0x254 'TM39 acquired
addvar 0x4011 0x1
message @msgtm3
callstd MSG_NORMAL
end


#org 0x1A6B18
copyvar 0x8000 0x8008
compare 0x8000 0x1
if 0x1 goto 0x81A6B76
compare 0x8000 0x2
if 0x1 goto 0x81A6B7A
compare 0x8000 0x3
if 0x1 goto 0x81A6B81
compare 0x8000 0x4
if 0x1 goto 0x81A6B8B
compare 0x8000 0x5
if 0x1 goto 0x81A6BA1
compare 0x8000 0x6
if 0x1 goto 0x81A6BB4
compare 0x8000 0x7
if 0x1 goto 0x81A6BCA
compare 0x8000 0x8
if 0x1 goto 0x81A6BE0
end


#org @nospace
message @msgnospace '"You don't have room for this."
callstd MSG_NOCLOSE
release
end


#org 0x1A6B76
cleartrainerflag 0x8E
return


#org 0x1A6B7A
cleartrainerflag 0x96
cleartrainerflag 0xEA
return


#org 0x1A6B81
cleartrainerflag 0x8D
cleartrainerflag 0xDC
cleartrainerflag 0x1A7
return


#org 0x1A6B8B
cleartrainerflag 0x84
cleartrainerflag 0x85
cleartrainerflag 0xA0
cleartrainerflag 0x109
cleartrainerflag 0x10A
cleartrainerflag 0x10B
cleartrainerflag 0x192
return


#org 0x1A6BA1
cleartrainerflag 0x126
cleartrainerflag 0x127
cleartrainerflag 0x120
cleartrainerflag 0x121
cleartrainerflag 0x124
cleartrainerflag 0x125
return


#org 0x1A6BB4
cleartrainerflag 0x118
cleartrainerflag 0x119
cleartrainerflag 0x11A
cleartrainerflag 0x11B
cleartrainerflag 0x1CE
cleartrainerflag 0x1CF
cleartrainerflag 0x1D0
return


#org 0x1A6BCA
cleartrainerflag 0xB1
cleartrainerflag 0xB2
cleartrainerflag 0xB3
cleartrainerflag 0xB4
cleartrainerflag 0xD5
cleartrainerflag 0xD6
cleartrainerflag 0xD7
return


#org 0x1A6BE0
cleartrainerflag 0x128
cleartrainerflag 0x129
cleartrainerflag 0x142
cleartrainerflag 0x143
cleartrainerflag 0x144
cleartrainerflag 0x188
cleartrainerflag 0x190
cleartrainerflag 0x191
return


'---------
' Strings
'---------
#org @msggreeting
= So, you're here. I'm BROCK.\nI'm PEWTER's GYM LEADER.\pMy rock-hard willpower is evident\neven in my POK\eMON.\pMy POK\eMON are all rock hard, and\nhave true-grit determination.\pThat's right - my POK\eMON are all\nthe ROCK type!\pFuhaha! You're going to challenge\nme knowing that you'll lose?\pThat's the TRAINER's honor that\ncompels you to challenge me.\pFine, then!\nShow me your best!\c\h0B\h56\h01

#org @msgdefeated
= I took you for granted, and so\nI lost.\pAs proof of your victory, I confer\non you this[.]the official POK\eMON\lLEAGUE BOULDERBADGE.\p\c\h06\h02\v\h01 received the BOULDERBADGE\nfrom BROCK!\c\h17\c\h0B\h04\h01\c\h08\n\c\h08\h56\c\h18\p\c\h06\h04Just having the BOULDERBADGE makes\nyour POK\eMON more powerful.\pIt also enables the use of the\nmove FLASH outside of battle.\pOf course, a POK\eMON must know the\nmove FLASH to use it.

#org @msgbeaten
= There are all kinds of TRAINERS in\nthis huge world of ours.\pYou appear to be very gifted as a\nPOK\eMON TRAINER.\pSo let me make a suggestion.\pGo to the GYM in CERULEAN and test\nyour abilities.

#org @msgtm
= Wait!\nTake this with you.

#org @msgtm2
= \v\h01 received TM39\nfrom BROCK.

#org @msgtm3
= A TM, Technical Machine, contains a\ntechnique for POK\eMON.\pUsing a TM teaches the move it\ncontains to a POK\eMON.\pA TM is good for only one use.\pSo, when you use one, pick the\nPOK\eMON carefully.\pAnyways[.]\nTM39 contains ROCK TOMB.\pIt hurls boulders at the foe and\nlowers its SPEED.

#org @msgnospace
= You don't have room for this.