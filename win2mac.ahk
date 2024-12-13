;-----------------------------------------
; AutoHotKey Script for Almost Complete Mac Keyboard Transformation for Windows 11 but for PC Keyboards
; AutoHotKey Version:		1.x
; Language:					English
; Platform:					Windows 10/11
; Author:					TheBitStick
;=========================================

; --------------------------------------------------------------
; Key
; --------------------------------------------------------------

; ! = Option (Command)
; ^ = Control
; + = Shift
; # = Meta

; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; --------------------------------------------------------------
; Setup
; --------------------------------------------------------------

#InstallKeybdHook
#InstallMouseHook
#SingleInstance Force
SetTitleMatchMode 2

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; --------------------------------------------------------------
; Base System Remappings
; --------------------------------------------------------------

LAlt::							return
LWin::							return

; --------------------------------------------------------------
; CapsLock
; --------------------------------------------------------------

$CapsLock::
    KeyWait, CapsLock, T0.3
    If ErrorLevel
    {
        if GetKeyState("CapsLock", "T") = 0
            SetCapsLockState on
        else
			SetCapsLockState off
        Keywait, CapsLock
    } else {
		if GetKeyState("CapsLock", "T")
			SetCapsLockState off
		else
			Send {LShift}
	}
Return

; DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("ActivateKeyboardLayout", UInt, 1, UInt, 256))

; --------------------------------------------------------------
; system settings
; --------------------------------------------------------------

!#Esc::							Send ^+{Esc} ; task (CMD+ALT+ESC)

!+Backspace::					FileRecycleEmpty
!#+BS::							FileRecycleEmpty

; switch between different workspace
!#Left::						Send ^#{Left}
!#Right::						Send ^#{Right}

; --------------------------------------------------------------
; Basic Translations (from Control+* to Command+* [and some Command+Shift+*])
; --------------------------------------------------------------

!a::							Send ^a ; select all (CMD+A)
!b::							Send ^b ; bold (CMD+B)
!c::							Send ^c ; copy (CMD+C)
!d::							Send ^d
!e::							Send ^e ; aligned by center (CMD+E)
!f::							Send ^f ; search (CMD+F)
!g::							Send ^g
!h::							Send ^h
!i::							Send ^i ; italic (CMD+I)
	#IfWinActive ahk_exe explorer.exe
		!i::					Send !{Enter} ; information (CMD+I)
	#IfWinActive
!j::							Send ^j
!k::							Send ^k
!l::							Send ^l ; aligned by left (CMD+L)
!m::							WinMinimize, A
!n::							Send ^n ; new file (CMD+N)
!o::							Send ^o ; open (CMD+O)
	#IfWinActive ahk_exe explorer.exe
		!o::					Send {Enter}
	#IfWinActive
!p::							Send ^p ; print (CMD+P)
; !q::							Send !{F4} ; quit (CMD+Q)
!r::							Send ^r
!s::							Send ^s ; save (CMD+S)
!t::							Send ^t ; new tab (CMD+T)
!u::							Send ^u ; underline (CMD+U)
	#IfWinActive ahk_exe explorer.exe
		!u::					Send {F2}
	#IfWinActive
!v::							Send ^v ; paste (CMD+V)
!w::							Send ^w ; close windows/tab (CMD+W)
!x::							Send ^x ; cut (CMD+X)
!y::							Send ^y ; redo (CMD+Y)
!z::							Send ^z ; undo (CMD+Z)

!+a::							Send ^+a
!+i::							Send ^+i
!+j::							Send ^+j
!+m::							Send ^+m
!+n::							Send ^+n ; new item, used in several apps (CMD+SHIFT+N)
!+p::							Send ^+p
!+s::							Send ^+s ; save as (CMD+SHIFT+S)
!+t::							Send ^+t ; reopen recently closed tab (CMD+SHIFT+T)
!+v::							Send ^+v
!+z::							Send ^y ; redo (CMD+SHIFT+Z)

!#f::							Send ^f
!#c::							Send ^!c
!#v::							Send ^!v
	#IfWinActive ahk_exe explorer.exe
		!#v::					Send ^v
	#IfWinActive

!#+v::							Send ^!+v ; paste with dest formatting (CMD+ALT+SHIFT+V)

