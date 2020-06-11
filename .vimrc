" Automatically install the plugin manager if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins {{{
call plug#begin('~/.vim/plugged')
" Productivity
""" Plug 'paulkass/jira-vim'

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

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git related
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'airblade/vim-gitgutter'           " Show sign on the left side when the line has been modified
Plug 'tpope/vim-rhubarb'                " To use :Gbrowse (open commit in GitHub)

" Utilities
" Plug 'roxma/nvim-yarp'                  " Yet Another Remote Plugin Framework for Neovim (used for ncm2 and deoplete.nvim)
" Plug 'brooth/far.vim'                   " Find and replace
Plug 'romainl/vim-qf'                   " Advanced quickfix behavior (skip to next filename {/}; :Keep, :Reject and :Restore entries funnel - works with quickfix-reflector.vim)
Plug 'stefandtw/quickfix-reflector.vim' " Edit the quickfix list (find and replace with rg/fzf)
Plug 'matze/vim-move'                   " Move lines up and down
Plug 'ConradIrwin/vim-bracketed-paste'  " Detect clipboard paste (auto :set paste!)
Plug 'jremmen/vim-ripgrep'              " Use ripgrep for search
Plug 'mhinz/vim-grepper'               " grep using your fav grepper
Plug 'majutsushi/tagbar'                " Tagbar (right side thing to show functions)
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-commentary'             " :Commentary to comment out a line or block
" autocomplete window with escape
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-sensible'
Plug 'sukima/xmledit'
Plug 'mboughaba/i3config.vim'
Plug 'SidOfc/mkdx'                      " Markdown plugin
Plug 'sulibo/vim-jekyll'                " Jekyll plugin
Plug 'junegunn/vim-peekaboo'            " sneak peak preview of registers on @ and "
Plug 'mhinz/vim-startify'               " Start screen for vim
" Plug 'ncm2/ncm2'                        " nvim-completion-manager
" Plug 'svermeulen/vim-yoink'             " clipboard history manager (buffer yankring)
" Plug 'svermeulen/ncm2-yoink'            " clipboard history manager ncm2 completion

" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'eliba2/vim-node-inspect'          " NodeJS interactive debugger

" Appearance
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'unblevable/quick-scope'         " Highlight jump characters - slows (unless only on f/F trigger)
" down vim considerably
Plug 'joshdick/onedark.vim'           " Colorscheme onedark
Plug 'morhetz/gruvbox'                " Colorscheme gruvbox (can be light)
Plug 'breuckelen/vim-resize'          " Use Ctrl+arrows to resize splits
Plug 'chrisbra/Colorizer'             " Show hex codes as colours
" Plug 'Townk/vim-autoclose' " perhaps is conflicting when closing
" Plug 'udalov/kotlin-vim'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'Shougo/deoplete.nvim'
" Plug 'zchee/deoplete-go', { 'do': 'make' }
call plug#end()
" Buffers and files
" }}}

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
set number
set title
set ruler
set nospell
set rnu
set updatetime=300
" let's try fixing colors on nvim
if !has('nvim')
  set termguicolors!
endif
let g:python3_host_prog="/usr/bin/"

" supposed to fix slowness caused by vim-nerdtree-syntax-highlight
set lazyredraw
set wildignore=*/node_modules/*
" mapping for paste (so that overwriting visual selection doesn't pick up the
" overwritten text into the buffer, but just paste over it)
xnoremap p "_dP


" Customize view {{{
  syntax on
  " Sakura supports TRUECOLOR, so no need to revert to 256
  " set t_Co=256
  " set t_ut=
  set guicursor=i:ver1      " insert mode: vertical bar
  set guicursor+=a:blinkon1 " all modes: turn on blinking
  
  " themes {{{
    " autocmd vimenter * colorscheme onedark
    autocmd vimenter * colorscheme gruvbox
    set background=dark
    " fix for Coc diagnostic signs color mismatch
    autocmd ColorScheme * 
            \ hi CocErrorSign  ctermfg=Red guifg=#ff0000 | 
            \ hi CocWarningSign  ctermfg=Brown guifg=#ff922b |
            \ hi CocInfoSign  ctermfg=Yellow guifg=#fab005 |
            \ hi CocHintSign  ctermfg=Blue guifg=#15aabf |
            \ hi CocUnderline  cterm=underline gui=underline
    " highlight quickfix line
    hi QuickFixLine cterm=None ctermbg=black guibg=#ffff00
  " }}}
  
  " lens.vim {{{
    let g:lens#disabled = 1
    " 120 + 4 for gutter
    let g:lens#width_resize_max = 124
    " git commit, nerdtree
    let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
  " }}}

"" Key remaps -----------------
noremap <silent> <expr> <F2> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
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
" }}}

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

nmap <silent> <C-B> :call <SID>BlameToggle()<CR>
let g:fugitive_summary_format = '%s (%cr) <%an>'
"""" coc.nvim
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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use `[g` and `]g` to navigate diagnostics
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
  else
    call CocAction('doHover')
  endif
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
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

" Remove coc selection extension (coc-range-select) on Ctrl+I
" Because it overrides default vim C-O / C-I jump behavior
autocmd VimEnter * :unmap <C-I>
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


