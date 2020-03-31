""
" vim-comment.vim
" Copyright © 2020
" Author: ThatsWhatSheCoded <https://github.com/ThatsWhatSheCoded>
" Description: Remaps to comment/uncomment lines of code/text
""

" Comment line in Normal Mode
nnoremap <silent><leader>c :call comment#comment()<CR>

" Comment line in Visual Mode
vnoremap <silent><leader>c :call comment#comment()<CR>

" Uncomment line in Normal Mode
nnoremap <silent><leader>u :call comment#uncomment()<CR>

" Uncomment line in Visual Mode
vnoremap <silent><leader>u :call comment#uncomment()<CR>
