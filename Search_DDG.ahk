#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Example: ListBox containing files in a directory:

Gui, Add, Text,, Search in the following sites.`nTo cancel press ESC or close the window.
Gui, Add, ListBox, vMyListBox gMyListBox w300 r7
Gui, Add, Text,, Write here what you want to SEARCH.
Gui, Add, Edit, r1 vMyEdit w300

Gui, Add, Button, x10 y190 w40 Default, OK
Gui, Add, Button, x70 y190 , Cancel

GuiControl, +AltSubmit, MyListBox

GuiControl, , MyListBox, DuckDuckGo

GuiControl, , MyListBox, Google Scholar

GuiControl, , MyListBox, Google

GuiControl, , MyListBox, Yahoo

GuiControl, , MyListBox, Bing

GuiControl, , MyListBox, Youtube

GuiControl, , MyListBox, Word Definition

GuiControl, Choose, MyListBox, 1

Gui, Show

MyListBox:
if A_GuiEvent <> DoubleClick
return
ButtonOK:
GuiControlGet, MyListBox  ; Retrieve the ListBox's current selection.
Gui, Submit , NoHide
If (MyListBox == 1)
{
	Gui, Submit , NoHide
	Run https://duckduckgo.com/?q=%MyEdit%
}
If (MyListBox == 2)
{
	Gui, Submit , NoHide
	Run https://duckduckgo.com/?q=!scholar+%MyEdit%
}
If (MyListBox == 3)
{
	Gui, Submit , NoHide
	Run https://duckduckgo.com/?q=!g+%MyEdit%
}
If (MyListBox == 4)
{
	Gui, Submit , NoHide
	Run https://duckduckgo.com/?q=!Y+%MyEdit%
}
If (MyListBox == 5)
{
	Gui, Submit , NoHide
	Run https://duckduckgo.com/?q=!B+%MyEdit%
}
If (MyListBox == 6)
{
	Gui, Submit , NoHide
	Run https://duckduckgo.com/?q=!YT+%MyEdit%
}
If (MyListBox == 7)
{
	Gui, Submit , NoHide
	Run https://duckduckgo.com/?q=%MyEdit%&ia=definition

}
if ErrorLevel = ERROR
    MsgBox Try something else.
return
GuiClose:
GuiEscape:
ExitApp
ButtonCancel:
ExitApp  
