if exists("b:current_syntax")
  finish
endif

syntax match TodosFilename /^.\{-}\ze\s*|/

syntax match TodosDelimiter /|/

syntax match TodosPosition /\d\+:\d\+/

syntax match TodosFixme /\vFIXMEE*/
syntax match TodosTodo /\vTODOO*/

highlight default link TodosFilename Directory
highlight default link TodosDelimiter Comment
highlight default link TodosPosition Number
highlight default link TodosFixme ErrorMsg
highlight default link TodosTodo WarningMsg

let b:current_syntax = "todos"
