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
doc_software = "foxit" 			; including embedding document. 
index_software = sky			; must by "cindex" or "sky" WITHOUT quotes
index_suffix = " and"

^+e::
finalize_record()
return


; Functions to do list

	; change to preferred pdf/embedding document software - last instance used

	; xrefs clipboard to main



;;;;;;;;;;;
; Functions
;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Functions to standardize interface
; With different software packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; change to preferred indexing software

Change_index_software() {
	global index_software
	if (index_software = "sky") and (! WinExist("ahk_class ThunderRT6FormDC")) 
	{
		MsgBox Sky is not open. Please open Sky and your index file.
		return
	}
	else if (index_software = "sky") and (WinExist("ahk_class ThunderRT6FormDC"))
	{
		WinActivate
		return
	}
	if (index_software = "cindex") and (! WinExist("ahk_class cdx_frame$")) 
	{
		MsgBox Cindex is not open. Please open Cindex and your index file.
		return
	}
	else if (index_software = "cindex") and (WinExist("ahk_class cdx_frame$"))
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

create_new_record() {
	global index_software
	if (index_software = "sky") 
	{
		Send {ctrl down}{;}{ctrlup}
		return
	}
	if (index_software = "cindex")
	{
		Send {ctrl down}k{ctrlup}
		return
	}
}

; move to subheading from main in preferred indexing software
Move_to_sub_from_main() {
	global index_software
	if (index_software = "sky") 
	{
		Send {tab}
		return
	}
	if (index_software = "cindex")
	{
		Send {tab}
		return
	}
}

; swap main and sub in preferred indexing software
Swap_sub_and_main() { 	; Main must be selected
	global index_software
	if (index_software = "sky") 
	{
		Send {f4}{left}
		return
	}
	if (index_software = "cindex")
	{
		Send {ctrl down}{+}{ctrl up}
		return
	}
}


; complete/finalize record in preferred indexing software
Finalize_record() {
	global index_software
	if (index_software = "sky") 
	{
		Send {down}{up}
		return
	}
	if (index_software = "cindex")
	{
		Send {ctrl down}k{ctrl up}
		return
	}
}


; Move to page
Move_to_page() {
	global index_software
	if (index_software = "sky") 
	{
		Send {down}{up}
		return
	}
	if (index_software = "cindex")
	{
		Send {ctrl down}k{ctrl up}
		return
	}
}




; Macros

	; Macro To Do list

		; Simple copy paste to main

			; Copy text to main and return

			; Copy text to main and return, strips formatting

			; Copy text to main and return, strips formatting adds italic (mainly to strip bold)

			; Copy text to main and stay	

			; Copy text to main and stay, strips formatting

			; Copy text to main and stay, strips formatting adds italic (mainly to strip bold)

		; Pastes to subheads

			; Copy from pdf, creates new record from previous main, pastes to subhead, returns to pdf on enter

			; Copy from pdf, creates new record from previous main, pastes to subhead, returns to pdf on enter - plural

			; Copy from pdf, creates new record from previous main, pastes to subhead, returns to pdf on enter - and

			; Copy from pdf, creates new record from previous main, pastes to subhead, returns to pdf on enter - plural + and

		; xrefs

			; Copy from pdf, creates new record from previous main, pastes to subhead, also creates xref from sub to main

			; Copy from pdf, creates new record from previous main, pastes to subhead, swaps to double post, ensures original main is still the the last main so lists can be done quickly

		; books / inversions / names - Inversion happen for many reasons. 

			; invert last - used for names and general

				; Copy from pdf, invert last word and paste to index, return to pdf

				; Copy from pdf, invert last word and paste to index, doesn't return to pdf

			; Invert first - mainly for books

				; Copy from pdf, invert first word and paste to index, return to pdf

				; Copy from pdf, invert first word and paste to index, doesn't return to pdf

			; No inversion but with parentheses - books and general

				; Copy text to main add parentheses wait for input, returns to pdf on enter

		; Search/navigate pdf / text

			; Copy text from index and search pdf. Must work with italics and unicode, preferrably highlight word in pdf/text editor,

				; Maybe have two, one that starts from the beginning of the pdf and one that starts at the page

			; Find page of current index record, switch to pdf, go to page

			; Search for embedded id in index record, switch to embedding software (text editor), search for embedded tag/range in text editor or other software


; Switch to Sky
^+q::
IfWinNotExist, ahk_class ThunderRT6FormDC
	MsgBox Sky is not open. Please open Sky and your index file.
WinActivate ahk_class ThunderRT6FormDC
return

; Copy from Foxit