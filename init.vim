if exists('g:vscode')
	" for vscode
	set clipboard=unnamedplus

	" ノーマルモードとビジュアルモードでのヤンク設定
	nnoremap y "+y
	nnoremap yy "+yy
	nnoremap Y "+Y
	xnoremap y "+y
	xnoremap Y "+Y
	nnoremap yw "+yw
	nnoremap p "+p
	xnoremap p "+p

else
	" for ordinaly neovim
	" クリップボードを使用する
	set clipboard=unnamedplus

	" 行番号と相対行番号を表示する
	set number
	set relativenumber
            
	" jjをEscにマッピングする
	inoremap jj <Esc>
	" jkで保存しながら抜ける
	inoremap jk <Esc>:w<CR>

	" ノーマルモードとビジュアルモードでのヤンク設定
	nnoremap y "+y
	nnoremap yy "+yy
	nnoremap Y "+Y
	xnoremap y "+y
	xnoremap Y "+Y
	nnoremap yw "+yw
	nnoremap p "+p
	xnoremap p "+p

	" タブを4文字に設定する
	set tabstop=4
	set shiftwidth=4
	set expandtab

end

