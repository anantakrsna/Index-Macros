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
index_software = sky
index_suffix = " and"

^+e::
Change_index_software()
return

; Functions to do list

	; Identify current app - Used to return to app/document pasted from

	; Identify current app - Used to return to app/document pasted from

	; change to preferred pdf/embedding document software - last instance used

	; create new record in preferred indexing software

	; move to page in preferred indexing software

	; move to subheading in preferred indexing software

	; swap main and sub in preferred indexing software

	; complete/finalize record in preferred indexing software

	; xrefs clipboard to main


; Functions

; change to preferred indexing software

Change_index_software() {
	global index_software
	MsgBox %index_software%
	if (index_software = "sky") 
	{
		IfWinNotExist, ahk_class ThunderRT6FormDC
			MsgBox Sky is not open. Please open Sky and your index file.
		WinActivate ahk_class ThunderRT6FormDC
		return
	}
	else if (index_software = "cindex") 
	{
		IfWinNotExist, ahk_class cdx_frame
			MsgBox Cindex is not open. Please open Cindex and your index file.
		WinActivate ahk_class cdx_frame
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