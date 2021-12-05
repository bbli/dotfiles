function! s:Test_path_escape()
    call testify#assert#equals("Indexing 5/10" =~# '\v[iI]ndexing\s\d+\/\d+',v:true)
endfunction
call testify#it('need to scape path character in regex', function('s:Test_path_escape'))
