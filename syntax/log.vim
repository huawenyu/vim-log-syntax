" Vim syntax file
" Language:         Generic log files
" Maintainer:       Alex Dzyoba <avd@reduct.ru>
" Latest Revision:  2013-03-08
" Changes:          2013-03-08 Initial version

" Based on messages.vim - syntax file for highlighting kernel messages

if exists("b:current_syntax")
  finish
endif

syn match   log_error           '^\[\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*'
syn match   log_warning         '^\[\(WARNING\|WARN\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\).*'
syn match   log_error           '\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*'
syn match   log_warning         '\c.*\<\(WARNING\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\).*'
syn match   log_trace           '\vT\@.*$'

syn match   ipaddr              /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
"syn match  ipportall            /\(:[0-9]\{1,5}\)/

"syn region log_string          start=/'/ end=/'/ end=/$/ skip=/\\./
"syn region log_string          start=/"/ end=/"/ skip=/\\./
"syn match  log_number          '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'

"syn match   rdocInlineURL       /(https\?)\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
syn match   rdocInlineURL        /\(https\?:\/\/\)\?\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\S\{-}:\?/
"syn match   rdocInlineURL       /\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/

"syn match   log_date           '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *'
"syn match   log_date           '\d\{4}-\d\d-\d\d'

"syn match   log_time           '\d\d:\d\d:\d\d\s*'
"syn match   log_time           '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'

syn match    mKeywordEqNum1     '=\d\+ ' contained
syn match    mKeywordEqNum2     ' \d\+ ' contained

syn keyword  KeywordBasic       ret return accept https dns expires read write close closed free host null nil
syn keyword  KeywordBasic       deny
syn keyword  KeywordBasic       RET RETURN CONNECT ACCEPT HTTP HTTPS FTP DNS EXPIRES READ WRITE SOCK GET CLOSE CLOSED FREE HOST NULL NIL
syn keyword  KeywordBasic       DENY
syn keyword  KeywordBasic       443 8080 80 8010

syn keyword   KeywordEqNum      sock fd policy action nextgroup=mKeywordEqNum1,mKeywordEqNum2 skipwhite

syn match    mKeywordEqStr      '=\w\+' contained
syn keyword   KeywordEqStr      policy action nextgroup=mKeywordEqStr skipwhite

syn keyword  KeywordVals        bypass
syn match    MatchVals          'POLICY DENIED'
syn match    MatchVals          'URL Redirected'
syn match    MatchVals          'no cipher suite found drop='

