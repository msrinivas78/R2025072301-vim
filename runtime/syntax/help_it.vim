" Vim syntax file
" Language:	Italian Vim program help files *.itx
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	16 Oct 2024
"
" This script is sourced from syntax/help.vim.

syn keyword helpNote		nota Nota NOTA nota: Nota: NOTA: notare Notare NOTARE notare: Notare: NOTARE:
syn match helpSpecial		"Nma"me=e-2
syn match helpSpecial		"Nme"me=e-2
syn match helpSpecial		"Nmi"me=e-2
syn match helpSpecial		"Nmo"me=e-2
syn match helpSpecial		"\[interv.]"
syn region helpNotVi		start="{non" start="{solo" start="{disponibile" end="}" contains=helpLeadBlank,helpHyperTextJump

" vim: ts=8 sw=2
