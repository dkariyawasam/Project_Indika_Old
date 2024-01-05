#dyn 0x740000
#org @debugsign
'-----------------------------------
lockall
msgbox @msgdebug ' TRAINER TIPS\pPress ...
callstd MSG_NOCLOSE ' Non-closing message
clearflag 0x8c
releaseall
end


#org @msgdebug
= DEBUG\pClearflag 0x8C!
