" Description: Functional Object Oriented goodies for Vim
" Author: José Otávio Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:class = funcoo#object#class.extend()

function! s:class.list() dict abort "{{{
  return range(1, winnr('$'))
endfunction
"}}}

function! s:class.find(function, ...) dict abort "{{{
  return call(g:funcoo#enum#module.find, [self.list(), a:function] + a:000, {})
endfunction
"}}}

function! s:class.get(number, variable) dict abort "{{{
  return getwinvar(a:number, a:variable)
endfunction
"}}}

function! s:class.set(number, variable, value) dict abort "{{{
  return setwinvar(a:number, a:variable, a:value)
endfunction
"}}}

function! s:class.current() dict abort "{{{
  return self.new(winnr())
endfunction
"}}}

let s:proto = {}

function! s:proto.constructor(number) dict abort "{{{
  let uuid = self.__class__.get(a:number, 'window_id')
  if empty(uuid)
    let self.id = g:funcoo#util#module.uuid()
    call self.__class__.set(a:number, 'window_id', self.id)
  else
    let self.id = uuid
  endif
endfunction
"}}}

function! s:proto.get(variable) dict abort "{{{
  return self.__class__.get(self.number(), a:variable)
endfunction
"}}}

function! s:proto.number() dict abort "{{{
  return self.__class__.find(s:protected.finder, self)
endfunction
"}}}

function! s:proto.set(variable, value) dict abort "{{{
  return self.__class__.set(self.number(), a:variable, a:value)
endfunction
"}}}

call s:class.include(s:proto)

let funcoo#window#class = s:class

let s:protected = {}

function! s:protected.finder(window, ...) abort "{{{
  return self.__class__.get(a:window, 'window_id') == self.id
endfunction
"}}}
