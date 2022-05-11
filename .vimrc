" Automatically install the plugin manager if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins {{{
call plug#begin('~/.vim/plugged')
" Productivity
" JIRA {{{
  """ Plug 'paulkass/jira-vim'
  Plug 'n0v1c3/vira', { 'do': './install.sh', 'branch': 'VIRA-247' }  " JIRA integration
  Plug 'ActivityWatch/aw-watcher-vim'     " Track keyboard usage
" }}} JIRA
" TaskWarrior {{{
  " Plug 'blindFS/vim-taskwarrior'          " TaskWarrior todo list manager
" }}} TaskWarrior

Plug 'liuchengxu/vim-which-key'       " Vim mapping, and its on-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Quake term
Plug 'bag-man/nuake'    " Quake term

" TMP: Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
Plug 'pbogut/fzf-mru.vim'
Plug 'qpkorr/vim-bufkill'

" Git related
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'airblade/vim-gitgutter'           " Show sign on the left side when the line has been modified
Plug 'tpope/vim-rhubarb'                " To use :Gbrowse (open commit in GitHub)
Plug 'rhysd/git-messenger.vim'          " To show git commit message under the cursor

" Utilities
" Plug 'roxma/nvim-yarp'                  " Yet Another Remote Plugin Framework for Neovim (used for ncm2 and deoplete.nvim)
" Plug 'brooth/far.vim'                   " Find and replace
Plug 'romainl/vim-qf'                   " Advanced quickfix behavior (skip to next filename {/}; :Keep, :Reject and :Restore entries funnel - works with quickfix-reflector.vim)
Plug 'stefandtw/quickfix-reflector.vim' " Edit the quickfix list (find and replace with rg/fzf)
Plug 'matze/vim-move'                   " Move lines up and down
Plug 'yaroot/vissort'                   " DrChip's Visual block based sorting
Plug 'ConradIrwin/vim-bracketed-paste'  " Detect clipboard paste (auto :set paste!)
" Plug 'jremmen/vim-ripgrep'              " Use ripgrep for search - deprecated in favor of vim-grepper
" temporarily until merged to mhinz/vim-grepper
Plug 'trsdln/vim-grepper'                " grep using your fav grepper
Plug 'majutsushi/tagbar'                " Tagbar (right side thing to show functions)
Plug 'mbbill/undotree'                  " The undo history visualizer for VIM
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-commentary'             " :Commentary to comment out a line or block
" autocomplete window with escape
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-sensible'
Plug 'sukima/xmledit'
Plug 'mboughaba/i3config.vim'
" Plug 'SidOfc/mkdx'                      " Markdown plugin
Plug 'chmp/mdnav'                     " Follow markdown links
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'sulibo/vim-jekyll'                " Jekyll plugin
Plug 'junegunn/vim-peekaboo'            " sneak peak preview of registers on @ and "
Plug 'mhinz/vim-startify'               " Start screen for vim
" Plug 'ncm2/ncm2'                        " nvim-completion-manager
" Plug 'svermeulen/vim-yoink'             " clipboard history manager (buffer yankring)
" Plug 'svermeulen/ncm2-yoink'            " clipboard history manager ncm2 completion

" Tools {{{
Plug 'soywod/himalaya', {'rtp': 'vim'}
" }}} Tools

" Network (API)
Plug 'diepm/vim-rest-console'           " Use vim as postman
" Firefox integration
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Programming {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neomake/neomake'                  " asynchronously run programs (autolint)
Plug 'leafgarland/typescript-vim'       " typescript syntax and indenting for vim
Plug 'tmhedberg/SimpylFold'             " Python folding for vim
Plug 'eliba2/vim-node-inspect'          " NodeJS interactive debugger
" using platformio (`pio project init --ide vim --board esp32dev`)
" Plug 'stevearc/vim-arduino'             " Arduino build and upload sketch
Plug 'AndrewRadev/splitjoin.vim'        " Split one-liner to multiple lines and back
Plug 'ray-x/lsp_signature.nvim'         " Show function signature, highlight parameters as you type

" Programming - coc.nvim
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'} " TSC

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " vim DOcumentation GEnerator <leader>d
" }}} Programming

" Database {{{
Plug 'tpope/vim-dadbod'                     " Database interaction
Plug 'kristijanhusak/vim-dadbod-ui'         " Database interaction UI
Plug 'kristijanhusak/vim-dadbod-completion' " Intellisense for dadbod
Plug 'jsborjesson/vim-uppercase-sql'        " Uppercase SQL keywords in filetype sql
" }}} database

" DevOps {{{
Plug 'danihodovic/vim-ansible-vault'    " AnsibleVault encrypt/decrypt file
" }}} DevOps

" LiveCoding {{{
Plug 'tidalcycles/vim-tidal'            " Tidal Cycles Vim plugin - https://roosnaflak.com/tech-and-research/install-tidal-cycles-on-arch-linux/
" }}} LiveCoding

" Appearance
Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'
Plug 'unblevable/quick-scope'                                      " Highlight jump characters - slows (unless only on f/F trigger) down vim considerably
Plug 'machakann/vim-highlightedyank'                               " Highlight yanked region
Plug 'godlygeek/csapprox'                                          " make gvim-only colorschemes work in terminal vim
Plug 'joshdick/onedark.vim'                                        " Colorscheme onedark
Plug 'morhetz/gruvbox'                                             " Colorscheme gruvbox (can be light)
Plug 'maricn/vim-snazzy'                                           " Colorscheme snazzy (colorful) (maricn forked to add coc.nvim highlights)
Plug 'nanotech/jellybeans.vim'                                     " Colorscheme jellybeans
Plug 'breuckelen/vim-resize'                                       " Use Ctrl+arrows to resize splits
" Plug 'chrisbra/Colorizer'                                          " Show hex codes as colours
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }          " Show hex codes as colours - async
" Plug 'vheon/vim-cursormode'           " Color cursor based on the mode - working only on iTerm2
" Plug 'Townk/vim-autoclose' " perhaps is conflicting when closing
" Plug 'udalov/kotlin-vim'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'TaDaa/vimade'                                               " Fade vim buffers that are not in focus
call plug#end()
" Buffers and files
" }}} Load plugins

" Basic settings {{{
" Use :help <option> to see the docs
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set foldmethod=syntax
set nowrap
set incsearch
set ignorecase
set smartcase
set mouse=a
set hidden
set wildmode=list:longest
set number relativenumber
set title
set ruler
set nospell
set spelllang=en_gb " just in case i change my mind to turn on spelling
set updatetime=300
set cursorline
set cursorcolumn
" let's try fixing colors on nvim
if !has('nvim')
  set termguicolors!
endif
let g:python3_host_prog="/usr/bin/python3"

" supposed to fix slowness caused by vim-nerdtree-syntax-highlight
set lazyredraw
set wildignore=*/node_modules/*
" }}} Basic settings

" mapping for paste (so that overwriting visual selection doesn't pick up the
" overwritten text into the buffer, but just paste over it)
xnoremap p "_dP

autocmd vimenter * :AWStart

" Customize view {{{
  syntax on
  " Sakura supports TRUECOLOR, so no need to revert to 256
  " set t_Co=256
  " set t_ut=

  " themes {{{
    autocmd vimenter * colorscheme snazzy
    " autocmd vimenter * colorscheme gruvbox

    " gruvbox {{{
      " autocmd vimenter * colorscheme gruvbox
      " set background=light
      " let g:gruvbox_contrast_dark = 'soft'
      " let g:gruvbox_contrast_light = 'hard'
    " }}} gruvbox

    " fix for Coc diagnostic signs color mismatch
    autocmd ColorScheme * 
            \ hi CocErrorSign  ctermfg=Red guifg=#ff0000 | 
            \ hi CocWarningSign  ctermfg=Brown guifg=#ff922b |
            \ hi CocInfoSign  ctermfg=Yellow guifg=#fab005 |
            \ hi CocHintSign  ctermfg=Blue guifg=#15aabf |
            \ hi CocUnderline  cterm=underline gui=underline
    " highlight quickfix line
    hi QuickFixLine cterm=None ctermbg=black guibg=#ffff00
 
    " set guicursor=a:blinkon0        " insert mode: vertical block
    " set guicursor+=i:hor1-blinkon0  " all modes: turn on blinking

    " mode aware cursors
    set gcr=a:blinkon1
    set gcr+=o:hor50-Cursor
    set gcr+=n:Cursor
    set gcr+=i-ci-sm:InsertCursor-ver1
    set gcr+=r-cr:ReplaceCursor-hor20
    set gcr+=c:CommandCursor
    set gcr+=v-ve:VisualCursor-ver1
  " }}} themes

  " " Kitty {{{
  "   " (should be after applying theme)
  "   set termguicolors
  "   set t_ut=''
  "   " General colors
  "   if has('gui_running') || has('nvim') 
  "       hi Normal 		guifg=#ebdbb2 guibg=#282828 
  "   else
  "       " Set the terminal default background and foreground colors, thereby
  "       " improving performance by not needing to set these colors on empty cells.
  "       hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  "       let &t_ti = &t_ti . "\033]10;#ebdbb2\007\033]11;#282828\007"
  "       let &t_te = &t_te . "\033]110\007\033]111\007"
  "   endif
  " " }}} Kitty
" }}} Customize views
  
" Key remaps {{{
"" Key remaps -----------------
noremap <silent> <F2> :CocCommand explorer<CR>
:nnoremap <F5> "=strftime("%FT%T%z")<CR>P
:inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>

" <F8> to toggle highlight on the word under the cursor
:nnoremap <silent> <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls! hlsearch?<CR>
" escape will turn off highlight
:nnoremap <silent> <esc> :nohlsearch<CR><esc>
" escape will exit terminal mode - clashes with open buffer/MRU floating
" window, as that also seems to be of "terminal" type
" :tnoremap <silent> <esc> <C-\><C-n>

" Movement and manipulation remaps
nnoremap Y y$
map H ^
map L $

" append newline w/o exiting normal mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" duplicate selection
vmap <c-d> y'>p

" leader
:let mapleader = ','
:nmap \ ,

""" Usability -----------------
"""" \s is for word substitute
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" fugitive {{{
  function! s:BlameToggle() abort
    let found = 0
    for winnr in range(1, winnr('$'))
      if getbufvar(winbufnr(winnr), '&filetype') ==# 'fugitiveblame'
        exe winnr . 'close'
        let found = 1
      endif
    endfor
    if !found
      Git blame
    endif
  endfunction

nmap <silent> <C-B> :call <SID>BlameToggle()<CR>
let g:fugitive_summary_format = '%s (%cr) <%an>'
" }}}

" git-messenger {{{
  " Disable default mappings bc <leader>gm makes our <leader>g (rg search)
  " wait for second key input
  let g:git_messenger_no_default_mappings = v:true

  " Use <leader>hh similar to <leader>hp for preview head diff
  nnoremap <leader>hh :GitMessenger<cr>

  " Cursor gets in the popup immediately
  " use oO to navigate history, dD for diff, q to close popup
  let g:git_messenger_always_into_popup = v:true
" }}} git-messenger

" peekaboo {{{
  function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
 
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
  endfunction
  let g:peekaboo_window="call CreateCenteredFloatingWindow()"
" }}}

" coc.nvim {{{
  nnoremap <leader>c :CocAction<CR>
  
  " Give more space for displaying messages.
  set cmdheight=2
  
  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=250
  
  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c
  
  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes
  
  let g:coc_disable_transparent_cursor = 1
  au FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'venv2', 'venv3', '.venv2', '.venv3', 'setup.cfg', 'setup.py', 'pyrightconfig.json']
  
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  " " use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  
  " Use <c-space> to trigger completion.
  " inoremap <silent><expr> <c-space> coc#refresh()
  
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use <C-j> and <C-k> to navigate the completion list
  " https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-and-s-tab-to-navigate-the-completion-list
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
  
  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  
  " GoTo code navigation.
  nmap <silent> gd :call CocAction('jumpDefinition', v:false)<CR>
  " nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi :call CocAction('jumpImplementation', v:false)<CR>
  " nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  
  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  
  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)
  
  " Formatting selected code.
  xmap <leader>f  :Format<CR>
  nmap <leader>f  :Format<CR>
  " nmap <leader>f <Plug>(coc-format-selected)
  " xmap <leader>f <Plug>(coc-format-selected)
  " vmap <leader>f <Plug>(coc-format-selected)
  
  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json,jsonc setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  
  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)
  
  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  " Disabled to make <leader>q (smart delete buffer) work faster
  " nmap <leader>qf  <Plug>(coc-fix-current)
  
  """" Enter just selects the item in the autocomplete menu
  """" http://vim.wikia.com/wiki/VimTip1386
  :inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  """ Map Ctrl+Space to autocomplete
  """ https://coderwall.com/p/cl6cpq/vim-ctrl-space-omni-keyword-completion
  " inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  "             \ "\<lt>C-n>" :
  "             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  "             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  "             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
  " hm, what's this for: imap <C-@> <C-Space>
  
  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  
  autocmd VimEnter * :unmap <leader>ge
  
  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')
  
  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
  " not enabled because it doesn't respect tsconfig ordering of imports
  " autocmd BufWritePre typescript :OR
  
  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  " Pretend netrw is already opened so it doesn't open automatically
  " let g:loaded_netrw = 1
  let g:loaded_netrwPlugin = 1
  " But reimplement `gx` from original netrw (open link)
  nmap gx :!xdg-open <c-r><c-a>

  " Autoload coc-explorer (it has a delay, so I prefer not to use it)
  " augroup MyCocExplorer
  "   autocmd!
  "   autocmd VimEnter * sil! au! FileExplorer *
  "   autocmd BufEnter * let d = expand('%') | if isdirectory(d) | silent! bd | exe 'CocCommand explorer ' . d | endif
  " augroup END
" }}} coc.nvim

"""" CamelCase motion
let g:camelcasemotion_key = '<leader>'