!1::							Send ^1
	#IfWinActive ahk_exe explorer.exe
		!1::					Send ^+3
	#IfWinActive
!2::							Send ^2
	#IfWinActive ahk_exe explorer.exe
		!2::					Send ^+5
	#IfWinActive
!3::							Send ^3
	#IfWinActive ahk_exe explorer.exe
		!3::					Send ^+8
	#IfWinActive
!4::							Send ^4
	#IfWinActive ahk_exe explorer.exe
		!4::					Send ^+1
	#IfWinActive
!5::							Send ^5
	#IfWinActive ahk_exe explorer.exe
		!5::					Send ^+6
	#IfWinActive
!6::							Send ^6
!7::							Send ^7
!8::							Send ^8
!9::							Send ^9
!0::							Send ^0

; zoom (CMD+=, CMD+SHIFT+=)
!=::							Send ^{=} ; zoom in
!-::							Send ^- ; zoom out
!Numpad0::						Send ^{Numpad0} ; reset zoom

; --------------------------------------------------------------
; text editing - cursor manipulation
; --------------------------------------------------------------

; jump to beginning/end of line (CMD+Left)
!Left::							Send {Home}
!Right::						Send {End}
!Up::							Send ^{Home}
	#IfWinActive ahk_exe explorer.exe
		!Up::					Send !{Up}
	#IfWinActive
!Down::							Send ^{End}
	#IfWinActive ahk_exe explorer.exe
		!Down::					Send {Enter}
	#IfWinActive

; move between words (ALT+Arrow)
#Left::							Send ^{Left}
#Right::						Send ^{Right}
#Up::                           Send !{Up}
#Down::                         Send !{Down}

; select to beginning/end of line (CMD+SHIFT+Arrow)
!+Left::						Send +{Home}
!+Right::						Send +{End}
!+Up::							Send ^+{Home}
!+Down::						Send ^+{End}

; select by word (ALT+SHIFT+Arrow)
#+Left::						Send ^+{Left}
#+Right::						Send ^+{Right}
#+Up::							Send ^+{Up}
#+Down::						Send ^+{Down}

; curses with the same horizontal position
!#Up::							Send ^!{Up}
!#Down::						Send ^!{Down}

!Delete::						Send +{End}{Delete} ; delete single line after current curse (CMD+DEL)
!Backspace::					Send +{Home}{Delete} ; detete single line before current curse (CMD+BS)
	#IfWinActive ahk_exe explorer.exe
		!Backspace::			Send {Delete} ; delete selected files/directories
	#IfWinActive

#Delete::						Send ^{Delete} ; delete next word
#Backspace::					Send ^{Backspace} ; delete previous word

; change font size (CMD+SHIFT+>, CMD+SHIFT+<)
!+>::							Send ^+>
!+<::							Send ^+<

!Enter::						Send ^{Enter}
!+Enter::						Send ^+{Enter}
<!LButton::						Send ^{Click}
<^LButton::						Click, Right
<#LButton::                     Send !{Click}
!WheelUp::                      Send ^{WheelUp}
!WheelDown::                    Send ^{WheelDown}
<#Enter::						Send !{Enter}

; --------------------------------------------------------------
; used in visual studio code
; --------------------------------------------------------------

![::							Send !{Left}
!]::							Send !{Right}
!/::							Send ^/ ; comment (CMD+/)
!,::							Send ^, ; setting (CMD+,)

; --------------------------------------------------------------
; Media Key Remappings
; --------------------------------------------------------------

;F7::							Media_Prev
;F8::							Media_Play_Pause
;F9::							Media_Next
;F10::							Volume_Mute
;F11::							Volume_Down
;F12::							Volume_Up


; --------------------------------------------------------------
; Special Characters (sorry I'm American, no diacritics)
; --------------------------------------------------------------

#If, GetKeyState("LShift", "P")
LWin & -::						Send —
#If

; --------------------------------------------------------------
; Rectangle (Mac window manager) shortcuts I use
; --------------------------------------------------------------

^#c::
	WinGetTitle, windowName, A
	WinGetPos,,, Width, Height, %windowName%
    WinMove, %windowName%,, (A_ScreenWidth - Width) / 2, (A_ScreenHeight - Height) / 2
return
