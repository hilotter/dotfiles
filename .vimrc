if has('vim_starting')
  set nocompatible               " Be iMproved

   " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Added For Ruby Programming
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache'
 
"NeoBundleLazy 'Shougo/neosnippet', {
"      \ 'autoload' : {
"      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
"      \   'filetypes' : 'snippet',
"      \   'insert' : 1,
"      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
"      \ }}
 
NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
 
NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}
 
NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}
 
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}
 
NeoBundle 'taka84u9/vim-ref-ri', {
      \ 'depends': ['Shougo/unite.vim', 'thinca/vim-ref'],
      \ 'autoload': { 'filetypes': ['haml', 'ruby', 'eruby'] } }
 
NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}
 
NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'depends' : ['Shougo/unite.vim'],
      \ 'autoload' : {
      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      \ }}

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'szw/vim-tags'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'Shougo/vimshell'

NeoBundle 'mattn/emmet-vim'

NeoBundle 'tpope/vim-surround'

NeoBundle 'jpo/vim-railscasts-theme'

NeoBundle 'tpope/vim-dispatch'

" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'
" hybrid カラースキーム
NeoBundle 'w0ng/vim-hybrid'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" カラースキーマの設定
colorscheme desert

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
set nocompatible

set encoding=utf-8
set fileencodings=ucs_bom,utf8,ucs-2le,ucs-2
set fileformats=unix,dos,mac

" refs: http://www.kawaz.jp/pukiwiki/?vim
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = s:fileencodings_default .','. &fileencodings
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif

  unlet s:enc_euc
  unlet s:enc_jis
endif
" }}}

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
set number
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=2
set clipboard=unnamed,autoselect
set ruler
set wrap
set list
set listchars=trail:-,tab:>-
set smartindent
set showmatch
set whichwrap=b,s,<,>
set textwidth=0
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
set ignorecase
set smartcase
set nowrapscan
set hlsearch
set wildmenu
set wildmode=list:full
set noswapfile
set backupdir=$HOME/.vimbackup

noremap :nh :nohlsearch<CR><ESC>

" move key disable
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>

"------------------------------------
" neosnippet
"------------------------------------
" neosnippet "{{{
 
"let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets' " $BK\BN$KF~$C$F$$$k(Bsnippet
"let s:my_snippet = '~/snippet' " $B<+J,$N(Bsnippet
"let g:neosnippet#snippets_directory = s:my_snippet
"let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet
"imap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
"inoremap <silent><C-U>            <ESC>:<C-U>Unite snippet<CR>
"nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
"smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
"" xmap <silent>o                    <Plug>(neosnippet_register_oneshot_snippet)
"}}}

"------------------------------------
" Unit.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-L> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"------------------------------------
" vim-rails
"------------------------------------
""{{{
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END
"}}}


"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>

  nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
  nnoremap <silent> ;@              :<C-u>Unite file_rec/async:!<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"}}}

"----------------------------------------
" vim-ref
"----------------------------------------
"{{{
let g:ref_open                    = 'split'
let g:ref_refe_cmd                = expand('~/.vim/ruby-refm/refe-1_9_3')
 
nnoremap rr :<C-U>Unite ref/refe     -default-action=split -input=
nnoremap ri :<C-U>Unite ref/ri       -default-action=split -input=
 
aug MyAutoCmd
  au FileType ruby,eruby,ruby.rspec nnoremap <silent><buffer>KK :<C-U>Unite -no-start-insert ref/ri   -input=<C-R><C-W><CR>
  au FileType ruby,eruby,ruby.rspec nnoremap <silent><buffer>K  :<C-U>Unite -no-start-insert ref/refe -input=<C-R><C-W><CR>
aug END
"}}}

" matchit
if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
"autocmd VimEnter * execute 'NERDTree'

" neocomplcache
" neocomplcache用設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache#sources#rsense#home_directory = '/opt/rsense-0.3'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Rubocop
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" VimShell
let g:vimshell_execute_file_list = {}
let g:vimshell_execute_file_list['rb'] = 'bundle exec ruby'
noremap ,sh :sp<CR><C-w>j:VimShell<CR>

"------------------------------------
" emmet-vim
"------------------------------------
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '  '
    \ }

" vim-tags
let g:vim_tags_project_tags_command = "ctags -f tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "ctags -R -f Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
set tags+=tags,Gemfile.lock.tags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
let g:vim_tags_use_vim_dispatch = 1
