hi clear
set background=dark
set t_Co=256

" シンタックスハイライトの設定をデフォルトに
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "shitakeDarkPastel"

" :help group-name 参照

hi Normal		           ctermfg=15 ctermbg=234 guifg=#FFFFFF guibg=#3C3C3C
hi NonText		  term=bold      cterm=bold ctermfg=11 gui=bold guifg=#000099  " EOF以降の~とか
hi Comment		  term=bold                 ctermfg=149  guifg=#AED091  " コメント
hi Constant		  term=underline cterm=bold ctermfg=184 gui=bold guifg=#E1DF63  " 定数
hi Number		  term=bold      cterm=bold ctermfg=110 gui=bold guifg=#90BEC9  " 数値
hi String		  term=bold      cterm=bold ctermfg=229 gui=bold guifg=#EAE890  " 文字列
hi Boolean		  term=bold      cterm=bold ctermfg=215 gui=bold guifg=#FFB366  " ブール値
hi Special		  term=bold      cterm=bold ctermfg=140 gui=bold guifg=#C39EC3  " 特殊記号 () {} , とか
hi Operator	                     ctermfg=80             guifg=#5fd7d7  " 演算子
hi Identifier	  term=underline ctermfg=175 gui=bold guifg=#EBA3A3  " 関数，識別子
hi Statement	  term=bold      cterm=bold ctermfg=206 gui=bold guifg=#ff87d7  " 命令，分岐
hi PreProc		  term=underline ctermfg=215   guifg=#ffaf5f  " プリプロセッサメソッド
hi Type			  term=underline cterm=bold ctermfg=13  gui=bold  guifg=#F788A3  " クラス，構造体 C G

hi ErrorMsg		  term=standout  cterm=bold ctermfg=3  ctermbg=199  guifg=yellow  guibg=#ff00af
hi MoreMsg		  term=bold cterm=bold ctermfg=115 ctermbg=10 gui=bold guifg=black guibg=SeaGreen  " -- 継続 -- C G
hi ModeMsg		  term=bold cterm=bold ctermfg=119 ctermbg=16 gui=bold guifg=lightgreen guibg=black  " -- 挿入 --, -- ビジュアル行 --
hi Question		  term=standout  cterm=bold  ctermfg=190 gui=bold  guifg=#d7ff00  " プロンプトのメッセージ

hi Visual		                             ctermbg=16 guibg=black " 選択
hi Search		  cterm=NONE ctermfg=16 ctermbg=116 guifg=black  guibg=lightblue  " 検索
hi MatchParen	  term=reverse  ctermfg=16 ctermbg=124 guifg=#000000 guibg=#af005f  " 対応する括弧

hi Scrollbar	  guifg=darkcyan guibg=cyan  " C G
hi Menu			  guifg=black guibg=seagreen  " C G
hi SpecialKey	  term=bold  cterm=bold  ctermfg=96  guifg=#CE8A9B  " 不可視文字とか
hi Directory	  term=bold  cterm=bold  ctermfg=1 gui=bold guifg=lightred
hi LineNr		  term=underline ctermfg=67 guifg=#8DA6BA  " 行番号
hi StatusLine	  term=bold,reverse  cterm=bold " ctermfg=16 ctermbg=12 gui=bold guifg=black guibg=lightblue  " カレント G C
hi StatusLineNC   term=reverse ctermfg=16 ctermbg=7 guifg=black guibg=lightgrey  " カレント以外 G C
hi Title		  term=bold  cterm=bold  ctermfg=1 gui=bold guifg=lightred  " html, markdownとかのタイトル, 見出しにあたる個所
hi WarningMsg	  term=standout  cterm=bold  ctermfg=1 guifg=lightred
hi Cursor		  ctermfg=15 ctermbg=113 guifg=white guibg=#75D05A  " カーソルの位置
" hi CursorLine	  term=underline  guibg=#555555 cterm=underline
" hi CursorColumn	  term=underline  guibg=#555555 cterm=underline
hi Error		  term=reverse cterm=bold ctermfg=37  ctermbg=16 gui=bold guifg=#00A9A1 guibg=black
hi Todo			  term=standout cterm=bold ctermfg=164 ctermbg=16 gui=bold guifg=#E35AB1  guibg=black  " Rで有効になっていない
hi TabLine		  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=lightgreen guibg=white  " C G
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=lightred guibg=white  " C G
hi TabLineSel	  term=reverse ctermfg=white ctermbg=lightblue guifg=white guibg=lightmagenta  " C G

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
" hi CursorLine gui=underline
highlight CursorLine ctermbg=237 guibg=#262024
