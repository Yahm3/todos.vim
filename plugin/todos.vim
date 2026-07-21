" Title: todos 
" Description: A plugin to manage TODOs in a vim friendly way
" Last Change:  Jul 21 2026
" Maintainer: https://github.com/Yahm3

if exists("g:loaded_todos")
  finish
endif

let g:loaded_todos = 1

command! -nargs=? Time call todos#Time(<q-args>)
