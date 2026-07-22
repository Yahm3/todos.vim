" Title: todos 
" Description: A plugin to manage TODOs in a vim friendly way
" Last Change:  Jul 21 2026
" Maintainer: https://github.com/Yahm3

if exists("g:loaded_todos")
  finish
endif

let g:loaded_todos = 1

command! -nargs=? Time call todos#Time(<q-args>)

command! TdGen   call todos#Todo()
command! TdOpen  call todos#Open()

nnoremap silent <Plug>(TodosTodo) :<C-u>call todos#Todo()<CR>
nnoremap silent <Plug>(TodosOpen) :<C-u>call todos#Open()<CR>

if exists('g:todos_disable_mappings')
  if !hasmapto('<Plug>(TodosTodo)','n') && maparg('<leader>td','n') ==# ''
    nmap <leader>tdo <Plug>(TodosOpen)
  endif
endif

augroup TodosPlugin
  autocmd!
  autocmd  BufRead,BufNewFile todos.txt nnoremap <buffer> <silent> <CR> :call todos#GoTo()<CR>
augroup END
