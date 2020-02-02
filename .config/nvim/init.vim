" -------
" OPTIONS
" -------
set foldenable
set foldmethod=indent "folding by indent
set foldlevel=99
set tabstop=4 shiftwidth=4 expandtab
set so=8
set mouse=a
set ignorecase
set smartcase
set clipboard=unnamedplus

" Display options
set noshowmode
set cmdheight=1
set showfulltag
set lazyredraw
set magic

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
" set matchpairs+=<:>

" Mappings
nnoremap tn :tabnew<Space>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap cl :close!<CR>


" Gui
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set cursorline
set nowrap
set background=light

" Show line numbers
set number
set numberwidth=1


" ----------------------
" HIGHLIGHT COLOR GROUPS
" ----------------------

" Lines and Numbers
highlight LineNr            ctermfg=008 guifg=008
highlight CursorLineNr      ctermfg=011 ctermbg=000 cterm=bold
highlight CursorLine        ctermbg=NONE cterm=bold 
highlight Visual            ctermbg=000 cterm=bold,reverse
highlight Search            ctermbg=000 cterm=bold,underline
" Gui
highlight VertSplit         ctermfg=008 ctermbg=000 cterm=bold
highlight TabLine           ctermfg=008 ctermbg=000 cterm=NONE
highlight TabLineFill       ctermbg=000 cterm=NONE



" -----------
" STATUSLINE
" -----------

" :h mode() to see all modes
let g:currentmode={
    \ 'n'      : 'NORMAL',
    \ 'no'     : 'N·Operator Pending',
    \ 'v'      : 'VISUAL',
    \ 'V'      : 'VISUAL LINE',
    \ '\<C-V>' : 'Visual B',
    \ 's'      : 'SELECT',
    \ 'S'      : 'SELECT LINE',
    \ '\<C-S>' : 'SELECT BLOCK',
    \ 'i'      : 'INSERT',
    \ 'R'      : 'REPLACE',
    \ 'Rv'     : 'V·REPLACE',
    \ 'c'      : 'COMMAND',
    \ 'cv'     : 'VIM EX',
    \ 'ce'     : 'EX',
    \ 'r'      : 'PROMPT',
    \ 'rm'     : 'MORE',
   \ 'r?'     : 'CONFIRM',
    \ '!'      : 'SHELL',
    \ 't'      : 'TERMINAL'
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    
  if (mode() =~# '\v(n|no)')
    exec 'hi! StatusLine ctermfg=000'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'Visual B' || get(g:currentmode, mode(), '') ==# 't')
    exec 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exec 'hi! StatusLine ctermfg=001'
  else
    exec 'hi! StatusLine ctermfg=006'
  endif
    
return ''

endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction


set laststatus=2
set statusline=
set statusline+=%0*                                         " Changing color
set statusline+=%{ChangeStatuslineColor()}                  " Changing the statusline color
set statusline+=▒▎%{g:currentmode[mode()]}▕▒                " Current mode
set statusline+=%2*                                         " Changing color
set statusline+=\ [%n]                                      " Buffer number
set statusline+=\ %<%F\ %{ReadOnly()}\ %m\ %w\              " File+path
set statusline+=%#warningmsg#                               " Warning messages
set statusline+=\ %=                                        " Go to right
set statusline+=%4*                                         " Changing color
set statusline+=▒▏%y                                        " FileType
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\       " Encoding & Fileformat
set statusline+=%-3(%{FileSize()}%)                         " File size
set statusline+=%1*                                         " Changing color
set statusline+=▏%l/%L\ c%3c\                                " Rownumber/total 

hi User1 ctermfg=005 cterm=bold,reverse 
hi User2 ctermfg=008 
hi User3 ctermfg=005
hi User4 ctermfg=008 cterm=reverse 
hi User5 ctermfg=008
hi User7 ctermfg=008
hi User8 ctermfg=008
hi User9 ctermfg=007

" -------------------------------------------------------------



" Encoding
set encoding=utf-8

let $NVIM_TUI_ENABLE_TRUE_COLOR=1



