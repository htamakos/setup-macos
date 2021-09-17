" vim local
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#load_toml('~/.config/nvim/dein.toml')
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', { 'lazy': 1 })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Configuration
if(has("termguicolors"))
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
colorscheme tender
let g:airline_theme = 'tender'

filetype plugin indent on
syntax on
syntax enable
set termguicolors
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set number
set autoindent
set fenc=utf-8
set noswapfile
set autoread
set hidden
set showcmd
set cursorline
set cursorcolumn
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest

set ignorecase
set smartcase
set incsearch
set wrapscan

"" FileType
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType r setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType cpp setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType hpp setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType java setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascriptreact setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.gvy setfiletype groovy
autocmd BufNewFile,BufRead *.gradle setfiletype groovy
autocmd BufNewFile,BufRead *.ts setfiletype typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx setfiletype=typescript.tsx
autocmd BufNewFile,BufRead *.tf setfiletype=terraform
autocmd FocusGained,BufEnter * :checktime

"" Map Leader
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

"" Custom Key Mapping
nnoremap d "_d
xnoremap d "_d
vnoremap d "_d
nnoremap p "_dP
xnoremap p "_dP
vnoremap p "_dP
nnoremap x "_x
xnoremap x "_x
vnoremap x "_x
nnoremap ; :
nnoremap : ;
inoremap <silent> jj <ESC>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

nnoremap <space>e :CocCommand explorer<CR>
map <C-n> :CocCommand explorer<CR>

"" For Terminal Mode
tnoremap <Esc> <C-\><C-n>
tnoremap <silent> jj <C-\><C-n>

"" StartUp Command
autocmd VimEnter * :Tnew
autocmd VimEnter * :CocCommand explorer

"" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

set clipboard+=unnamedplus
vnoremap <leader>c :OSCYank<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
