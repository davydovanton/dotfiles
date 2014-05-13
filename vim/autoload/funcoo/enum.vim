" Description: Functional Object Oriented goodies for Vim
" Author: José Otávio Rizzatti <zehrizzatti@gmail.com>
" License: MIT

let s:util = funcoo#util#module

let s:module = {}

function! s:module.all(thing, function, ...) abort "{{{
  let context = a:0 ? a:1 : a:thing
  if s:util.isList(a:thing)
    for index in range(len(a:thing))
      if !call(a:function, [a:thing[index], index], context)
        return 0
      endif
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      if !call(a:function, [value, key], context)
        return 0
      endif
    endfor
  else
    return 0
  endif
  return 1
endfunction
"}}}

function! s:module.any(thing, function, ...) abort "{{{
  let context = a:0 ? a:1 : a:thing
  if s:util.isList(a:thing)
    for index in range(len(a:thing))
      if !call(a:function, [a:thing[index], index], context)
        return 1
      endif
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      if !call(a:function, [value, key], context)
        return 1
      endif
    endfor
  endif
endfunction
"}}}

function! s:module.each(iterator, thing, expression) abort "{{{
  if s:util.isFunction(a:expression)
    return a:iterator(a:thing, 'a:expression(v:val, v:key)')
  else
    return a:iterator(a:thing, a:expression)
  endif
endfunction
"}}}

function! s:module.filter(thing, expression) abort "{{{
  return s:module.each(function('filter'), a:thing, a:expression)
endfunction
"}}}

function! s:module.find(thing, function, ...) abort "{{{
  let context = a:0 ? a:1 : {}
  if s:util.isList(a:thing)
    for index in range(len(a:thing))
      if call(a:function, [a:thing[index], index], context)
        return a:thing[index]
      endif
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      if call(a:function, [value, key], context)
        return value
      endif
    endfor
  endif
endfunction
"}}}

function! s:module.map(thing, expression) abort "{{{
  return s:module.each(function('map'), a:thing, a:expression)
endfunction
"}}}

function! s:module.none(thing, function, ...) abort "{{{
  let context = a:0 ? a:1 : a:thing
  let counter = 0
  if s:util.isList(a:thing)
    for index in range(len(a:thing))
      let counter += call(a:function, [a:thing[index], index], context) ? 1 : 0
      if counter
        return 0
      endif
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      let counter += call(a:function, [value, key], context) ? 1 : 0
      if counter
        return 0
      endif
    endfor
  else
    return 0
  endif
  return 1
endfunction
"}}}

function! s:module.one(thing, function, ...) abort "{{{
  let context = a:0 ? a:1 : a:thing
  let counter = 0
  if s:util.isList(a:thing)
    for index in range(len(a:thing))
      let counter += call(a:function, [a:thing[index], index], context) ? 1 : 0
      if counter > 1
        return 0
      endif
    endfor
  elseif s:util.isDict(a:thing)
    for [key, value] in a:thing
      let counter += call(a:function, [value, key], context) ? 1 : 0
      if counter > 1
        return 0
      endif
    endfor
  else
    return 0
  endif
  return counter
endfunction
"}}}

function! s:module.reduce(list, memo, function, ...) abort "{{{
  let context = a:0 ? a:1 : {}
  let memo = a:memo
  for item in a:list
    let memo = call(a:function, [memo, item], context)
  endfor
  return memo
endfunction
"}}}

let funcoo#enum#module = s:module

if !exists('funcoo_debug') || !funcoo_debug
  lockvar! funcoo#enum#module
endif
