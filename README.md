# Index-Macros

The intent of this project is to create a set of macros for indexing. 

I am a Sky user so macros will initially be built for Sky. Other software may later be included. 

They will be built using AutoHotKey which is open source software which can be found at [here.](https://www.autohotkey.com/)

Adrian (aka Ananta Krishna dasa)

## Installation

Install Autohotkey from their website.

Download the index-macro.ahk.

Run index-macro.ahk.

The script can be edited with a text editor.

## Usage

| Hotkey | Description |
| --- | --- |
| Win+Ctrl+c | Copy text to main Roman |
| Win+Ctrl+Shift+c | Copy text to main Roman plural |
| Win+Alt+c | Copy text with italic |
| Win+Alt+Shift+c | Copy text to main italic plural |
| --- | ---- |
| Win+Ctrl+a | Copy to sub, Roman |
| Win+Shift+a | Copy to sub, Roman, plural |
| Win+Shift+a | Copy to sub, Roman, plus "and" |
| Win+Shift+alt+a | Copy to sub, Roman, plural and "and" |
| --- | ---- |
| Win+Ctrl+s | Copy to sub, Italic |
| Win+Shift+s | Copy to sub, Italic, plural |
| Win+Shift+s | Copy to sub, Italic, plus "and" |
| Win+Shift+alt+s | Copy to sub, Italic, plural and "and" |
| --- | ---- |
| Win+Ctrl+d | Double post but keep the original main as the last record.|
|---|----|
|Win+Ctrl+n|Invert last word and paste to main. Mainly for names.|
|Win+Alt+n|Invert last word, other words as initials with a dot.|
|Win+Shift+n|Invert last word, other words as initials without a dot.|
|---|----|
|Win+Ctrl+b|Copy text to main as roman, adds parentheses with curser within|
|Win+Ctrl+Alt+b|Copy text to main as italic, adds parentheses with curser within|
|---|----|
|Win+Ctrl+f|search for highlighted text in the pdf|
|Win+Ctrl+Shift+f|Search for highlighted text from start of pdf|
|Win+Alt+f|search for highlighted text in the pdf after pasting into Wordpad. For difficult diacritics from Sky.|
|Win+Alt+Shift+f|Search for highlighted text from start of pdf after pasting into Wordpad. For difficult diacritics from Sky.|
|Win+Ctrl+g|Go to page in pdf of the current record.|

## PDF or Indexing software choice

Open the script in a text editor
change "v_doc_software = foxit" or "v_index_software = sky" to the correct values. Currently only Acrobat or Foxit and Sky or Cindex.


## Known issues

I found it buggy on my Windows 10 laptop but it works fine on my Windows 11 desktop. Don't know why. So please test with a test index and watch the results while using. 

Problems may occur if a record is still being edited. 

Most functions probably won't work with Cindex. 


