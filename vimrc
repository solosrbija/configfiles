"noremap <F3> :set invnumber<CR>
"inoremap <F3> <C-O>:set invnumber<CR>
"set invnumber
filetype plugin indent on  
syntax on
map <F7> :let g:num = LineNumber()<bar>let g:num1 = num + 3  <bar>  call GitLog(g:num,g:num1)<CR>
"map <F4> :<C-w> <v> <bar> Explore<CR>
map <F4> :exec OpenWindow()<CR>
"map <F5> :Explore<CR>
nmap <F8> :TagbarToggle<CR>
map <F10> :%!python -m json.tool<CR>
map <F11> :GoDoc<CR>
map <F12>  <C-W>q
map <C-G>r :GoReferrers<CR>
map <C-G>i :GoImplements<CR>
map <C-G>t :GoAddTags<CR>
map <C-G>p  :call search('\%' . virtcol('.') . 'v\S', 'bW')<CR>
map <C-G>c  :call search('\%' . virtcol('.') . 'v\S')<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <expr> * ':%s/'.expand('<cword>').'//gn<CR>``'
set nocompatible           
set pastetoggle=<F2>
"set nowrap
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#begin()
set title
set titlestring=%{hostname()}\ \ %F\ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}
Plugin 'VundleVim/Vundle.vim'
"Plugin 'fatih/vim-go'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'https://github.com/preservim/tagbar.git'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'preservim/nerdtree'
call vundle#end()   

function LineNumber()
	let l = line(".")
	return l
endfunction

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
"  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"  call setline(1, 'You entered:    ' . a:cmdline)
"  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


function! GitLog(...)
  let path  = "git log -L ".a:1 .",". a:2.":".expand("%f")." | grep  -e ^- -e ^+ -e commit -e Author -e Date"
  call s:RunShellCommand(path)
endfunction
let g:go_diagnostics_level = 2
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:neocomplete#enable_at_startup = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_gopls_enabled = 1
"let g:go_gopls_options = ['-remote=auto']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'
let g:go_doc_popup_window = 1
"let g:go_metalinter_enabled = []
"let g:go_metalinter_command = 'golangci-lint'
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet','revive','errcheck','staticcheck','unused']
filetype plugin indent on
syntax on
" Common Go commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>ae <Plug>(go-alternate-edit)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

function OpenWindow()
     :vsp
     :wincmd k
     :wincmd r
"     :NERDTree
     :Explore
endfunction
