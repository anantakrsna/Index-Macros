#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Settings

; Software

; Cleaning of diacritics required

; Switch to Sky
^+q::
IfWinNotExist, ahk_class ThunderRT6FormDC
	MsgBox Sky is not open. Please open Sky and your index file.
WinActivate ahk_class ThunderRT6FormDC
return

