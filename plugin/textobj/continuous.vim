if exists('g:loaded_textobj_continuous_line')
  finish
endif
let g:loaded_textobj_continuous_line = 1

let s:save_cpo = &cpo
set cpo&vim

call textobj#user#plugin('continuous', {
            \ '*no-default-key-mappings*' : {},
            \
            \ 'vim' : {
            \      'select-a' : 'av', '*select-a-function*': 'textobj#continuous#vim#select_a',
            \      'select-i' : 'iv', '*select-i-function*': 'textobj#continuous#vim#select_i',
            \   },
            \
            \ 'cpp' : {
            \      'select-a' : 'av', '*select-a-function*': 'textobj#continuous#cpp#select_a',
            \      'select-i' : 'iv', '*select-i-function*': 'textobj#continuous#cpp#select_i',
            \   },
            \ })

if ! exists('textobj_continuous_line_no_default_mappings')
    function! s:define_default_vim_mapping()
        omap <buffer>av <Plug>(textobj-continuous-vim-a)
        vmap <buffer>av <Plug>(textobj-continuous-vim-a)
        omap <buffer>iv <Plug>(textobj-continuous-vim-i)
        vmap <buffer>iv <Plug>(textobj-continuous-vim-i)
    endfunction

    function! s:define_default_cpp_mapping()
        omap <buffer>av <Plug>(textobj-continuous-cpp-a)
        vmap <buffer>av <Plug>(textobj-continuous-cpp-a)
        omap <buffer>iv <Plug>(textobj-continuous-cpp-i)
        vmap <buffer>iv <Plug>(textobj-continuous-cpp-i)
    endfunction

    augroup TextobjContinuousLineDefaultMapping
        autocmd!
        autocmd FileType vim          call <SID>define_default_vim_mapping()
        autocmd FileType c,cpp,sh,zsh call <SID>define_default_cpp_mapping()
    augroup END
endif

let &cpo = s:save_cpo
unlet s:save_cpo
