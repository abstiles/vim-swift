" Vim filetype plugin
" Language:     Swift
" Maintainer:   Andrew Stiles

if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=s1:/*,mb:*,ex:*/,://

" vim:set et sts=4 sw=4 ts=8:
