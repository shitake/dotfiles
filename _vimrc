" PS> cmd /c mklink %HOMEPATH%\_vimrc %HOMEPATH%\dotfiles\_vimrc やってね

let $HOME_C='~/dotfiles'  " なんでこれ用意したか覚えてない

set runtimepath^=$HOME_C/vimfiles


" ------------------------------
"  bundle
" ------------------------------
" neobundle.vimのマニュアル通り
" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  " set runtimepath+=~/vimfiles/bundle/neobundle.vim
  set runtimepath+=$HOME_C/vimfiles/bundle/neobundle.vim
endif

" neobundle.vimの初期化
" call neobundle#rc(expand('$HOME_C/vimfiles/bundle/'))  " 廃止になったはず
call neobundle#begin(expand('~/dotfiles/vimfiles/bundle'))
call neobundle#end()
" manage
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグインを記載

" ファイルタイプ検出，プラグイン/インデントの有効化
filetype plugin indent on

" 使用するプラグインを書く
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Shougo/unite.vim'

NeoBundle 'itchyny/lightline.vim'
set t_Co=256

" vim-easymotion
NeoBundle 'haya14busa/vim-easymotion'

" vim-powerline
" NeoBundle 'Lokaltog/vim-powerline'

" jedi-vim
NeoBundle 'davidhalter/jedi-vim'

" unite.vim
NeoBundle 'Shougo/unite.vim'

" vimshell.vim
NeoBundle 'Shougo/vimshell.vim'

" vim-markdown
NeoBundle 'plasticboy/vim-markdown'

" previm
NeoBundle 'kannokanno/previm'

" open-browser.vim
NeoBundle 'tyru/open-browser.vim'

" agit.vim
NeoBundle 'cohama/agit.vim'

" stan.vim
NeoBundle 'maverickg/stan.vim'

" vim-gitgutter
NeoBundle 'airblade/vim-gitgutter'

" vim-fugitive
NeoBundle 'tpope/vim-fugitive'

filetype plugin indent on

NeoBundleCheck

" ------------------------------
" easy-motion
" ------------------------------
" ジャンプ用キー変更
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmvcxzbHJKLASDFGYUIOPQWERTNMVCXZB'
" <Leader>を ; に割当
let g:EasyMotion_leader_key=';'
" smartcase 大文字小文字無視
let g:EasyMotion_smartcase=1
" 双方向検索 <Leader>なしでs使えるようにした
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-s)
" JK Motionの変更 先頭列ではなくカレント列
let g:EasyMotion_startofline=0

" ------------------------------
" lightline.vim
" ------------------------------
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '->'
let g:gitgutter_sign_removed = '×'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"×":""}',
      \ },
      \ 'separator': { 'left': '>', 'right': '<' },
      \ 'subseparator': { 'left': '>', 'right': '<' },
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['fugitive', 'gitgutter', 'filename'],
      \   ],
      \   'right': [
      \     ['lineinfo', 'syntastic'],
      \     ['percent'],
      \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
      \   ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'charcode': 'MyCharCode',
      \   'gitgutter': 'MyGitGutter',
      \ }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? 'undo' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? 'brnch '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

set laststatus=2

" ------------------------------
" previm
" ------------------------------
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


" ------------------------------
" stan.vim
" ------------------------------
augroup StanVimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.stan,*.STAN setfiletype stan
augroup END

" ------------------------------
" vim-gitgutter
" ------------------------------
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
