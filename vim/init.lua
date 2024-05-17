vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

--------------------------------------------------------------------
------------  PLUGIN CONFIGS    ------------------------------------
--------------------------------------------------------------------


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'seoul256',
    component_separators = { left = ':', right = ':'},
    section_separators = { left = ' ', right = ' '},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}

--------------------------------------------------------------------
------------  SETTINGS CONFIGURATIONS  -----------------------------
--------------------------------------------------------------------


vim.g.markdown_fenced_languages = { 'javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff' }

vim.g.tube_terminal = "iterm"

-- vim.g.ruby_path = system('rvm current')

vim.g.bufExplorerDefaultHelp=0
vim.g.bufExplorerShowRelativePath=1
vim.g.bufExplorerSortBy='mru'
vim.g.bufExplorerSplitRight=0

vim.g.indentLine_color_term = 239
vim.g.indentLine_char = '¦'

vim.g.ruby_indent_access_modifier_style = 'outdent'
-- let ruby_operators = 1


vim.g.syntastic_enable_signs = 1
vim.g.syntastic_error_symbol = '✗'
vim.g.syntastic_warning_symbol = '⚠'
vim.g.syntastic_disabled_filetypes = { 'html', 'slim', 'erb', 'md' }

-- change log settings
vim.g.changelog_dateformat = "%c"
vim.g.changelog_timeformat = "%c"
vim.g.changelog_username = "Anton Davydov, <antondavydov.o@gmail.com>"

-- vim-slime
vim.g.slime_target = 'tmux'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'nv'

vim.opt.tags = ".git/tags"

-- vim.opt.iskeyword-=. " use dot for limiter word
-- vim.opt.iskeyword+=_
vim.opt.ttyfast = true -- u got a fast terminal
vim.opt.lazyredraw = true -- to avoid scrolling problems
vim.opt.synmaxcol = 200
vim.opt.hidden = true
vim.opt.ts = 2
vim.opt.sw = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.splitbelow = true -- new splits are down
vim.opt.splitright = true -- new vsplits are to the right
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.visualbell = true
vim.opt.showcmd = true
vim.opt.pastetoggle = ""
vim.opt.iminsert = 0
vim.opt.linebreak = true
vim.opt.completeopt = "longest,menuone"
vim.opt.wildmenu = true
vim.opt.tm = 500
vim.opt.swapfile = false
vim.opt.timeoutlen = 500
vim.opt.langmenu = "en_US.UTF-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- vim.opt.shm+=I                     -- Startup message is irritating
vim.opt.dictionary = "/usr/share/dict/words"

-- fold values
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 2

-- -- Time out on key codes but not mappings.
-- -- Basically this makes terminal Vim work sanely.
-- vim.opt.notimeout = ""
-- vim.opt.ttimeout = ""
-- vim.opt.ttimeoutlen = 10

--------------------------------------------------------------------
------------  KEY MAPPING  -----------------------------------------
--------------------------------------------------------------------

vim.opt.hlsearch = true
vim.keymap.set('n', '<leader>n', '<cmd>nohlsearch<CR>')

-- Disable Ex mode
vim.keymap.set('', 'Q', '<Nop>')

-- fix copy full string command, source: https://www.reddit.com/r/neovim/comments/petq61/neovim_060_y_not_yanking_line_but_to_end_of_line/
vim.keymap.set('n', 'Y', 'Y', { noremap = true})

vim.keymap.set('n', "<F1>", "<nop>", { noremap = true})

-- vim.keymap.set('n', "j", "g",  { noremap = true})
-- vim.keymap.set('n', "k", "gk", { noremap = true})
-- vim.keymap.set('v', "j", "g",  { noremap = true})
-- vim.keymap.set('v', "k", "gk", { noremap = true})
-- vim.keymap.set('n', "gj", "k", { noremap = true})
-- vim.keymap.set('n', "gk", "k", { noremap = true})
-- vim.keymap.set('v', "gj", "k", { noremap = true})
-- vim.keymap.set('v', "gk", "k", { noremap = true})
 
-- Quicker window movement
vim.keymap.set('n', "<C-h>", "<C-w>h", { noremap = true})
vim.keymap.set('n', "<C-j>", "<C-w>j", { noremap = true})
vim.keymap.set('n', "<C-k>", "<C-w>k", { noremap = true})
vim.keymap.set('n', "<C-l>", "<C-w>l", { noremap = true})
 
-- Tabulating strings mapping
vim.keymap.set('n', "<tab>",   ">>", { noremap = true})
vim.keymap.set('n', "<s-tab>", "<<", { noremap = true})
vim.keymap.set('v', "<tab>",   ">>", { noremap = true})
vim.keymap.set('v', "<s-tab>", "<<", { noremap = true})

