
function! s:__init__()
    if exists("s:init")
        return
    endif
    let s:ignore = synIDattr(synIDtrans(hlID('Ignore')), 'fg')
    let s:ignore_org = synIDattr(synIDtrans(hlID('Ignore')), 'fg')
    let s:normal = synIDattr(synIDtrans(hlID('Normal')), 'fg')
    let s:dark = 233

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
        \ '\VReceived request from client: ',
        \ '\VForward request to server:',
        \ '^GET\ ',
        \]


endfunc
call s:__init__()


function! log#log(file) abort
    let cft = &ft
    if cft ==# 'log'
        exec 'silent! vimgrep /'. s:match_list[0]. '/\Cj '. a:file

        for mstr in s:match_list[1:]
            exec 'silent! vimgrepadd /'. mstr. '/\Cj '. a:file
        endfor

        let w_qf = genutils#GetQuickfixWinnr()
        if w_qf == 0
            copen
        endif
    else
        set ft=log
    endif
endfunc


function! log#Ignore(mode) abort
    if &ft !=# 'log'
        return
    endif
    if a:mode == 0
        let s:ignore = s:dark
    elseif a:mode == 1
        let s:ignore = s:normal
    elseif a:mode == 2
        let s:ignore = s:ignore_org - ((s:ignore_org + 1 - s:dark) / 2)
    elseif a:mode == 3
        let s:ignore = s:ignore_org
    endif
    exec "hi Ignore ctermfg=". s:ignore
endfunc


function! s:__fini__()
    if exists("s:init")
        return
    endif
endfunc
call s:__fini__()
let s:init = 1

