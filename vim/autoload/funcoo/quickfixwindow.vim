" Description: Functional Object Oriented goodies for Vim
" Author: José Otávio Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:class = funcoo#window#class.extend()
let s:proto = {}

function! s:proto.constructor() dict abort "{{{
  let self.id = ''
endfunction
"}}}

function! s:proto.close() dict abort "{{{
  cclose
endfunction
"}}}

function! s:proto.open(...) dict abort "{{{
  let [force, prefix, height] = self._parse(a:000, 'botright')
  let command = force ? 'copen' : 'cwindow'
  execute prefix command height
  let current = g:funcoo#window#class.current()
  if (current.get('&buftype') ==# 'quickfix')
    let self.id = current.id
  endif
endfunction
"}}}

function! s:proto.title() dict abort "{{{
  let window = self.number()
  if window
    return self.get(window, 'quickfix_title')
  endif
endfunction
"}}}

function! s:proto.toggle(...) dict abort "{{{
  if self.number()
    call self.close()
  else
    call call(self.open, [1] + a:000, self)
  endif
endfunction
"}}}

function! s:proto._parse(args, ...) dict abort "{{{
  let force  = get(a:args, 0, 0)
  let prefix = get(a:args, 1, a:0 ? a:1 : '')
  let height = get(a:args, 2, 10)
  if g:funcoo#util#module.isNumber(prefix)
    let height = prefix
    let prefix = ''
  endif
  return [force, prefix, height]
endfunction
"}}}

call s:class.include(s:proto)

let funcoo#quickfixwindow#class = s:class

if !exists('funcoo_debug') || !funcoo_debug
  lockvar! funcoo#quickfixwindow#class
endif
