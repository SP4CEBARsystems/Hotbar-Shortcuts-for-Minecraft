;Toggle Minecraft Hotbars - by SP4CEBAR
;
;press V to toggle between five hotbars (4 to 8)
;press C to load a basic hotbar (9) and select slot 1 (empty hand)
;the script is disabled whenever you're not playing Minecraft or whenever you're typing
;One exception: "e" (to open inventory) won't turn it off, because that would ruin everything (search mode behaves differently, to make that work I would have to to detect if you clicked on search and everything would get really complicated and the reliability would suffer)

;troubleshoot:
;- I can't type    -> press "/" or "t"
;- it doesn't work -> press escape
;  - still doesn't work? -> 
;     look at the background apps, do you see an AHK icon?, if not open this program again
;     is your minecraft window called something with "Minecraft" in it?


;these are standard AutoHotKey settings, you can just ignore them

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;this bit of code disables the program when you don't want it

#IfWinActive, Minecraft       ;turn this hotkey off when you aren't playing Minecraft

inventory := 0

/::                           ;turn this hotkey off when you press "/" to chat
Suspend, On
Send /
Pause,On, 1
Return

t::                           ;turn this hotkey off when you press "t" to chat
Suspend, On
Send t
Pause,On, 1
Return

;e::                           ;NOT Advised [turn this hotkey off when you press "e" to open inventory]
;Suspend, On
;inventory := 1
;Send e
;Pause,On, 1
;Return

;e::                           ;NOT SUPPORTED [toggle this hotkey off/on when you press "e" to open or close inventory]
;Suspend
;Send e
;Pause,, 1
;Return

Esc::                         ;turn this hotkey on when you press "escape" to exit chat
Suspend, Off
Send {Esc}
Pause,Off, 1
Return





; T H E   A C T U A L   C O D E

HotBar := 3                  ;FIRST |set the first hotbar to hotbar 4 (in Minecraft: x+4)

v::                          ;KEY1  |if you press "v" on your keyboard (load next hotbar)
	SetKeyDelay -1           ;      |
	Send {Blind}{x Down}     ;MCKEY |the program will hold "x" down
	HotBar++                 ;      |increment the HotBar value (4 becomes 5, 5 becomes 6, etc.)
	if (HotBar>8)            ;GREAT |if HotBar exceeds the highest value (which is 8 in my case)
		HotBar := 3          ;SMALL |then it's set to the lowest value (which is 4 in my case)
	SetKeyDelay -1,0         ;      |
	Send % "{" HotBar "}"    ;      |the program will type the hotbar number
return

v up::                       ;KEY1  |the moment you release "v" on your keyboard
	SetKeyDelay -1           ;      |
	Send {Blind}{x up}       ;MCKEY |the program will release "x" as well
return

c::                          ;KEY2  |if you press "c" on your keyboard (load basic hotbar)
	SetKeyDelay -1,-1        ;      |
	Send {Blind}{x Down}     ;MCKEY |the program will hold "x" down
	HotBar--                 ;      |decrement the HotBar value (6 becomes 5, 5 becomes 4, etc.)
	if (HotBar<3)            ;SMALL |if HotBar gets below the lowest value (which is 4 in my case)
		HotBar := 8          ;GREAT |then it's set to the highest value (which is 8 in my case)
	SetKeyDelay -1,0         ;      |
	Send 9                   ;BASIC |the program will type 9 to load hotbar 9 (basic hotbar)
return

c up::                       ;KEY2  |the moment you release "c" on your keyboard
	SetKeyDelay -1           ;      |
	Send {Blind}{x up}       ;MCKEY |the program will release "x" as well
	SetKeyDelay -1,0         ;      |
	Send 1                   ;SLOT  |the program will type "1" to select slot 1 (empty hand)
return




; S E T T I N G S
;if a description in the previous lines started with a word in capital letters, then there's something in that line (before the ";" and the word) which you can change (a hacker's settings page), to change it find the letter or number mentioned in the table below (either v,c,x,4,8,9,1) and replace it with a letter or number you want it to be
;these are the words in capital letters and what I mean with them:

;|word |type  |default|description
;|_____|______|_______|___________
;|KEY1 |letter|  V    | the key to press on the keyboard to load the next hotbar
;|KEY2 |letter|  C    | the key to press on the keyboard to load the basic hotbar
;|MCKEY|letter|  X    | the key you configured in Minecraft's settings to load hotbars (default is "X")
;|FIRST|number|  4    | the hotbar that's loaded the first time you use it 
;|SMALL|number|  4    | the smallest hotbar number to toggle
;|GREAT|number|  8    | the largest hotbar number to toggle
;|BASIC|number|  9    | a hotbar with basic tools and items
;|SLOT |number|  1    | the inventory slot to go to when the basic hotbar is loaded (empty hand) (to turn it off, just remove the line)

;note 1: the numbers must have a value between (and including) 1 and 9 (because the number keys to load hotbars in Minecraft are the keys 1-9)
;note 2: GREAT must have a value greater than SMALL

;why did I not turn everything into a variable instead? well... simply because it didn't work first try, and I don't want to debug it