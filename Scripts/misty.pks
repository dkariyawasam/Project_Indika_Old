//---------------
#dyn 0x740000
#org @misty
setvar 0x8004 0x3
setvar 0x8005 0x2
special 0x174

checkflag 0x297 ' check if TM03 Water Pulse acquired
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

//misty gym challenge 1
#org @battle1
trainerbattle 0x1 0x6 0x0 @msggreeting @msgdefeated @afterbattle
return

//misty gym challenge 2
#org @battle2
trainerbattle 0x1 0x19F 0x0 @msggreeting @msgdefeated @afterbattle
return

//misty gym challenge 3
#org @battle3
trainerbattle 0x1 0x7 0x0 @msggreeting @msgdefeated @afterbattle
return

//misty gym challenge 4
#org @battle4
trainerbattle 0x1 0x8 0x0 @msggreeting @msgdefeated @afterbattle
return

//misty gym challenge 5
#org @battle5
trainerbattle 0x1 0x9 0x0 @msggreeting @msgdefeated @afterbattle
return

//misty gym challenge 6
#org @battle6
trainerbattle 0x1 0xA 0x0 @msggreeting @msgdefeated @afterbattle
return

//misty gym challenge 7
#org @battle7
trainerbattle 0x1 0xB 0x0 @msggreeting @msgdefeated @afterbattle
return

//after battle
#org @afterbattle
setvar 0x8004 0x3
setvar 0x8005 0x1
special 0x173
setflag 0x4B1 'Champ-in-the-making guy recognises you beat Misty
setflag 0x821 'Player has the cascadebadge
sethealingplace 0x4
setvar 0x8008 0x2
call 0x81A6B18
message @msgtm
callstd MSG_NOCLOSE
checkitemroom 0x123 0x1
compare LASTRESULT 0x0
if 0x1 goto @nospace
additem 0x123 0x1
message @msgtm2
giveitem2 0x123 0x1 0x101
setflag 0x297 'TM03 acquired
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
message @msgnospace '"You better make room for this!"
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
= Hi, you're a new face!\pOnly those TRAINERS who have a\npolicy about POKÈMON can turn pro.\pWhat is your approach when you\ncatch and train POKÈMON?\pMy policy is an all-out offensive\nwith WATER-type POKÈMON!

#org @msgdefeated
= Wow!\nYou're too much!\pAll right!\pYou can have the CASCADEBADGE to\nshow you beat me.

#org @msgbeaten
= You don't mess around!

#org @msgtm
= The CASCADEBADGE makes all\nPOKÈMON up to Lv. 30 obey.\pThat includes even outsiders you\ngot in trades.\pThere's more. You can now use CUT\nanytime, even out of battle.\pYou can CUT down small trees to\nopen new pathways.\pYou can also have my favorite TM.

#org @msgtm2
= \v\h01 received TM03\nfrom MISTY.

#org @msgtm3
= TM03 teaches WATER PULSE.\pUse it on an aquatic POKÈMON!

#org @msgnospace
= You better make room for this!