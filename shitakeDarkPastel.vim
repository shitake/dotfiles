hi clear
set background=dark
set t_Co=256

" シンタックスハイライトの設定をデフォルトに
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "shitakeDarkPastel"

" gui未対応(以下G)
" :help group-name 参照

hi Normal		  guifg=white  guibg=#3C3C3C gui=bold
hi NonText		  term=bold  cterm=bold  ctermfg=darkblue  gui=bold      guifg=#000099  " EOF以降の~とか
hi Comment		  term=bold  cterm=bold ctermfg=74  guifg=#AED091  " コメント
" hi Constant		  term=underline  cterm=bold ctermfg=213  guifg=#ffa0a0  " 定数(文字列，数とか)
" hi Special		  term=bold  cterm=bold ctermfg=228  guifg=Orange  " 特殊記号 () {} , とか (ctermfg=227か228)
hi Constant		  term=underline  cterm=bold ctermfg=228  guifg=#E1DF63 gui=bold  " 定数
hi Number		  term=bold cterm=bold ctermfg=228 gui=bold guifg=#90BEC9  " 数値
hi String		  term=bold cterm=bold ctermfg=228 gui=bold guifg=#EAE890 " 文字列
hi Boolean		  term=bold cterm=bold ctermfg=228 gui=bold guifg=#FFB366 " ブール値
hi Special		  term=bold  cterm=bold ctermfg=213  guifg=#C39EC3 gui=bold  " 特殊記号 () {} , とか (ctermfg=227か228)
hi Operator	      ctermfg=80 guifg=#5fd7d7  " 演算子
hi Identifier	  term=underline ctermfg=215 guifg=#ffaf5f gui=bold  " 関数，識別子
" hi Identifier	  term=underline ctermfg=204 guifg=#40ffff  " 関数，識別子
hi Statement	  term=bold  cterm=bold ctermfg=212 gui=bold  guifg=#ff87d7  " 命令，分岐
hi PreProc		  term=underline  ctermfg=215   guifg=#ffaf5f  " プリプロセッサメソッド
hi Type			  term=underline  cterm=bold ctermfg=204  gui=bold  guifg=#F788A3  " クラス，構造体

hi ErrorMsg		  term=standout  cterm=bold  ctermfg=3  ctermbg=199  guifg=yellow  guibg=#ff00af
hi MoreMsg		  term=bold cterm=bold ctermfg=115 ctermbg=10 gui=bold guifg=black guibg=SeaGreen  " -- 継続 --
hi ModeMsg		  term=bold cterm=bold gui=bold ctermfg=123 ctermbg=12 guifg=lightgreen guibg=black  " -- 挿入 --, -- ビジュアル行 --
hi Question		  term=standout  cterm=bold  ctermfg=190 gui=bold  guifg=#d7ff00  " プロンプトのメッセージ

hi Visual		  ctermfg=228  ctermbg=125 guibg=black " 選択
" hi Visual		  term=reverse cterm=reverse gui=reverse  " 選択
hi Search		  cterm=NONE ctermfg=229 ctermbg=39 guifg=black  guibg=lightblue  " 検索
hi MatchParen	  term=reverse  ctermfg=black  ctermbg=white guifg=#ffff87 guibg=#af005f  " 対応する括弧

hi Scrollbar	  guifg=darkcyan guibg=cyan  " G
hi Menu			  guifg=black guibg=seagreen  " G
hi SpecialKey	  term=bold  cterm=bold  ctermfg=241  guifg=#CE8A9B  " 不可視文字とか
hi Directory	  term=bold  cterm=bold  ctermfg=lightred  guifg=lightred
hi LineNr		  term=underline cterm=bold ctermfg=71 guifg=#8DA6BA  " 行番号
hi StatusLine	  term=bold,reverse  cterm=bold " ctermfg=3 ctermbg=white gui=bold guifg=blue guibg=white  " カレント G
hi StatusLineNC   term=reverse	" ctermfg=white ctermbg=3 guifg=white guibg=blue  " カレント以外 G
hi Title		  term=bold  cterm=bold  ctermfg=119  gui=bold guifg=#87ff5f  " htmlとかのタイトルにあたる個所
hi WarningMsg	  term=standout  cterm=bold  ctermfg=lightred guifg=lightred
hi Cursor		  guifg=bg guibg=#75D05A  " G
" hi CursorLine	  term=underline  guibg=#555555 cterm=underline
hi CursorColumn	  term=underline  guibg=#555555 cterm=underline  " G
hi Error		  term=reverse ctermfg=darkcyan  ctermbg=black  guifg=darkcyan guibg=black
hi Todo			  term=standout  ctermfg=black ctermbg=darkcyan  guifg=black  guibg=darkcyan
hi TabLine		  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=lightgreen guibg=white
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=lightred guibg=white
hi TabLineSel	  term=reverse ctermfg=white ctermbg=lightblue guifg=white guibg=lightmagenta

hi link IncSearch		Visual  " インクリメンタル中の選択文字
hi link Character		Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement  " if, not
hi link Repeat			Statement  " for
hi link Label			Statement
hi link Keyword			Statement
hi link Exception		Statement  " try
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=235
