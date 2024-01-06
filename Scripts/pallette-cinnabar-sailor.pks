'-----------------------------------
#dyn 0x740000
#org @sailor
'-----------------------------------
lock
faceplayer
message @msgquestion ' Ahoy, there!\nI can ...
callstd MSG_YESNO
compare LASTRESULT YES
if == jump @yes
jump @no

#org @yes
'-----------------------------------
msgbox @msgsetsail ' Okay, everything's in ...
callstd MSG_NOCLOSE ' Non-closing message
jump @playseagull

#org @no
'-----------------------------------
msgbox @msgnogo 'Alright, do come...
callstd MSG_NORMAL
release
end

#org @playseagull
'-----------------------------------
closemsg
fadescreen FADEOUT_BLACK
setvar 0x8006 0x8
special 0x17B
waitspecial
end

#org @msgquestion
= Ahoy, there!\nI can take you to Cinnabar Island.\pShall we go?

#org @msgsetsail
= Okay, everything's in order.\pWe'll be departing immediately.

#org @msgnogo
= Alright, do come talk to me\nwhen you do.

