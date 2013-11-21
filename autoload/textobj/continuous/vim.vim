function! s:select(inner)
    normal! $
    if ! search('^\s*\%([^\\ \t]\|$\)', 'bcW')
        return 0
    endif
    execute 'normal!' (a:inner ? '^' : '0')
    let begin = getpos('.')

    normal! j0
    if ! search('^\s*\%([^\\ \t]\|$\)', 'cW')
        return 0
    endif
    execute 'normal!' (a:inner ? 'k$' : '0')
    let end = getpos('.')

    return ['v', begin, end]
endfunction

function! textobj#continuous#vim#select_a()
    return s:select(0)
endfunction

function! textobj#continuous#vim#select_i()
    return s:select(1)
endfunction
