" Title: todos 
" Description: A plugin to manage TODOs in a vim friendly way
" Last Change:  Sept 27 2026
" Maintainer: https://github.com/Yahm3

function! todos#Time(...)
  if !exists("*strftime")
    return
  endif

  if a:0 > 0 && (a:1 ==# "d" || a:1 ==# "t")
    if a:1 ==# "d"
      echo strftime("%b %d")
    elseif a:1 ==# "t"
      echo strftime("%H %M")
    endif
  else
    echo strftime("%b %d %H:%M")
  endif
endfunction

function! todos#skip() abort
  let l:confiFile = getcwd() . "/.todos.config"
  let l:skipItemsList = []

  if filereadable(l:confiFile)
    let l:lines = readfile(l:confiFile)
    for l:line in l:lines
      let l:clean = trim(split(l:line, '"')[0])
      if !empty(l:clean)
        call add(l:skipItemsList, l:clean)
      endif
    endfor
  else
    return []
  endif

  return l:skipItemsList
endfunction

function! todos#ignore() abort
  let l:ignoreFile = getcwd() . "/.gitignore"
  let l:todosFile = "todos.txt"

  if filereadable(l:ignoreFile)
    let l:lines = readfile(l:ignoreFile)
    
    if index(l:lines, l:todosFile) == -1
      call inputsave()
      let l:writeChoice = input('Add todos.txt to .gitignore? (Y/N): ')
      call inputrestore()
      
      echo "\n" 

      if l:writeChoice =~? '^y$'
        if writefile([l:todosFile], l:ignoreFile, "a") == 0
          echo "todos.txt appended to .gitignore successfully!"
        else
          echo "Error: Failed to modify .gitignore file."
        endif
      else
        echo "Input cancelled."
      endif
    else
      echo "todos.txt is already in your .gitignore"
    endif

  else
    call inputsave()
    let l:createChoice = input('Create .gitignore file and add todos.txt? (Y/N): ')
    call inputrestore()
    echo "\n"

    if l:createChoice =~? '^y$'
      if writefile([l:todosFile], l:ignoreFile) == 0
        echo ".gitignore file with todos.txt generated successfully!"
      else
        echo "Error: Failed to write to file."
      endif
    else
      echo "Input cancelled."
    endif
  endif
endfunction

function! todos#Todo() abort
  let l:todofile = getcwd() . "/todos.txt"
  let l:skip_list = todos#skip()

  let l:save_wildignore = &wildignore

  for l:ignore_item in l:skip_list
    if l:ignore_item =~# '/$'
      let l:dir_name = substitute(l:ignore_item, '/$','','')
      execute 'set wildignore+=*/' . l:dir_name .'/*'
    else
      execute 'set wildignore+=' . l:ignore_item
    endif
  endfor

  silent! noautocmd vimgrep /\v(TODOO*|FIXMEE*)/j **/*

  let &l:wildignore = l:save_wildignore

  let l:qflist = getqflist()

  if empty(l:qflist)
    echo "No TODOs or FIXMEs found"
    return
  endif

  let l:parse_list = []
  for l:item in l:qflist
    let l:filename = bufname(l:item.bufnr)
    if l:filename  =~# 'todos\.txt$'
      continue
    endif

    let l:text  = trim(l:item.text)
    let l:match = matchstr(l:text, '\v(FIXMEE*|TODOO*)')

    let l:priority = 0
    if l:match =~# '^FIXME'
      let l:priority = 1000 + len(l:match)
    elseif l:match =~# '^TODO'
      let l:priority = 500 + len(l:match)
    endif

  call add(l:parse_list, {
          \ 'priority': l:priority,
          \ 'filename': l:filename,
          \ 'lnum'    : l:item.lnum,
          \ 'col'     : l:item.col,
          \ 'text'    : l:text
          \ })
  endfor

  ":NOTE: Sort the list descending based on priority score
  call sort(l:parse_list, {a, b -> b.priority - a.priority})
  let l:output = []
  for l:item in l:parse_list
    let l:line = printf("%s | %d:%d | %s", l:item.filename, l:item.lnum, l:item.col, l:item.text) 
    call add(l:output, l:line)
  endfor

  ":NOTE: Write to the file (overwrites if it exists, creates if it doesn't)
  call writefile(l:output, l:todofile)
  let l:bufnr = bufnr(l:todofile)
  if l:bufnr != -1
    execute 'checktime ' . l:bufnr
  endif
  echo "todos.txt generated successfully!"
endfunction

function! todos#Open()
  let l:todofile = getcwd() . "/todos.txt"
  if !filereadable(l:todofile)
    call todos#Todo()
  endif

  if !filereadable(l:todofile)
    call writefile([],l:todofile)
  endif
  execute 'edit ' . fnameescape(l:todofile)
  setlocal filetype=todos
endfunction

function! CheckBufExists(filename, lnum, col)
  if buflisted(a:filename)
    execute 'drop ' . fnameescape(a:filename)
  else
    execute 'tabedit ' . fnameescape(a:filename)
  endif
    call cursor(str2nr(a:lnum), str2nr(a:col))
endfunction

function! todos#GoTo() abort
  let l:line = getline('.')
  let l:parts = split(l:line, ' | ')

  if len(l:parts) >= 2
    let l:filename = l:parts[0]
    let l:pos = split(l:parts[1], ':')

    if len(l:pos) == 2
      let l:lnum = l:pos[0]
      let l:col = l:pos[1]
      call CheckBufExists(l:filename, l:lnum, l:col)
    endif
  else
    echo "Line could not be parsed"
  endif
endfunction

augroup TodosRefresh
  autocmd!
  ":NOTE: Trigger the refresh function every time a buffer is saved
  autocmd BufWritePost * call s:AutoUpdateTodos()
augroup END

function! s:AutoUpdateTodos()
  let l:todofile = getcwd() . "/todos.txt"
  let l:current_file = expand('%:p')

  if l:current_file ==# l:todofile
    return
  endif

  if filereadable(l:todofile)
    call todos#Todo()
    let l:bufnr = bufnr(l:todofile)
    if l:bufnr != -1
      silent! execute 'checktime ' . l:bufnr
    endif
  endif
endfunction
