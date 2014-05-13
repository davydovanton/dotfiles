" Description: Functional Object Oriented goodies for Vim
" Author: José Otávio Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:class           = {}
let s:class.__super__ = 0
let s:class.__proto__ = {}

function! s:class.extend() dict abort "{{{
  let child = copy(self)
  let child.__super__ = self
  let child.__proto__ = copy(self.__proto__)
  lockvar child.__super__
  lockvar child.__proto__
  lockvar child.extend
  lockvar child.include
  lockvar child.new
  lockvar child.__super
  return child
endfunction
"}}}

function! s:class.include(prototype) dict abort "{{{
  unlockvar self.__proto__
  call extend(self.__proto__, a:prototype)
  lockvar self.__proto__
endfunction
"}}}

function! s:class.new(...) dict abort "{{{
  let instance = copy(self.__proto__)
  let instance.__class__ = self
  let instance.__super__ = self.__super__.__proto__
  lockvar instance.__super
  call call(instance.constructor, a:000, instance)
  return instance
endfunction
"}}}

function! s:class.__super(name, ...) dict abort "{{{
  if g:funcoo#util#module.isFunction(a:name)
    let Func = a:name
  else
    let Func = get(self.__super__, a:name)
  endif
  return call(Func, a:000, self)
endfunction
"}}}

let s:proto = {}
let s:proto.__super = s:class.__super

function! s:proto.constructor() dict abort "{{{
endfunction
"}}}

call s:class.include(s:proto)

let funcoo#object#class  = s:class

if !exists('funcoo_debug') || !funcoo_debug
  lockvar! funcoo#object#class
endif
