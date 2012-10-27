function! s:select(inner)
    normal! $

    if ! search('\%(^\|[^\\ \t]\)\s*$', 'bcW')
        return 0
    endif
    execute 'normal!' (a:inner ? 'j^' : 'j0')
    let begin = getpos('.')

    if ! search('\%(^\|[^\\ \t]\)\s*$', 'cW')
        return 0
    endif
    execute 'normal!' (a:inner ? '$' : 'j0')
    let end = getpos('.')

    return ['v', begin, end]
endfunction

function! textobj#continuous#cpp#select_a()
    return s:select(0)
endfunction

function! textobj#continuous#cpp#select_i()
    return s:select(1)
endfunction
