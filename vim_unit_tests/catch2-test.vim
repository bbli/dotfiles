"Problem is that this gets called with a fnamemodified filename
    "specifically reduced to current directory
function! s:Test_test_file1()
    call testify#assert#equals(test#cpp#catch2#test_file("numeric_test.cpp"),v:true)
endfunction
call testify#it('should say numeric_test.cpp is a test file', function('s:Test_test_file1'))

function! s:Test_test_file2()
    call testify#assert#equals(test#cpp#catch2#test_file("numeric_test.cpp"),v:true)
endfunction
call testify#it('should say FunctionalTest.cpp is a test file', function('s:Test_test_file2'))

function! s:Test_test_file3()
    call testify#assert#not_equals(test#cpp#catch2#test_file("numeric_test.hpp"),v:true)
endfunction
call testify#it('should say numeric_test.hpp is NOT a test file', function('s:Test_test_file3'))

function! s:Test_test_file4()
    call testify#assert#not_equals(test#cpp#catch2#test_file("numeric_test.ccpp"),1)
endfunction
call testify#it('should say numeric_test.ccpp is NOT a test file', function('s:Test_test_file4'))

function! s:Test_test_file5()
    call testify#assert#equals(test#cpp#catch2#test_file("test_catch.cpp"),1)
endfunction
call testify#it('should say test_catch.cpp is a test file', function('s:Test_test_file5'))

function! s:Test_test_case_capture1()
    let l:result = "TEST_CASE( \"Factorials are computed\"   , \"[factorial]\" )  {" =~# g:test#cpp#catch2#test_patterns['test'][0]
    call testify#assert#equals(l:result,1)
endfunction
call testify#it('should match TEST_CASE line',function('s:Test_test_case_capture1'))

function! s:Test_test_case_capture2()
    let l:result = "TEST_CASE_METHOD( VectorFixture, \"sum\", \"[stack]\" )  {" =~# g:test#cpp#catch2#test_patterns['test'][1]
    call testify#assert#equals(l:result,1)
endfunction
call testify#it('should match TEST_CASE_METHOD line',function('s:Test_test_case_capture2'))