""" Navigation ----------------
" CtrlP - go to definition {{{
  let g:ctrlp_map = '<C-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|lib|vendor|coverage|lcov-report|researchtag|webBasedPortal)|(\.(swp|ico|git|svn))$'
"  noremap <leader>pp <ESC>:CtrlPRoot<CR>
"  noremap <leader>pb <ESC>:CtrlPBuffer<CR>
"  noremap <leader>pt <ESC>:CtrlPMRUFiles<CR>
"  noremap <leader>pm <ESC>:CtrlPMRUFiles<CR>
"  noremap <leader>m <ESC>:CtrlPMRUFiles<CR>
"  noremap <leader>po <ESC>:CtrlPChangeAll<CR>
"  noremap <leader>pgi <ESC>:CtrlPChangeAll<CR>
"  noremap <leader>pc <ESC>:CtrlPClearAllCaches<CR>
" }}}

" terminal register pasting on Alt+reg_name {{{
  if has('nvim')
    tnoremap <expr> <M-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  endif
" }}}

" fzf {{{
  let $FZF_DEFAULT_COMMAND="fd --type f"
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
  nnoremap <silent> <leader>. :Files<CR>
  nnoremap <silent> <leader><space> :Buffers<CR>
  " m stands for MRU files
  nnoremap <silent> <leader>m :FZFMru<CR>
  let g:fzf_mru_relative = 1
  " nnoremap <silent> <leader>m :FilesMru<CR>
  " Ctrl+F find in current file
  nnoremap <silent> <C-F>l :Lines<CR>
  nnoremap <silent> <C-F>b :BLines<CR>
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings -S --no-ignore-vcs --hidden --follow --glob "!{**/__pycache__,**/node_modules,**/.git,**/*.pyc,**/venv/lib,**/coverage,**/lcov-report}" --color "always" '.shellescape(<q-args>), 1, <bang>0)
  nnoremap <C-F>f :Find<CR>
" }}}

" vim-grepper {{{
  " initialize with default values
  let g:grepper = {}
  let g:grepper.rg = {}
  let g:grepper.tools = ['rg', 'git', 'grep']
  runtime plugin/grepper.vim
  " override rg query
  let g:grepper.rg.grepprg = 'rg --follow --smart-case --with-filename --no-heading --vimgrep --hidden --glob "!{**/__pycache__,**/node_modules,**/.git,**/*.pyc,**/venv/lib,**/venv2/lib,**/venv3/lib,**/coverage,**/lcov-report}"'
  " highlight searches
  let g:grepper.searchreg = 1
  let g:grepper.highlight = 1
  " show only the grep $tool name in the prompt
  let g:grepper.prompt_text = '$t> '
  nnoremap <leader>g :Grepper -tool rg<cr>
  nnoremap <leader>G :Grepper -tool rg -buffers<cr>
  nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
  nnoremap <leader>8 :Grepper -tool rg -cword -noprompt<cr>
  nmap gs <plug>(GrepperOperator)
  xmap gs <plug>(GrepperOperator)
" }}}

" tidalcycles {{{
  let g:tidal_target = "terminal"
" }}}

""" Refactoring ---------------
nmap <S-F6> <Plug>(coc-rename)

