" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327"
" License:            Apache 2.0

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

setlocal commentstring=#%s
setlocal formatoptions=tcqro
setlocal iskeyword+=-

let b:undo_ftplugin = 'setlocal tw< cms< fo<'

