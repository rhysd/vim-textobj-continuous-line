function! textobj#continuous#vim#select_a()
    let cur_line = getline('.')

    if empty(getline('.'))
        return 0
    endif

    let line = line('.')
    while line >= 1 && getline(line) =~# '^\s*\\'
        let line -= 1
    endwhile

    let head = getpos('.')
    let head[1] = line
    let head[2] = match(getline(line), '[^ \t]') + 1

    let line = line('.') + 1
    let last = line('$')
    while line <= last && getline(line) =~# '^\s*\\'
        let line += 1
    endwhile
    let line -= 1
    let tail = getpos('.')
    let tail[1] = line
    let tail[2] = len(getline(line))

    return ['v', head, tail]
endfunction

function! textobj#continuous#vim#select_i()
    return 0
endfunction
