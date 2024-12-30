" Vim filetype plugin file
" Language:		sh
" Maintainer:		Doug Kearns <dougkearns@gmail.com>
" Previous Maintainer:	Dan Sharp
" Contributor:		Enno Nagel <ennonagel+vim@gmail.com>
"			Eisuke Kawashima
" Last Change:		2024 Sep 19 by Vim Project (compiler shellcheck)
"			2024 Dec 29 by Vim Project (improve setting shellcheck compiler)

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo-=C

setlocal comments=b:#
setlocal commentstring=#\ %s
setlocal formatoptions-=t formatoptions+=croql

let b:undo_ftplugin = "setl com< cms< fo<"

" Shell:  thanks to Johannes Zellner
if exists("loaded_matchit") && !exists("b:match_words")
  let b:match_ignorecase = 0
  let s:sol = '\%(;\s*\|^\s*\)\@<='  " start of line
  let b:match_words =
	\  s:sol .. 'if\>:' .. s:sol.'elif\>:' .. s:sol.'else\>:' .. s:sol .. 'fi\>,' ..
	\  s:sol .. '\%(for\|while\)\>:' .. s:sol .. 'done\>,' ..
	\  s:sol .. 'case\>:' .. s:sol .. 'esac\>'
  unlet s:sol
  let b:undo_ftplugin ..= " | unlet! b:match_ignorecase b:match_words"
endif

if (has("gui_win32") || has("gui_gtk")) && !exists("b:browsefilter")
  let  b:browsefilter = "Bourne Shell Scripts (*.sh)\t*.sh\n" ..
	\		"Korn Shell Scripts (*.ksh)\t*.ksh\n" ..
	\		"Bash Shell Scripts (*.bash)\t*.bash\n"
  if has("win32")
    let b:browsefilter ..= "All Files (*.*)\t*\n"
  else
    let b:browsefilter ..= "All Files (*)\t*\n"
  endif
  let b:undo_ftplugin ..= " | unlet! b:browsefilter"
endif

let s:is_sh = get(b:, "is_sh", get(g:, "is_sh", 0))
let s:is_kornshell = get(b:, "is_kornshell", get(g:, "is_kornshell", 0))

if !exists('current_compiler')
  if (s:is_sh || s:is_kornshell) && executable('shellcheck')
    compiler shellcheck
    let b:undo_ftplugin ..= ' | compiler make'
  endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo s:is_sh s:is_kornshell

" vim: nowrap sw=2 sts=2 ts=8 noet:
