silent! if plug#begin('~/.vim/plugged')
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vista.vim'
call plug#end()
endif

let g:coc_global_extensions = ['coc-explorer', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-yaml']
