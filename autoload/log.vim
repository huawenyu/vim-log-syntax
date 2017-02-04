
function! s:__init__()
    if exists("s:init")
        return
    endif
    let s:match_list = [
        \ '\V deny ',
        \ '\V denied ',
        \ '\V denied!',
        \ '\V DENIED ',
        \ '\V bypass ',
        \ 'bypassing[^=]\$',
        \ '\V blocked.\?',
        \ '\Vunexpected ',
        \ '\Vunexpect ',
        \ '\VUNEXPECTED!',
        \ '\Vreject ',
        \ '\Vunknown ',
        \ '\V exempted ',
        \ '\V failed!',
        \ '\V failed ',
        \ '\V timeout ',
        \ '\V POLICY DENIED',
        \ '\V no policy to match ',
        \ 'route\ to\ .*\ failure\ ',
        \ '\Vdns resolve failed ',
        \ '\Vfound warning ovrd',
        \ '\Vcannot find related associate ',
        \ '\Vfailed to activate UDP expectation ',
        \ '\Vfound in ssl-exempt list',
        \ '\VFailed to send url filter request!',
        \ '\VFailed to commit override check request',
        \ '\VGenerating replacement message',
        \ '\V whitelist result: ',
        \ '\V blacklist result: ',
        \ '\V local urlfilter result: ',
        \ '\Vmemory corruption',
        \ 'WAD unix stream stream .* sendmsg error ',
        \ '\VFail to ',
        \ '\Vfailed to start IPS session',
        \ '^GET\ ',
        \]

endfunc
call s:__init__()


function! log#Search(file) abort
    exec 'silent! vimgrep /'. s:match_list[0]. '/\Cj '. a:file

    for mstr in s:match_list[1:]
        exec 'silent! vimgrepadd /'. mstr. '/\Cj '. a:file
    endfor

    let w_qf = genutils#GetQuickfixWinnr()
    if w_qf == 0
        copen
    endif
endfunc


function! s:__fini__()
    if exists("s:init")
        return
    endif
endfunc
call s:__fini__()
let s:init = 1

