" Title: todos 
" Description: A plugin to manage TODOs in a vim friendly way
" Last Change:  Aug 11 2026
" Maintainer: https://github.com/Yahm3

if exists("g:loaded_todos")
  finish
endif

let g:loaded_todos = 1

command! -nargs=? Time call todos#Time(<q-args>)

command! TdGen     call todos#Todo()
command! TdOpen    call todos#Open()
command! TdIgnore  call todos#ignore()

nnoremap <silent> <Plug>(TodosTodo)   :<C-u>call todos#Todo()<CR>
nnoremap <silent> <Plug>(TodosOpen)   :<C-u>call todos#Open()<CR>
nnoremap <silent> <Plug>(TodosIgnore) :<C-u>call todos#ignore()<CR>

if !exists('g:todos_disable_mappings')
  if !hasmapto('<Plug>(TodosTodo)','n') && maparg('<leader>td','n') ==# ''
    nmap <leader>td <Plug>(TodosTodo)
  endif
  if !hasmapto('<Plug>(TodosOpen)','n') && maparg('<leader>tdo','n') ==# ''
    nmap <leader>tdo <Plug>(TodosOpen)
  endif
  if !hasmapto('<Plug>(TodosIgnore)','n') && maparg('<leader>tdi','n') ==# ''
    nmap <leader>tdi <Plug>(TodosIgnore)
  endif
endif

augroup TodosPlugin
  autocmd!
  autocmd  Filetype todos nnoremap <buffer> <silent> <CR> :call todos#GoTo()<CR>
augroup END
