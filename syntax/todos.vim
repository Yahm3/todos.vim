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

":NOTE: You can comment out the line below to use Bold display of TODO in the
"       todos.txt file, I just prefer a much visible display.
"
" highlight default link TodosTodo  Todo 
highlight TodosTodo ctermfg=0 ctermbg=226 guifg=#000000 guibg=#ffff00 gui=bold

let b:current_syntax = "todos"
