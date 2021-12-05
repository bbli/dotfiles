function! s:Test_expand()
    call testify#assert#not_equals(expand("%:p"),"expand.vim")
endfunction
call testify#it('expand :p modifer does not appear to get absolute path -> nvm the modifier has to be part of the initial string', function('s:Test_expand'))

"You can pass by lambda too -> as long as you give it AN EXPRESSION
    "so if need ex command: wrap in function
" let T2 = {-> testify#assert#equals(expand("%:r"),"expand")}
call testify#it('expand :r(root) modifer should remove extension',{-> testify#assert#equals(expand("%:r"),"expand")})

call testify#it('expand ',{-> testify#assert#equals(expand("%"),"expand.vim")})
