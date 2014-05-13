" Description: Functional Object Oriented goodies for Vim
" Author: José Otávio Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:class = funcoo#quickfixwindow#class.extend()
let s:proto = {}

function! s:proto.close() dict abort "{{{
  lclose
endfunction
"}}}

function! s:proto.open(...) dict abort "{{{
  let [force, prefix, height] = self._parse(a:000)
  let command = force ? 'lopen' : 'lwindow'
  execute prefix command height
  let current = g:funcoo#window#class.current()
  if (current.get('&buftype') ==# 'quickfix')
    let self.id = current.id
  endif
endfunction
"}}}

call s:class.include(s:proto)

let funcoo#locationwindow#class = s:class

if !exists('funcoo_debug') || !funcoo_debug
  lockvar! funcoo#locationwindow#class
endif
