#dyn 0x740000
#org @brockcheck
'-------------------------------
checkflag 0x202			//Has Brock been encountered in Mt Moon?
if true goto @brockisback	//If he has been, trigger @brockisback
setflag 0x203			//If not, set Brock in the Gym to hidden
end

#org @brockisback
'-------------------------------
clearflag 0X203			///Set Brock in the Gym to visible
end