" nmap <silent> <A-7> :copen<CR><CR>
" :nnoremap <A-S-F> :vimgrep /<C-R>/g **<CR>

" Code {{{
  nnoremap <c-_> :Commentary<CR>
  vnoremap <c-_> :Commentary<CR>
"  }}}

" Buffers {{{
  nmap <F3> :TagbarToggle<CR>
  """" Use fancy buffer closing that doesn't close the split
  :nnoremap <silent> <S-Left> :bprevious<CR>
  :nnoremap <silent> <S-Right> :bnext<CR>
  :noremap <silent> <C-Left> b
  :noremap <silent> <C-Right> w
  """" Move with Ctrl+hjkl (skip Ctrl+W step)
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-H> <C-W><C-H>
  """" Delete (wipe) current buffer with "\q", preserving windows
  nnoremap <leader>q :BW<CR>
  function! CloseOrCClose()
    if &buftype ==# 'quickfix'
      cclose
    else
      BW
    endif
  endfunction
  nmap <leader>bc :call CloseOrCClose()<CR>
  nmap <leader><leader>bw :bw<CR>
  nmap <leader><leader>bd :bd<CR>
  nmap <leader><leader>bun :bun<CR>
  nmap <leader><leader>bundo :bundo<CR>
  nnoremap <leader>bm :bmod<CR>
  nnoremap <leader><leader>q :close<CR>
  """" Use <leader>bw/bd/bun/bundo for buffer operations
