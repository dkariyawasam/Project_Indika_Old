#dyn 0x740000
#org @customchecks
'-----------------------------------
setworldmapflag 0x890
checkflag FR_POKEDEX
if true call @sailor
end

#org @sailor
'-----------------------------------
clearflag 0x8c
return

