#dyn 0x740000
#org @brockfirstencounter
'-----------------------------------
lock
faceplayer
msgbox @msggreeting
callstd MSG_NOCLOSE
release
fadescreen 0x1
disappear 0xf
fadescreen 0x0
setflag 0x202			//Set Brock in Mt Moon to hidden	
end


#org @msggreeting
= Fuhaha, There it is!\nIt's the fossil I was looking for!\pUh? Are you a gym challenger?\nI'm not one to neglect my duties.\pI'll meet you at the gym.
