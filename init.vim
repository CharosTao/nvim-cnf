let mapleader=","
set showmatch
set clipboard^=unnamed,unnamedplus
set nocursorline 
set backspace=2
lua << EOF
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 新行对齐当前行，空格替代tab
-- vim.o.expandtab = true
-- vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime 
vim.o.updatetime = 300
-- 等待mappings
vim.o.timeoutlen = 1000
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 2
EOF



" +++++++++++++++++++++++
" Plug-vim
"

call plug#begin()
" Plug 'scrooloose/nerdtree'

" ale 错误处理插件
Plug 'dense-analysis/ale'
" nerdcommenter 注释插件
Plug 'preservim/nerdcommenter'
Plug 'simrat39/symbols-outline.nvim'
" ---- 补全
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'simrat39/symbols-outline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

" -------------------------

lua require('plugins')
lua require('impatient')
lua require('plugin-config/nvim-tree')
"lua require('plugin-config/lualine')
lua require('plugin-config/feline')
lua require('plugin-config/tabby')
lua require('plugin-config/nightfox')
lua require('plugin-config/gitsigns')
lua require('init')
lua require('lsp/gopls')
lua require('lsp/rust_analyzer')
lua require('lsp/lspfuzzy')
lua require('plugin-config/nvim-cmp')
lua require('plugin-config/symbols_outline')
lua require('plugin-config/lspsaga')
lua require('plugin-config/nvim-treesitter')
" color
" Vim Script
" lua require('plugin-config/tokyonight')
"

" ---------
" nvim-tree
" ---------

nmap <leader>m :NvimTreeToggle <cr>
nmap <a-m> :NvimTreeToggle <cr>
" ---------
" map keys
" ---------
nnoremap <c-s> :write <cr>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>ga <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>gf <cmd>lua vim.lsp.buf.formatting()<CR>
" show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
"- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
"- rename
nnoremap <silent><leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"- preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

"- float terminal also you can pass the cli command in open_float_terminal function
nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

" code action
nnoremap <silent><leader>gc <cmd>lua require('lspsaga.codeaction').code_action()<CR>


" ---------
" map keys for coc
" ---------
"nmap <silent> gd <Plug>(coc-definition)

" coc.nvim+ale
" let g:ale_disable_lsp = 1

let g:ale_completion_enabled = 1
" ale-setting {{{
let g:ale_set_highlights = 1
let g:ale_set_quickfix = 1
"自定义error和warning图标
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 1

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
" nmap <Leader>l :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters = {
    \ 'go': ['golint', 'go vet', 'go fmt'],
    \ 'rust' : ['cargo'],
	\ }


" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