" }}}

"" END Key remaps -------------
" }}} key remaps

" Plugins {{{
  
  "" Nuake
  tnoremap <C-q> <C-w>N
  tnoremap <C-\> <C-\><C-n>:Nuake<CR>
  nnoremap + <C-w>3+
  nnoremap _ <C-w>3-
  nnoremap <C-\> :Nuake<CR>
  inoremap <C-\> <C-\><C-n>:Nuake<CR>
  let g:nuake_position = 'top'
  let g:nuake_size = 0.2
  
  " ,,w saves the file
  nnoremap <leader><leader>w :w<CR>
  " :w!! sudo saves the file
  cmap w!! w !sudo tee % >/dev/null
  
  " status bar colors
  hi statusline guibg=#8fbfdc ctermbg=cyan
  au InsertEnter * hi statusline guibg=#d7afff ctermbg=magenta
  au InsertLeave * hi statusline guibg=#8fbfdc ctermbg=cyan
  " au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
  " au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
  " hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
  
  " vim-startify {{{
  if (!exists('g:started_by_firenvim'))
    " returns all modified files of the current git repo
    " `2>/dev/null` makes the command fail quietly, so that when we are not
    " in a git repo, the list will be empty
    function! s:gitModified()
        let files = systemlist('git ls-files -m 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction
    
    " same as above, but show untracked files, honouring .gitignore
    function! s:gitUntracked()
        let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction
    
    " autoload session if the dir contains Session.vim
    let g:startify_session_autoload = 1
    " specify bookmarks
    let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'z': '~/.zshrc'}, {'s': '~/.config/sway/config'} ]
    " list of stuff to show on startup
    let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
            \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
    autocmd User Startified setlocal cursorline
  endif
  " }}}
  
  " Status Line Custom
  let g:currentmode={
      \ "n"  : 'Normal',
      \ "no" : 'Normal·Operator Pending',
      \ "v"  : 'Visual',
      \ "V"  : 'V·Line',
      \ "" : 'V·Block',
      \ "s"  : 'Select',
      \ "S"  : 'S·Line',
      \ "" : 'S·Block',
      \ "i"  : 'Insert',
      \ "R"  : 'Replace',
      \ "Rv" : 'V·Replace',
      \ "c"  : 'Command',
      \ "cv" : 'Vim Ex',
      \ "ce" : 'Ex',
      \ "r"  : 'Prompt',
      \ "rm" : 'More',
      \ "r?" : 'Confirm',
      \ "!"  : 'Shell',
      \ "t"  : 'Terminal'
      \}
  
  set noshowmode
  set laststatus=2
  set statusline=
  " set statusline+=%0*\ %n\                                 " Buffer number
  set statusline+=%0*\ %<%f%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
  set statusline+=%3*│                                     " Separator
  set statusline+=%2*\ %02l:%02v\ (%3p%%)\                 " Line number : column number ( percentage )
  set statusline+=%=                                       " Right Side
  " set statusline+=%2*\ %Y\                                 " FileType
  " set statusline+=%3*│                                     " Separator
  " set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
  " set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
  " set statusline+=%3*│                                     " Separator
  set statusline+=%0*\ %{fugitive#head()}\                 " Fugitive - git branch name
  set statusline+=%3*│                                     " Separator
  set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
  
  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  
  hi PMenu guibg=#666666
  hi PMenuSel guibg=#777777
  
  " Firenvim plugin {{{
  if (exists('g:started_by_firenvim'))
    nnoremap <C-z> :call firenvim#hide_frame()<CR>
  
    let g:firenvim_config = { 
        \ 'globalSettings': {
            \ 'alt': 'all',
        \  },
        \ 'localSettings': {
            \ '.*': {
                \ 'priority': 0,
                \ 'selector': 'textarea',
                \ 'takeover': 'never',
            \ },
        \ }
    \ }
  
    function! s:IsFirenvimActive(event) abort
      if !exists('*nvim_get_chan_info')
        return 0
      endif
      let l:ui = nvim_get_chan_info(a:event.chan)
      return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
          \ l:ui.client.name =~? 'Firenvim'
    endfunction
    
    function! OnUIEnter(event) abort
      if s:IsFirenvimActive(a:event)
        " configure font size
    		" set guifont=Iosevka:h12
    		set guifont=monospace:h14
        " extend the textarea
        set lines=14 columns=80
        " disable the statusline
        set laststatus=0
        set statusline=
        " extend the gutter line
        set nuw=3
        " disable git gutter
        GitGutterDisable
        " color the cursor
        hi Cursor ctermbg=black ctermfg=gray guibg=black guifg=#e9d6b6
        " quit on ,,q (not only buffer, but whole thing)
        nnoremap <leader><leader>q :quit<CR>
      endif
    endfunction
  
    autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
  endif
  " }}} Firenvim plugin
  
  " Markdown plugin
  let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                          \ 'enter': { 'shift': 1 },
                          \ 'links': { 'external': { 'enable': 1 } },
                          \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                          \ 'fold': { 'enable': 1 } }
  let g:polyglot_disabled = ['markdown'] " for vim-polyglot users, it loads Plasticboy's markdown
                                         " plugin which unfortunately interferes with mkdx list indentation.
  
  " Jekyll plugin (notes)
  let g:jekyll_post_extension = '.md'
  let g:jekyll_draft_dirs = ['_drafts', '_source/_drafts', 'notes']
  
  " Quick Scope (jump f key highlight)
  let g:qs_highlight_on_keys = ['f', 'F']
  
  " Dadbod / DB plugin {{{
    "" see https://habamax.github.io/2019/09/02/use-vim-dadbod-to-query-databases.html
    "" operator mapping
    func! DBExe(...)
    	if !a:0
    		let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
    		return 'g@'
    	endif
    	let sel_save = &selection
    	let &selection = "inclusive"
    	let reg_save = @@
    
    	if a:1 == 'char'	" Invoked from Visual mode, use gv command.
    		silent exe 'normal! gvy'
    	elseif a:1 == 'line'
    		silent exe "normal! '[V']y"
    	else
    		silent exe 'normal! `[v`]y'
    	endif
    
    	execute "DB " . @@
    
    	let &selection = sel_save
    	let @@ = reg_save
    endfunc

    vnoremap <leader>db :DB<CR>
    
    xnoremap <expr> <Plug>(DBExe)     DBExe()
    nnoremap <expr> <Plug>(DBExe)     DBExe()
    nnoremap <expr> <Plug>(DBExeLine) DBExe() . '_'
    
    xmap <leader>db  <Plug>(DBExe)
    nmap <leader>db  <Plug>(DBExe)
    omap <leader>db  <Plug>(DBExe)
    nmap <leader>dbb <Plug>(DBExeLine)
  
    " let g:dadbods = []
    " let db = {
    " 		\"name": "postgres@localhost:5432/postgres)",
    " 		\"url": "postgresql://postgres:@localhost:5432/postgres"
    " \}
    " call add(g:dadbods, db)
    
    " " if g:db and b:db is set up -- b:db will be used.
    " " so g:db would serve as a default database (first in the list)
    " let g:db = g:dadbods[0].url
  
    " command! DBSelect :call popup_menu(map(copy(g:dadbods), {k,v -> v.name}), {
    " 			\"callback": 'DBSelected'
    " \})
    
    " func! DBSelected(id, result)
    " 	if a:result != -1
    " 		let b:db = g:dadbods[a:result-1].url
    " 		echomsg 'DB ' . g:dadbods[a:result-1].name . ' is selected.'
    " 	endif
    " endfunc
  " }}} Dadbod / DB plugin
  " Vira {{{
    " let vira_config_servers = '~/.config/vira/vira_servers.json'
    " let vira_config_file_servers = '~/.config/vira/vira_servers.json'
  " }}} Vira

  " splitjoin.vim {{{
    let g:splitjoin_split_mapping = ''
    let g:splitjoin_join_mapping = ''

    nmap <leader>j :SplitjoinJoin<cr>
    nmap <leader>J :SplitjoinSplit<cr>
  " }}} splitjoin.vim

  " undotree {{{
    let g:undotree_WindowLayout = 3
    let g:undotree_ShortIndicators = 1
    let g:undotree_DiffCommand = "delta"
    nnoremap <F4> :UndotreeToggle<CR>
  " }}} undotree

  " hexokinase {{{
    let g:Hexokinase_highlighters = ['backgroundfull']
  " }}} hexokinase
  
  " vimade {{{
    " coc-explorer loses colors on vimade, so disable it there
    function! s:disable_vimade()
        :VimadeBufDisable
        :VimadeWinDisable
    endfunction
    autocmd FileType coc-explorer call s:disable_vimade()
    " fade a bit less for readability
    let g:vimade = {}
    let g:vimade.fadelevel = 0.65
    " fix for autocomplete slows down vim when using vimade
    au! CompleteChanged * redraw
  " }}} vimade

  " {{{ lazygit
    let g:lazygit_floating_window_winblend = 0 " transparency of floating window
    let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
    let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
    let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
    let g:lazygit_use_neovim_remote = 0 " if set to 1, it will fallback to 0 if neovim-remote is not installed

    nnoremap <silent> <leader>lg :LazyGit<CR>
  " }}} lazygit
  
