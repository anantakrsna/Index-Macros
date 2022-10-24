; Copyright 2022 Adrian Eldridge (aka Ananta Krishna dasa)

; This program is free software: you can redistribute it and/or modify it under the 
; terms of the GNU General Public License as published by the Free Software Foundation, 
; either version 3 of the License, or (at your option) any later version.

; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
; See the GNU General Public License for more details.

; You should have received a copy of the GNU General Public License along with this program. 
; If not, see <https://www.gnu.org/licenses/>. 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Settings
v_doc_software = "foxit" 			; including embedding document. 
v_index_software = sky			; must by "cindex" or "sky" WITHOUT quotes
v_and_end = " and"
v_plural_end = "s"



;;;;;;;;;;
; Macros ;
;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;
; Macro To Do list ;
;;;;;;;;;;;;;;;;;;;;

; Simple copy paste to main

; Copy text to main Roman
^#c::
WinGet, v_source_id, ID, A
Send ^c
f_change_to_index_software()
f_create_new_record()
Send ^v{up}{down}
f_strip_formatting()
Send {Right}
return

; Copy text to main Roman + "s"
^+#c::
WinGet, v_source_id, ID, A
Send ^c
f_change_to_index_software()
f_create_new_record()
Send ^v{F2}s{up}{down}
f_strip_formatting()
Send {Right}
return


; Copy text to main italics
!#c::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, ^v{up}{down}
f_strip_formatting()
Send, {F2}^i{Right}
return

; Copy text to main italic plus "s"
!+#c::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, ^v{F2}s{up}{down}
f_strip_formatting()
Send, {F2}^i{Right}
return

; Pastes to subheads - Mainly for lists

	; Copy from pdf, pastes to subhead,
#^a::
SendInput, ^c
f_change_to_index_software()
f_create_new_record()
SendInput, {right}
SendInput, ^v{up}{down}
f_strip_formatting()
return

	; Copy from pdf, pastes to subhead adds "s",
#+a::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, {tab}
Send, ^v{F2}s{up}{down}
f_strip_formatting()
return


	; Copy from pdf, pastes to subhead, adds and
#!a::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, {tab}
Send, ^v{F2}{space}and
Send, {Up}
Send, {Down}
f_strip_formatting()
return

	; Copy from pdf, pastes to subhead, plural + and
#+!a::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, {tab}
Send, ^v{F2}s and{up}{down}
f_strip_formatting()
return


; Pastes to subheads - Roman

	; Copy from pdf, pastes to subhead,
#^s::
SendInput, ^c
f_change_to_index_software()
f_create_new_record()
SendInput, {right}
SendInput, ^v{up}{down}
f_strip_formatting()
Send, {F2}^i{F2}
return

	; Copy from pdf, pastes to subhead adds "s",
#+s::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, {tab}
Send, ^v{F2}s{up}{down}
f_strip_formatting()
Send, {F2}^i{F2}
return


	; Copy from pdf, pastes to subhead, adds and
#!s::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, {tab}
Send, ^v
f_strip_formatting()
Send, {F2}^i{F2}
Send {space}and
Send, {Up}
Send, {Down}
return

	; Copy from pdf, pastes to subhead, plural + and
#+!s::
WinGet, v_source_id, ID, A
Send, ^c
f_change_to_index_software()
f_create_new_record()
Send, {tab}
Send, ^v
f_strip_formatting()
Send, {F2}s ^iand{F2}
Send, {Up}
Send, {Down}
return


; Double Post but maintain last heading
#^d::
Send, {Home}
Send, {F4}^{F4}
return


; toggle italic on last word - mainly if and follows and 
#!f::
Send, {F2}
Send, {Shift Down}^{Left}{Shift Up}
Send, ^i
Send, {F2}
return

; books / inversions / names - Inversion happen for many reasons. 

	; invert last - used for names and general

		; Copy from pdf, invert last word and paste to index

		; Copy from pdf, invert last word and paste to index initials with dots

		; Copy from pdf, invert last word and paste to index initials without dots

		; As above but with list of names

	; Invert first - mainly for books without authors eg. The Bible. 

		; Copy from pdf, invert first word and paste to new main

	; with parentheses - books and general

		; Copy text to main add parentheses with curser within

		; as above, invert first word

		; as above but roman type in quotes

