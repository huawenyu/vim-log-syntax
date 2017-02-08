
function! s:__init__()
    if exists("s:init")
        return
    endif
    let s:ignore = synIDattr(synIDtrans(hlID('Ignore')), 'fg')
    let s:ignore_org = synIDattr(synIDtrans(hlID('Ignore')), 'fg')
    let s:normal = synIDattr(synIDtrans(hlID('Normal')), 'fg')
    let s:dark = 233

    let s:match_all = [
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
        \ '\V DNS request name=',
        \ '\VForward request to server:',
        \ '\V Received response from server:',
        \ '\V\^HTTP/1.1 200 OK',
        \ '\V Forward response from server:',
        \ '^GET\ ',
        \ '\V\.\* accepted \.\* -> \.\* on \d',
        \ '^sock\ \d+\ close',
        \ '\V\.\* tcp \.\* closed on sock \d',
        \]


    let s:match_error = []
    let s:match_flow = []
    let s:match_tcp = []

endfunc
call s:__init__()


function! s:CompareQuickfixEntries(i1, i2)
    if bufname(a:i1.bufnr) == bufname(a:i2.bufnr)
        return a:i1.lnum == a:i2.lnum ? 0 : (a:i1.lnum < a:i2.lnum ? -1 : 1)
    else
        return bufname(a:i1.bufnr) < bufname(a:i2.bufnr) ? -1 : 1
    endif
endfunction

function! s:SortUniqQFList()
    let sortedList = sort(getqflist(), 's:CompareQuickfixEntries')
    let uniqedList = []
    let last = ''
    for item in sortedList
        let this = bufname(item.bufnr) . "\t" . item.lnum
        if this !=# last
            call add(uniqedList, item)
            let last = this
        endif
    endfor
    call setqflist(uniqedList)
endfunction


function! log#_filter(file, f_list) abort
    if &ft !=# 'log'
        return
    endif
    if len(a:f_list) < 2
        return
    endif

    exec 'silent! vimgrep /'. a:f_list[0]. '/\Cj '. a:file
    for mstr in a:f_list[1:]
        exec 'silent! vimgrepadd /'. mstr. '/\Cj '. a:file
    endfor

    call s:SortUniqQFList()
    let w_qf = genutils#GetQuickfixWinnr()
    if w_qf == 0
        copen
    endif
endfunc


function! log#filter(file, type) abort
    if a:type ==# 'all'
        call log#_filter(a:file, s:match_all)
    elseif a:type ==# 'error'
        call log#_filter(a:file, s:match_error)
    elseif a:type ==# 'flow'
        call log#_filter(a:file, s:match_flow)
    elseif a:type ==# 'tcp'
        call log#_filter(a:file, s:match_tcp)
    endif
endfunc


function! log#log(file) abort
    let cft = &ft
    if cft ==# 'log'
        call log#_filter(a:file, s:match_all)
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

