#Requires AutoHotkey v2.0
; #Warn  ; Enable warnings to assist with detecting common errors.  
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.  
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.  

; Docs:  
; https://www.autohotkey.com/docs/v2/Hotkeys.htm    
; https://www.autohotkey.com/docs/v2/KeyList.htm    
; Ref: https://www.autohotkey.com/board/topic/60675-osx-style-command-keys-in-windows/    

; ! = ALT -> ^ CTRL -> Command  
; ^ = CTRL -> ^ CTRL -> Control  
; + = SHIFT -> + SHIFT -> Shift  
; # = WIN -> ! ALT -> Option  

; You need to disable "Between input languages" shortcut from Control Panel\Clock, Language, and Region\Language\Advanced settings > Change language bar hot keys  

; Universal shortcuts

$!a::Send("^a") ; CMD+A: select all  
$!b::Send("^b") ; CMD+B: bold  
$!c::Send("^c") ; CMD+C: copy  
$!d::Send("^d") ; CMD+D: exit in terminal  
$!e::Send("^e") ; CMD+E: aligned by center  
$!f::Send("^f") ; CMD+F: search  
$!g::Send("^g") ; CMD+G: group in PowerPoint  
$!h::Send("^h") ; CMD+H: highlight  
$!i::Send("^i") ; CMD+I: italic  
$!j::Send("^j") ; CMD+J: open terminal in VSCode  
$!k::Send("^k") ; CMD+K
$!l::Send("^l") ; CMD+L: aligned by left  
$!o::Send("^o") ; CMD+O: open  
$!p::Send("^p") ; CMD+P: print  
$!r::Send("^r") ; CMD+R: aligned by right  
$!s::Send("^s") ; CMD+S: save  
$!u::Send("^u") ; CMD+U: underline
$!v::Send("^v") ; CMD+V: paste  
$!w::Send("^w") ; CMD+W: close window/tab  
$!x::Send("^x") ; CMD+X: cut

; $!q::Send("!{f4}") ; quit  
$!m::Send("{LWin Down}{Down}{LWin Up}") ; windows minimize 

$!n::Send("^n") ; CMD+N: new file  
$!+n::Send("^+n") ; CMD+SHIFT+N: new win
$!t::Send("^t") ; CMD+T: new tab
$!+t::Send("^+t") ; CMD+SHIFT+T: restore tab
$!z::Send("^z") ; CMD+Z: undo
$!+z::Send("^y") ; CMD+SHIFT+Z: redo  

$!`::Send("{Alt Down}{Shift Down}{Tab}{Shift Up}") ; switch between tabs
$!/::Send("^/")  ; CMD+/: comment
$!,::Send("^,")  ; CMD+,: open setting
$!=::Send("^{=}") ; CMD++: zoom in
$!-::Send("^-") ; CMD+-: zoom out
$!Numpad0::Send("^{Numpad0}") ; CMD+Numpad0: reset zoom

; Quick Switch Tab shortcuts  

$!1::Send("^1")  
$!2::Send("^2")  
$!3::Send("^3")  
$!4::Send("^4")  
$!5::Send("^5")  
$!6::Send("^6")  
$!7::Send("^7")  
$!8::Send("^8")  
$!9::Send("^9")  
$!0::Send("^0")  

; Chrome shortcuts  

$!+]::Send("{Ctrl Down}{Tab Down}{Tab Up}{Ctrl Up}")  
$!+[::Send("{Ctrl Down}{Shift Down}{Tab Down}{Tab Up}{Shift Up}{Ctrl Up}")  

; Input methods  

; $+,::Send("^,")  
; $+.::Send("^.")  

; Navigation, selection, delete a word/till end  

; jump to beginning/end of line (CMD+Arrow)
$!Left::Send("{Home}")  
$!Right::Send("{End}")  
$!Up::Send("{Lctrl down}{Home}{Lctrl up}")  
$!Down::Send("{Lctrl down}{End}{Lctrl up}")  

; jump between words (ALT+Arrow)
$#Left::Send("{ctrl down}{Left}{ctrl up}")  
$#Right::Send("{ctrl down}{Right}{ctrl up}")  
$#Up::Send("{alt down}{Up}{alt up}")  
$#Down::Send("{alt down}{Down}{alt up}")  

; select to beginning/end of line (CMD+SHIFT+Arrow)
$!+Left::Send("{shift down}{Home}{shift up}")  
$!+Right::Send("{shift down}{End}{shift up}")  
$!+Up::Send("{Ctrl Down}{shift down}{Home}{shift up}{Ctrl Up}")  
$!+Down::Send("{Ctrl Down}{shift down}{End}{shift up}{Ctrl Up}") 

; select by word (ALT+SHIFT+Arrow)
$#+Left::Send("{ctrl down}{shift down}{Left}{shift up}{ctrl up}")  
$#+Right::Send("{ctrl down}{shift down}{Right}{shift up}{ctrl up}")  

; curses with the same horizontal position
$!#Up::Send("{ctrl down}{alt down}{Up}{alt up}{ctrl up}")
$!#Down::Send("{ctrl down}{alt down}{Down}{alt up}{ctrl up}") 

!BS::Send("{LShift down}{Home}{LShift Up}{Del}")  
#BS::Send("{LCtrl down}{BS}{LCtrl up}")  

!Del::Send("{LShift down}{Del}{LShift Up}{Del}")  
#Del::Send("{LCtrl down}{Del}{LCtrl up}")  

!Enter::Send("{ctrl down}{Enter}{ctrl up}")

$#Space::Send("{Ctrl Down}{LWin Down}{Space}{LWin Up}{Ctrl Up}")  

; interact with wheel

!WheelUp::Send("{ctrl down}{WheelUp}{ctrl up}")
!WheelDown::Send("{ctrl down}{WheelDown}{ctrl up}")
!LButton::Send("{ctrl down}{LButton}{ctrl up}")

; Shortcuts in explorer context  

#HotIf WinActive('ahk.exe explorer.exe')
	$!i::Send("!{Enter}") ; information
	$!o::Send("Enter") ; open directory
	$!u::Send("{F2}") ; rename

	!BS::Send("{Delete}") ; delete selected files/directories
#HotIf

$CapsLock::
{
    if (KeyWait("CapsLock", "T0.3") = 0) { ; Timeout, 长按 CapsLock，切换英文大小写
        if (GetKeyState("CapsLock", "T")) {
            SetCapsLockState(false)  ; 使用布尔值 false 表示关闭
        } else {
            SetCapsLockState(true)   ; 使用布尔值 true 表示开启
        }
        KeyWait("CapsLock")  ; 等待 CapsLock 被释放
    } else { ; 短按 CapsLock，发送 LShift 切换中英文输入法
        if (GetKeyState("CapsLock", "T")) {
            SetCapsLockState(false)
        } else {
            Send("{LShift}")
        }
    }
    return
}
