"=============================================================================
" FILE: necosyntax.vim (NCM source)
" AUTHOR:  Jia Sui <jsfaint@gmail.com>
" License: MIT license
"=============================================================================

let s:initialized = 0
function! cm#sources#necosyntax#refresh(opt, ctx)
  if !s:initialized
    call necosyntax#initialize()
    let s:initialized = 1
  endif

  let l:col = a:ctx['col']
  let l:typed = a:ctx['typed']

  let l:kw = matchstr(l:typed, '\w\+$')
  let l:kwlen = len(l:kw)

  let l:matches = necosyntax#gather_candidates()
  let l:startcol = l:col - l:kwlen

  call cm#complete(a:opt.name, a:ctx, l:startcol, l:matches)
endfunction
