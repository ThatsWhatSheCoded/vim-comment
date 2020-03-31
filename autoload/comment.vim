""
" vim-comment.vim
" Copyright © 2020
" Author: ThatsWhatSheCoded <https://github.com/ThatsWhatSheCoded>
" Description: Functions to comment/uncomment lines of code/text
""

" Substitute one string for another
" Assume: Orig string with literal '*' or '.' must be escaped
func! comment#Substitute(orig, repl)
  exe 's;' . a:orig . ';' . a:repl . ';e'
endfunc


func! comment#get_ft_comment_str()
  let l:str   = ['c', 'cpp', 'java', 'javascript']
  let l:hash  = ['make', 'python', 'sh', 'tmux']
  let l:star  = ['markdown']
  let l:dash  = ['text']
  let l:quote = ['vim']
  if   (-1 < (index(str, &l:ft)))   | return '//'
  elseif (-1 < (index(hash, &l:ft)))  | return '#'
  elseif (-1 < (index(star, &l:ft)))  | return '*'
  elseif (-1 < (index(dash, &l:ft)))  | return '-'
  elseif (-1 < (index(quote, &l:ft))) | return '"'
  endif
endfunc

func! comment#comment()
  let l:beg = comment#get_ft_comment_str()
  exec 'norm! ^i' . beg . ' '
endfunc

func! comment#uncomment()
  let l:beg = comment#get_ft_comment_str()
  exec "call comment#Substitute('^\\(\\s*\\)" . beg . " ', '\\1')"
  exec "call comment#Substitute('^" . beg . "', '')"
endfunc
