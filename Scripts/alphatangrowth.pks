#dyn 0x740000
#org @alphatangrowth

lock
faceplayer
checksound
cry 0x135 0x1
waitcry
msgbox @battlecry 0X6// Graughhh!
callstd MSG_NOCLOSE
playsound 0x135 0x0
battle 0x135 50 NONE
special BATTLE_PIXELLATE
disappear 0xC
waitspecial
setflag 0X241
release
end


#org @battlecry
= GRAUGHHH!


