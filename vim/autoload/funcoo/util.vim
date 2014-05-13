" Description: Functional Object Oriented goodies for Vim
" Author: José Otávio Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:module = {}
let s:uuid = 0

function! s:module.echo(...) abort "{{{
  let matches = matchlist(a:1, '^\[\(\w\+\)\]$')
  redraw
  if len(matches)
    execute 'echohl' matches[1]
    echo join(a:000[1:])
    echohl None
  else
    echo join(a:000)
  endif
endfunction
"}}}

function! s:module.isDict(item) abort "{{{
  return type(a:item) == type({})
endfunction
"}}}

function! s:module.isFloat(item) abort "{{{
  return type(a:item) == type(0.0)
endfunction
"}}}

function! s:module.isFunction(item) abort "{{{
  return type(a:item) == type(function('tr'))
endfunction
"}}}

function! s:module.isList(item) abort "{{{
  return type(a:item) == type([])
endfunction
"}}}

function! s:module.isNumber(item) abort "{{{
  return type(a:item) == type(0)
endfunction
"}}}

function! s:module.isObject(item) abort "{{{
  return s:module.isDict(a:item) && exists('a:item["__super__"]')
endfunction
"}}}

function! s:module.isString(item) abort "{{{
  return type(a:item) == type('')
endfunction
"}}}

function! s:module.sandbox(function, args, ...) abort "{{{
  if !s:module.isFunction(a:function)
    return 0
  endif

  let context = get(a:000, 0, {})
  let Before  = get(a:000, 1, 0)
  let After   = get(a:000, 2, 0)
  let sandbox = {}
  if s:module.isFunction(Before)
    call call(Before, [sandbox], context)
  endif
  try
    let result = call(a:function, a:args, context)
  finally
    if s:module.isFunction(After)
      call call(After, [sandbox], context)
    endif
  endtry
  return result
endfunction
"}}}

function! s:module.uuid() abort "{{{
  let value = s:uuid
  let s:uuid += 1
  return value
endfunction
"}}}

let funcoo#util#module = s:module

if !exists('funcoo_debug') || !funcoo_debug
  lockvar! funcoo#util#module
endif
