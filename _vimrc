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
" vim-lightline
" ------------------------------
" colorscheme
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }

" ------------------------------
" previm
" ------------------------------
augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