syn match    MatchNonText       '\v^<wad_http_send_http_line_port>.*$'
syn match    MatchNonText       '\v^<wad_cache_http_send_http_line_port>.*$'
syn match    MatchNonText       '\v^<wad_http_parser>.*$'
syn match    MatchNonText       '\v^<wad_http_parse_uri>.*$'
syn match    MatchNonText       '\v^<wad_http_parse_host>.*$'
syn match    MatchNonText       '\v^<wad_http_request_reader_run>.*$'
syn match    MatchNonText       '\v^<wad_http_parse_check_uri>.*$'
syn match    MatchNonText       '\v^<wad_http_normalize_uri>.*$'
syn match    MatchNonText       '\v^<wad_http_pre_parse_line>.*$'
syn match    MatchNonText       '\v^<wad_cache_http_client_preparse_header>.*$'
syn match    MatchNonText       '\v^<wad_chc_preparse_content_length>.*$'
syn match    MatchNonText       '\v^<wad_cache_http_send_http_line__>.*$'
syn match    MatchNonText       '\v^<wad_http_request_get_line>.*$'
syn match    MatchNonText       '\v^<wad_http_line_get_by_id>.*$'
syn match    MatchNonText       '\v^<wad_http_request_iterate_bufs>.*$'
syn match    MatchNonText       '\v^<wad_chc_preparse_content_type>.*$'
syn match    MatchNonText       '\v^<wad_http_parse_content_type>.*$'
syn match    MatchNonText       '\v^<wad_chc_preparse_user_agent>.*$'
syn match    MatchNonText       '\v^<wad_chc_preparse_referer>.*$'
syn match    MatchNonText       '\v^<wad_chc_preparse_connection>.*$'
syn match    MatchNonText       '\v^<wad_fmem_open>.*$'
syn match    MatchNonText       '\v^<wad_mem_block_pool_alloc>.*$'
syn match    MatchNonText       '\v^<__wad_mem_block_alloc>.*$'
syn match    MatchNonText       '\v^<wad_mem_block_pool_free>.*$'
syn match    MatchNonText       '\v^<__wad_mem_block_free>.*$'
syn match    MatchNonText       '\v^<wad_mem_pool_release>.*$'
syn match    MatchNonText       '\v^<__wad_mem_block_free>.*$'
syn match    MatchNonText       '\v^<wad_mem_block_pool_use>.*$'
syn match    MatchNonText       '\v^<wad_mem_c_free>.*$'
syn match    MatchNonText       '\v^<wad_mem_c_malloc>.*$'
syn match    MatchNonText       '\v^<wad_ssl_port_caps_on_enc_start>.*$'
syn match    MatchNonText       '\v^<wad_ssl_port_caps_on_enc_done>.*$'
syn match    MatchNonText       '\v^<wad_tcp_port_transport_read_block>.*$'
syn match    MatchNonText       '\v^<wad_tcp_port_out_read_block>.*$'
syn match    MatchNonText       '\v^<wad_http_send_http_line>.*$'
syn match    MatchNonText       '\v^<wad_user_node_stats_put>.*$'
syn match    MatchNonText       '\v^<wad_http_stream_get_line>.*$'
syn match    MatchNonText       '\v^<wad_http_client_read_header>.*$'
syn match    MatchNonText       '\v^<wad_http_client_preparse_header>.*$'
syn match    MatchNonText       '\v^<wad_http_split_empty_line>.*$'
syn match    MatchNonText       '\v^<wad_http_client_read_request_line>.*$'
syn match    MatchNonText       '\v^<wad_http_str_canonicalize>.*$'
syn match    MatchNonText       '\v^<wad_hauth_user_node_alloc>.*$'
syn match    MatchNonText       '\v^<wad_user_node_stats_hold>.*$'
syn match    MatchNonText       '\v^<wad_http_conn_request_classify>.*$'

syn match    BigNumber          /\<\d\{8,8}\>/
syn match    BigNumber2         /\<\d\{9,9}\>/
syn match    BigNumber3         /\<\d\{10,}\>/

hi def link  log_string         String
"hi def link log_number         Number
"hi def link log_date           Constant
"hi def link log_time           Type
hi def link  log_error          ErrorMsg
hi def link  log_warning        WarningMsg

hi def link  ipaddr             Identifier
hi def link  ipport             Constant
hi def link  ipportall          Constant

hi def link  KeywordBasic       Keyword
hi def link  KeywordKey         Type
hi def link  KeywordVals        IncSearch
hi def link  MatchVals          IncSearch
hi def link  log_trace          NonText
hi def link  MatchNonText       NonText
hi def link  BigNumber          Identifier
hi def link  BigNumber2         String
hi def link  BigNumber3         Constant

hi def link  rdocInlineURL      Identifier
hi  def link mKeywordEqNum1     WarningMsg
hi  def link mKeywordEqNum2     WarningMsg
hi  def link mKeywordEqStr      IncSearch
hi  def link  KeywordEqNum      Macro
hi  def link  KeywordEqStr      Macro

" fd=45
" syntax match  ccFoobar  "Foo.\{-}Bar"  contains=ccFoo
" syntax match  ccFoo     "Foo"    contained nextgroup=ccFiller
" syntax region ccFiller   matchgroup=ccBar  start="." end="Bar"  contained
"
" hi def link ccFoo          Boolean
" hi def link ccBar          Character
"
" Sample:
" Foo asdfasd Bar asdf Foo asdf Bar asdf
" fff         bbb      fff      bbb

let b:current_syntax = "log"