-- Tabs mapping
vim.keymap.set('n', "th", ":tabfirst<CR>", { noremap = true})
vim.keymap.set('n', "tj", ":tabprev<CR>",  { noremap = true})
vim.keymap.set('n', "tk", ":tabnext<CR>",  { noremap = true})
vim.keymap.set('n', "tl", ":tablast<CR>",  { noremap = true})
vim.keymap.set('n', "td", ":tabclose<CR>", { noremap = true})
vim.keymap.set('n', "tn", ":tabnew<CR>",   { noremap = true})


vim.keymap.set('n', "Q", "<nop>", { noremap = true})
vim.keymap.set('n', "K", "<nop>", { noremap = true})

vim.keymap.set('n', "<leader>o", "o<ESC>")
vim.keymap.set('n', "<leader>O", "o<ESC>j")

-- " nmap <leader>hh :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>
-- vim.keymap.set('n', "<leader>hh", ":%s/:([^ ]*)(\s*)=>/\1:/g<CR>")
































vim.cmd([[

" source ~/.nvimrc

filetype off     " required

let g:surround_{char2nr('%')} = "%(\r)"
let g:surround_{char2nr('w')} = "%w(\r)"
let g:surround_{char2nr('#')} = "#{\r}"
let g:surround_{char2nr('|')} = "|\r|"


" Load plugins and indentation for file types
if has('autocmd')
  filetype indent plugin on

  " Shortcuts to quickly switch to common file types; handy when using
  " editing abstractions like sudoedit(8)
  nnoremap _cs :setlocal filetype=css<CR>
  nnoremap _ht :setlocal filetype=html<CR>
  nnoremap _sl :setlocal filetype=slim<CR>
  nnoremap _js :setlocal filetype=javascript<CR>
  nnoremap _md :setlocal filetype=markdown<CR>
  nnoremap _rb :setlocal filetype=ruby<CR>
  nnoremap _sh :setlocal filetype=sh<CR>
  nnoremap _vi :setlocal filetype=vim<CR>
endif

" Color Scheme
set guifont=Droid\ Sans\ Mono\ 12
" let g:seoul257_background = 236
" colo seoul256
" colo iceberg
colo nofrils-dark
" colo ddd

syntax on

if executable('zsh')
  set shell=zsh
endif

language mes en_US.UTF-8


" ruby xmpfilter
autocmd FileType ruby nmap <buffer> <F5> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <F5> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <F5> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <F4> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <F4> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <F4> <Plug>(xmpfilter-run)

let g:rct_completion_use_fri = 1

cabbrev CSScomb :!csscomb %:p<CR>
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))


" bind K to grep word under cursor
nnoremap <leader>f :grep! "\b<C-R><C-W>\b" --ignore-dir log<CR>:cw<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

function! ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyz0123456789'
  let i=0
  while (i<strlen(regs))
    exec 'let @'.regs[i].'=""'
    let i=i+1
  endwhile
endfunction
command! ClearRegisters call ClearRegisters()

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" rename current file (thanks Gary Bernhardt)
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
command! RENAME call RenameFile()

" change CamlCase to under_scores
function! ToUnderScores() range
  s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
endfunction
noremap <leader>cc :call ToUnderScores()<CR>

" change under_scores to CamlCase
function! ToCamlCase() range
  s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g
endfunction
noremap <leader>cC :call ToCamlCase()<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.md set filetype=markdown
endif

autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd Filetype gitcommit  setlocal spell textwidth=72

au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

" Turn on spell-checking in markdown and text.
" au BufRead,BufNewFile *.md,*.txt setlocal spell

" Neovim confixg
if has('nvim')
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <Esc> <c-\><c-n>
  tnoremap <C-[> <c-\><c-n>

  highlight TermCursor ctermfg=red guifg=red
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

autocmd BufWritePost * set iskeyword-=.
autocmd BufWritePost * set clipboard=unnamed
autocmd BufWritePost * set path+=**

set iskeyword-=. " use dot for limiter word
set iskeyword+=_
set path+=**
set clipboard=unnamed

"------------- any-jump.vim ------------------------------
let g:any_jump_search_prefered_engine = 'ag'
let g:any_jump_grouping_enabled = 0
let g:any_jump_preview_lines_count = 10
let g:any_jump_window_width_ratio  = 0.7
let g:any_jump_ignored_files = ['*.tmp', '*.temp', '*.log']
" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Normal",
      \"preview":            "Operator",
      \"preview_keyword":    "Directory",
      \"heading_text":       "StatusLineNC",
      \"heading_keyword":    "StatusLineNC",
      \"group_text":         "Operator",
      \"group_name":         "ErrorMsg",
      \"more_button":        "Operator",
      \"more_explain":       "Operator",
      \"result_line_number": "ErrorMsg",
      \"result_text":        "Statement",
      \"result_path":        "ErrorMsg",
      \"help":               "StatusLineNC"
      \}

]])