"""" CamelCase motion
let g:camelcasemotion_key = '<leader>'

""" Navigation ----------------
" CtrlP - go to definition {{{
  let g:ctrlp_map = '<C-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|lib|vendor|coverage|researchtag|webBasedPortal)|(\.(swp|ico|git|svn))$'
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
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings -S --no-ignore --hidden --follow --glob "!{**/__pycache__,**/node_modules,**/.git,**/*.pyc,**/venv/lib}" --color "always" '.shellescape(<q-args>), 1, <bang>0)
  nnoremap <C-F>f :Find<CR>
" }}}

" ripgrep {{{
  let g:rg_command = 'rg --vimgrep -S'
  let g:rg_highlight = 'true'
  let g:rg_derive_root = 'false' " it will use getcwd() (startup dir or `chdir`)
  nnoremap <C-F>g :Rg
  vmap <c-f> "hy:Rg<Enter><M-r>h
" }}}

" vim-grepper {{{
  " initialize with default values
  let g:grepper = {}
  let g:grepper.rg = {}
  runtime plugin/grepper.vim
  " override rg query
  let g:grepper.rg.grepprg = 'rg --follow --smart-case --with-filename --no-heading --vimgrep --hidden --glob "!{**/__pycache__,**/node_modules,**/.git,**/*.pyc,**/venv/lib}"'
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

" Plugins ----------------------

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

" NERDTree options
let NERDTreeAutoCenter = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 1
let NERDTreeQuitOnOpen = 1
"let NERDTreeDirArrows = 1
let NERDTreeIgnore=['.*\.o$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.out$']
let NERDTreeIgnore+=['.*\.so$', '.*\.a$']
let NERDTreeIgnore+=['.*\.pyc$']
let NERDTreeIgnore+=['.*\.class$']
" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'black')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'black')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'black')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'black')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'black')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'black')
call NERDTreeHighlightFile('jsonc', 'yellow', 'none', 'yellow', 'black')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'black')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'black')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'black')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'black')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'black')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'black')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'black')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', 'black')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', 'black')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', 'black')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', 'black')
call NERDTreeHighlightFile('ts', 'green', 'none', 'green', 'black')
call NERDTreeHighlightFile('py', 'green', 'none', 'green', 'black')

" status bar colors
hi statusline guibg=#8fbfdc ctermbg=cyan
au InsertEnter * hi statusline guibg=#d7afff ctermbg=magenta
au InsertLeave * hi statusline guibg=#8fbfdc ctermbg=cyan
" au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
" au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
" hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" vim-startify {{{
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
" }}}

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
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

" hi Directory guifg=#FF0000 ctermfg=red
" hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
" hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
" hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
" hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
hi PMenu guibg=#666666
hi PMenuSel guibg=#777777

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

" Tmux integration
if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
" Close tmux when exiting vim
autocmd VimLeave * silent !tmux kill-session -t $VIM_SESSION

""" Custom file types
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.jsonc set filetype=json
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

""" Automatic commands
" Automatically start NERDTree (disabled bc annoying when used with fzf
" file opener)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" this just gets in the way when using narrow windows
" autocmd FileType c,cpp,h,java,python,go,js,jsx,tsc,ts nested :TagbarOpen

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


""" Autoload changes in .vimrc
" autocmd BufWritePost .vimrc source $MYVIMRC
" cmap reloadvimrc source $MYVIMRC

" Fix editing crontab
autocmd filetype crontab setlocal nobackup nowritebackup

" Folding {{{
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

  "set foldmethod=expr
  "set foldexpr=VimFolds(v:lnum)

  " Autosave folding on exit and load on open
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
"}}}

" run ncat
map <c-y>l :! eval $(cat ~/.netcat/localhost.env); envsubst < % \| sed '1,/Content-Length/d;/,0/,$d' \| tail -n+2 \| wc -c \| read NC_MM_CONTENT_LENGTH; export NC_MM_CONTENT_LENGTH; envsubst < % \| tee /dev/tty \| ~/.netcat/ncat-wrapper.sh localhost <CR>
map <c-y>s :! eval $(cat ~/.netcat/staging.env); expr `envsubst < % \| sed '1,/Content-Length/d;/,0/,$d' \| tail -n+2 \| wc -c` - 1 \| read NC_MM_CONTENT_LENGTH; export NC_MM_CONTENT_LENGTH; envsubst < % \| tee /dev/tty \| ~/.netcat/ncat-wrapper.sh staging \| tee -a ~/.netcat/logs/staging.log \| tee /dev/tty \| grep '^{.*}$' \| jq -r '.accessToken' > ~/.netcat/tokens/staging.token <CR>
map <c-y>p :! eval $(cat ~/.netcat/production.env); expr `envsubst < % \| sed '1,/Content-Length/d;/,0/,$d' \| tail -n+2 \| wc -c` - 1 \| read NC_MM_CONTENT_LENGTH; export NC_MM_CONTENT_LENGTH; envsubst < % \| tee /dev/tty \| ~/.netcat/ncat-wrapper.sh production \| tee -a ~/.netcat/logs/production.log \| tee /dev/tty \| grep '^{.*}$' \| jq -r '.accessToken' > ~/.netcat/tokens/production.token <CR>

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
