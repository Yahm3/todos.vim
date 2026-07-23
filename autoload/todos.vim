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

function! todos#Todo() abort
  let l:todofile = getcwd() . "/todos.txt"

  silent! noautocmd vimgrep /\v(TODOO*|FIXMEE*)/j **/*
  let l:qflist = getqflist()
  if empty(l:qflist)
    echo "No TODOs or FIXMEs found"
    return
  endif

  let l:parse_list = []
  for l:item in l:qflist
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
          \ 'filename': bufname(l:item.bufnr),
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

  " :NOTE: Write to the file (overwrites if it exists, creates if it doesn't)
  call writefile(l:output, l:todofile)
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

function! todos#GoTo() abort
  let l:line = getline('.')

  let l:parts = split(l:line, ' | ')
  if len(l:parts) >= 2
    let l:filename = l:parts[0]
    let l:pos = split(l:parts[1], ':')

    if len(l:pos) == 2
      let l:lnum = l:pos[0]
      let l:col = l:pos[1]

      execute 'tabedit ' . fnameescape(l:filename)
      call cursor(str2nr(l:lnum), str2nr(l:col))
    endif
  else
    echo "Line could not be parsed"
  endif
endfunction
