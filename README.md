# Hotbar-Shortcuts-for-Minecraft
this is an AutoHotKey program that allows you to toggle Minecraft's hotbars  
  
HOW TO USE  
1. download AutoHotKey from https://www.autohotkey.com/, and install it
2. download this program (the file that ends with ".ahk")
3. open the program in AutoHotKey to run it
4. open a Minecraft creative world to use it
  
IN MINECRAFT  
- press V to toggle between six of minecraft's hotbars (3 to 8)  
- press C to load a basic hotbar (9) and it'll select slot 1 (empty hand)  
- the script is disabled whenever you're not playing Minecraft or whenever you've pressed "t" or "/" to start typing  
	- One exception: "e" (to open inventory) won't turn disable it, because that would ruin everything (the search tab in Minecraft's creative inventory behaves different to the other tabs, to make that work I would have to to detect if you clicked on search and everything would get really complicated and the reliability would suffer)  
  
Any of the numbers can be changed in the source code (don't worry, they are labeled)  
The source code is full of descriptions, so don't be afraid to look through it, or make modifications to suit your needs
  
TROUBLESHOOT  
- I can't type properly in Minecraft  -> press "/" or "t"
- I can't type properly outside of Minecraft  -> press "/" or "t"
	- Your window/browser tab is probably something with "Minecraft" in it
- the hotbar doesn't work    -> press escape
	- still doesn't work? -> 
		- look in your Windows background apps, do you see an AHK icon?, if not start this program again
  		- is your minecraft window called something with "Minecraft" in it?, if not replace "Minecraft" in the "#IfWinActive, Minecraft" in this program