" }}} Plugins

" Tmux {{{
  if &term =~ '^screen'
      " tmux will send xterm-style keys when xterm-keys is on
      execute "set <xUp>=\e[1;*A"
      execute "set <xDown>=\e[1;*B"
      execute "set <xRight>=\e[1;*C"
      execute "set <xLeft>=\e[1;*D"
  endif
  " Close tmux when exiting vim
  autocmd VimLeave * silent !tmux kill-session -t $VIM_SESSION
  autocmd VimLeave * set guicursor=a:block-blinkon0
" }}} Tmux

""" Custom file types
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.json set filetype=json syntax=json
au BufRead,BufNewFile *.jsonc set filetype=jsonc syntax=json
au BufRead,BufNewFile *.tsx set filetype=typescript
syntax match Comment /\%^---\_.\{-}---$/ contains=@Spell
au BufRead,BufNewFile *.http set syntax=json
au BufRead,BufNewFile *.http setlocal ts=2 sts=2 sw=2
autocmd FileType json,jsonc syntax match Comment +\/\/.\+$+
autocmd FileType json,jsonc setlocal ts=2 sts=2 sw=2

""" Better help navigation
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" Don't wrap long lines in git PR or git commit messages
autocmd FileType git,gitcommit set formatoptions=n

""" Automatic commands {{{
  
  """ QuickFix window always at the bottom
  autocmd FileType qf wincmd J
  
  """ Two space indents:
  autocmd Filetype zsh,vim setlocal ts=2 sts=2 sw=2
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
  autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
  autocmd Filetype js setlocal ts=2 sts=2 sw=2
  autocmd Filetype jsx setlocal ts=2 sts=2 sw=2
  autocmd Filetype tsc setlocal ts=2 sts=2 sw=2
  autocmd Filetype ts setlocal ts=2 sts=2 sw=2
  autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
  autocmd Filetype c,cpp,h,hpp setlocal ts=2 sts=2 sw=2
  
  """ Enable wrapping in textual files
  autocmd Filetype txt,md,markdown set wrap
  
  
  """ Autoload changes in .vimrc
  " autocmd BufWritePost .vimrc source $MYVIMRC
  " cmap reloadvimrc source $MYVIMRC
  
  " Fix editing crontab
  autocmd filetype crontab setlocal nobackup nowritebackup
  
  " Folding {{{
    """ Folding in rc files
    autocmd Filetype vim set foldmethod=marker
  
    function! VimFolds(lnum)
        " get content of current line and the line below
        let l:cur_line = getline(a:lnum)
        let l:next_line = getline(a:lnum+1)
  
        if l:cur_line =~# '^"{'
            return '>' . (matchend(l:cur_line, '"{*') - 1)
        else
            if l:cur_line ==# '' && (matchend(l:next_line, '"{*') - 1) == 1
                return 0
            else
                return '='
            endif
        endif
    endfunction
  
    " autocmd FileType vim set foldmethod=expr
    " set foldexpr=VimFolds(v:lnum)
    
    " Stopped working at some point, ┐(͡°ʖ̯͡°)┌
    " Use ~/.vim/after/syntax/python.vim syntax for folding
    " autocmd FileType python setlocal foldenable foldmethod=syntax
    " now using SimpylFold plugin
    autocmd FileType python setlocal foldenable foldmethod=indent foldnestmax=3
  
    " Autosave folding on exit and load on open
    augroup remember_folds
      autocmd!
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent! loadview
    augroup END
  "}}}
  
