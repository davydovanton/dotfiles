" Description: Functional Object Oriented goodies for Vim
" Author: José Otávio Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:module = {}

function! s:module.read(args) dict abort "{{{
  let plist = system("defaults read " . a:args)
  return self.parse(plist)
endfunction

function! s:module.parse(args) dict abort "{{{
  let value = a:args
  let value = substitute(value, '(', '[', 'g')
  let value = substitute(value, ')', ']', 'g')
  let value = substitute(value, '\(\h\+\) =', '"\1" :', 'g')
  let value = substitute(value, '\(\h\w*\);', '"\1";', 'g')
  let value = substitute(value, ';', ',', 'g')
  let value = substitute(value, '\\\\"', '\\"', 'g')
  return join(split(value, "\n"))
endfunction
"}}}

let funcoo#plist#module = s:module

if !exists('funcoo_debug') || !funcoo_debug
  lockvar! funcoo#plist#module
endif
