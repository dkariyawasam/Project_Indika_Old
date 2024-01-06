'-----------------------------------
#dyn 0x740000
#org @sailor
'-----------------------------------
lock
faceplayer
msgbox @msgquestion
callstd MSG_NOCLOSE ' Non-closing message
multichoice 0x0 0x0 0x2C 0x1 ' (0x0) PALLET TOWN, (0x1) FUSCHIA CITY, (0X2) EXIT
compare LASTRESULT 0x0
if == goto @pallettown
compare LASTRESULT 0x1
if == goto @fuchsiacity
compare LASTRESULT 0x2
if == goto @exit
release
end

#org @pallettown
'-----------------------------------
msgbox @msgsetsail ' Okay, everything's in ...
callstd MSG_NOCLOSE ' Non-closing message
closemsg
fadescreen FADEOUT_BLACK
setvar 0x8006 0x1
special 0x17B
waitspecial
end

#org @fuchsiacity
'-----------------------------------
msgbox @msgsetsail ' Okay, everything's in ...
callstd MSG_NOCLOSE ' Non-closing message
closemsg
fadescreen FADEOUT_BLACK
setvar 0x8006 0x2
special 0x17B
waitspecial
end

#org @exit
'-----------------------------------
msgbox @msgnogo 'Alright, do come...
callstd MSG_NORMAL
release
end

#org @msgquestion
= Ahoy, there!\pI can take you to\nPallet Town or Fuchsia City.\pShall we go?

#org @msgsetsail
= Okay, everything's in order.\pWe'll be departing immediately.

#org @msgnogo
= Alright, do come talk to me\nwhen you do.

