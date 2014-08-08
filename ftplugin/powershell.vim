
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

setlocal commentstring=#%s
setlocal formatoptions=tcqro
setlocal iskeyword+=-

let b:undo_ftplugin = 'setlocal tw< cms< fo< | unlet! b:browsefilter'

