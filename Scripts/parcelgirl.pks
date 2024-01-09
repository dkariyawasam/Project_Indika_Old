#dyn 0x740000
#org @parcelgirl
'-----------------------------------
lockall
applymovement 0x1 0x81A75EB ' look_right_delayed e...
applymovement PLAYER 0x81A75E7 ' look_left_delayed en...
pauseevent 0x0
call @giveparcel
releaseall
end

#org @giveparcel
'-----------------------------------
textcolor RED
msgbox @msgparcel1 ' Look, look!\pI copie...
callstd MSG_NOCLOSE ' Non-closing message
closemsg
pause 0x14
textcolor GRAY
setflag 0x83E
setvar 0x4070 0x1
setvar 0x4002 0x0
special 0x170
special 0x171
setvar 0x4057 0x1
additem OAKSPARCEL 1
msgboxsign
msgbox @parcelreceived ' \v\h01 received OAK'...
copyvarifnotzero 0x8000 OAKSPARCEL
copyvarifnotzero 0x8001 0x1
copyvarifnotzero 0x8002 0x13E
callstd MSG_ITEM ' Shows a message, then... 'Player put the yyy in the zzz!'
waitfanfare
setvar 0x4055 0x5
msgboxnormal
textcolor RED
msgbox @msgparcel2 ' Maybe someone droppe...
callstd MSG_NOCLOSE ' Non-closing message
return


#org @msgparcel1
= Wait!\nI found this parcel on the ground.\pCan I leave it with you?

#org @msgparcel2
= Maybe someone dropped it.

#org @parcelreceived
= \v\h01 received OAK'S PARCEL\nfrom cheerful girl.

#org 0x81A75EB
M look_right_delayed end

#org 0x81A75E7
M look_left_delayed end
