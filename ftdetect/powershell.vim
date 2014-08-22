" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327"
" License:            Apache 2.0

autocmd BufNewFile,BufRead   *.powershell   setfiletype powershell
autocmd BufNewFile,BufRead   *.ps1          setfiletype powershell
autocmd BufNewFile,BufRead   *.psd1         setfiletype powershell
autocmd BufNewFile,BufRead   *.psm1         setfiletype powershell

