function! s:select(inner)
    normal! k
    if ! search('^\%(.*#.\+$\|.*[^\\]$\)', 'bcW')
        return 0
    endif
    execute 'normal! j' (a:inner ? '^' : '0')
    let begin = getpos('.')

    normal! 0
    if ! search('^\%(.*#.\+$\|.*[^\\]$\)', 'cW')
        return 0
    endif
    normal! $
    let end = getpos('.')

    return ['v', begin, end]
endfunction

function! textobj#continuous#python#select_a()
    return s:select(0)
endfunction

function! textobj#continuous#python#select_i()
    return s:select(1)
endfunction

