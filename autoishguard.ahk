MsgBox, 64, AutoIshguard Help, For successful run ensure the following:`n`n1.  The item to be crafted is on top of the crafting list and the only item.  Use the search function to force this.`n`n2.  Your crafting macro is bound to {1} on the keyboard`n`n3.  Nothing is targeted.  `n`n4.  Any windows not being used (inventory`, PF`, etc) are closed.

Gui, Add, Button, x22 y89 w130 h40 , Start
Gui, Add, Edit, x92 y29 w60 h20 +Number vIterations, 
Gui, Add, Edit, x92 y59 w60 h20 +Number vMacroTime
Gui, Add, Text, x22 y29 w60 h20 , Iterations
Gui, Add, Text, x22 y59 w60 h20 , Macro Time
Gui, Add, Text, x22 y139 w130 h20 , ; message label below start button 
Gui, Show, w183 h175, AutoIshguard
return

ButtonStart:

	GuiControlGet Iterations
	GuiControlGet MacroTime
	
	Loop ; main loop
	{
		GuiControl, Disable, Start
		loopCount :=  Iterations
		
		Loop, % loopCount {
			
			Random, randTime, 1, 3500 
			Sleep, % randTime ; Add random delay to confuse automation detection
			ControlSend, , {Numpad0}, ahk_class FFXIVGAME
			
			Random, randTime3, 249, 999
			Sleep, % randTime3
			ControlSend, , {Numpad0}, ahk_class FFXIVGAME

			Random, randTime4, 251, 973
			Sleep, % randTime4
			ControlSend, , {Numpad0}, ahk_class FFXIVGAME

			Random, randTime5, 3119, 4603
			Sleep, % randTime5
			ControlSend, , {1}, ahk_class FFXIVGAME

			
			Sleep, MacroTime * 1000 ; Wait for macro to finish
		}
		
		GuiControl, Enable, Start
		MsgBox, 4,, Crafting complete, would you like to run again? (press Yes or No)
		IfMsgBox Yes
			continue
		else
			break
	}
	
GuiClose:
ExitApp