" }}} Automatic commands

" run ncat
" map <c-y>l :! eval $(cat ~/.netcat/localhost.env); envsubst < % \| sed '1,/Content-Length/d;/,0/,$d' \| tail -n+2 \| wc -c \| read NC_MM_CONTENT_LENGTH; export NC_MM_CONTENT_LENGTH; envsubst < % \| tee /dev/tty \| ~/.netcat/ncat-wrapper.sh localhost <CR>
" map <c-y>s :! eval $(cat ~/.netcat/staging.env); expr `envsubst < % \| sed '1,/Content-Length/d;/,0/,$d' \| tail -n+2 \| wc -c` - 1 \| read NC_MM_CONTENT_LENGTH; export NC_MM_CONTENT_LENGTH; envsubst < % \| tee /dev/tty \| ~/.netcat/ncat-wrapper.sh staging \| tee -a ~/.netcat/logs/staging.log \| tee /dev/tty \| grep '^{.*}$' \| jq -r '.accessToken' > ~/.netcat/tokens/staging.token <CR>
" map <c-y>p :! eval $(cat ~/.netcat/production.env); expr `envsubst < % \| sed '1,/Content-Length/d;/,0/,$d' \| tail -n+2 \| wc -c` - 1 \| read NC_MM_CONTENT_LENGTH; export NC_MM_CONTENT_LENGTH; envsubst < % \| tee /dev/tty \| ~/.netcat/ncat-wrapper.sh production \| tee -a ~/.netcat/logs/production.log \| tee /dev/tty \| grep '^{.*}$' \| jq -r '.accessToken' > ~/.netcat/tokens/production.token <CR>
" 
" if exists("g:loaded_webdevicons")
"   call webdevicons#refresh()
" endif
