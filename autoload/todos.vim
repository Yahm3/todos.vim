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