; Search/navigate pdf / text

	; Copy text from index and search pdf. Must work with italics and unicode

		; Maybe have two, one that starts from the beginning of the pdf and one that starts at the page

	; Find page of current index record, switch to pdf, go to page

	; Search for embedded id in index record, switch to embedding software, search for embedded tag/range in text editor or other software





; Functions to do list

	; change to preferred pdf/embedding document software - last instance used

	; xrefs clipboard to main


;;;;;;;;;;;;;;;
;; Functions ;;
;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Functions to standardize interface
; With different software packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Input to either return or not
f_return()
{
	global v_source_id
	input, v_input, V T10 E, {enter}{up}{down}
	if (ErrorLevel = "Timeout")
	{
		Sleep, 1
		return
	}
	if (ErrorLevel = "EndKey:Enter")
	{
		WinActivate ahk_id %v_source_id%
		return
	}
	if (ErrorLevel = "EndKey:Up")
	{
		Sleep 1
		return
	}
	if (ErrorLevel = "EndKey:Down")
	{
		Sleep 1
		return
	}
}


; change to preferred indexing software
f_change_to_index_software() {
	global v_index_software
	if (v_index_software = "sky") and (! WinExist("ahk_class ThunderRT6FormDC")) 
	{
		MsgBox Sky is not open. Please open Sky and your index file.
		return
	}
	else if (v_index_software = "sky") and (WinExist("ahk_class ThunderRT6FormDC"))
	{
		WinActivate
		return
	}
	if (v_index_software = "cindex") and (! WinExist("ahk_class cdx_frame$")) 
	{
		MsgBox Cindex is not open. Please open Cindex and your index file.
		return
	}
	else if (v_index_software = "cindex") and (WinExist("ahk_class cdx_frame$"))
	{
		WinActivate
		return
	}
	else 
	{
		MsgBox Set index_software variable to valid value.		
	}
}


; create new record in preferred indexing software

f_create_new_record() {
	global v_index_software
	if (v_index_software = "sky") 
	{
		Send {ctrl down}{;}{ctrlup}
		return
	}
	if (v_index_software = "cindex")
	{
		Send {ctrl down}k{ctrlup}
		return
	}
}

; Clean Text by pasting to WordPad.
f_clean_text() {
	global v_clean_text
	if (v_clean_text = "yes") and (! WinExist("ahk_class WordPadClass")) 
	{
		MsgBox Open WordPad
		Exit
	}
	else if (v_clean_text = "yes") and (WinExist("ahk_class WordPadClass")) 
	{
		WinActivate
		Sleep, 10
		Send ^v
		Send ^a
		Send ^c		
		return
	}
	else
	{
		Sleep, 10
		return
	}
}


; move to subheading from main in preferred indexing software
f_move_to_sub_from_main() {
	global v_index_software
	if (v_index_software = "sky") 
	{
		Send {tab}
		return
	}
	if (v_index_software = "cindex")
	{
		Send {tab}
		return
	}
}

; swap main and sub in preferred indexing software
f_swap_sub_and_main() { 	; Main must be selected
	global v_index_software
	if (v_index_software = "sky") 
	{
		Send {f4}{left}
		return
	}
	if (v_index_software = "cindex")
	{
		Send {ctrl down}{+}{ctrl up}
		return
	}
}



; complete/finalize record in preferred indexing software
f_finalize_record() {
	global v_index_software
	if (v_index_software = "sky") 
	{
		Send {up}{down}
		return
	}
	if (v_index_software = "cindex")
	{
		Send {ctrl down}k{ctrl up}
		return
	}
}


; Move to page
f_move_to_page() {
	global v_index_software
	if (v_index_software = "sky") 
	{
		Send {End}
		return
	}
	if (v_index_software = "cindex")
	{
		Send {End 4}
		return
	}
}

; Copy Page
f_copy_page() {
	global v_index_software
	if (v_index_software = "sky") 
	{
		Send {End}
		Send ^c
		return
	}
	if (v_index_software = "cindex")
	{
		Send {End 4}
		Send {Shift down}{Home}{Shift up}^c
		return
	}
}


; Strip formatting
f_strip_formatting() {
	global v_index_software
	if (v_index_software = "sky") 
	{
		Send {F2}
		Send ^!{F10}
		return
	}
	if (v_index_software = "cindex")
	{
		Send ^t
		return
	}
}

