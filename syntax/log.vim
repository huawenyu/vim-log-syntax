" Vim syntax file
" Language:         Generic log files
" Maintainer:       Alex Dzyoba <avd@reduct.ru>
" Latest Revision:  2013-03-08
" Changes:          2013-03-08 Initial version

" Based on messages.vim - syntax file for highlighting kernel messages

if exists("b:current_syntax")
  finish
endif

syn match log_error 	'\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*'
syn match log_warning 	'\c.*\<\(WARNING\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\).*'
syn match log_trace		'\vT\@.*$'
syn match ipaddr        /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
"syn region log_string 	start=/'/ end=/'/ end=/$/ skip=/\\./
"syn region log_string 	start=/"/ end=/"/ skip=/\\./
"syn match log_number 	'0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'

"syn match   log_date '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *'
"syn match   log_date '\d\{4}-\d\d-\d\d'

"syn match   log_time '\d\d:\d\d:\d\d\s*'
"syn match   log_time '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'

syn keyword syntaxElementKeyword  ret return accept https dns expires read write sock close closed free host null nil
syn keyword syntaxElementKeyword1 RET RETURN CONNECT ACCEPT TCP HTTP HTTPS FTP DNS EXPIRES READ WRITE SOCK GET CLOSE CLOSED FREE HOST NULL NIL
syn keyword syntaxElementKeyword2 fd policy wad\_helper\_del \_\_wad\_tcp\_port\_sched_write

hi def link log_string 		String
"hi def link log_number 		Number
"hi def link log_date 		Constant
"hi def link log_time 		Type
hi def link log_error 		ErrorMsg
hi def link log_warning 	WarningMsg
hi def link log_trace   Comment
hi def link ipaddr			Identifier
hi def link syntaxElementKeyword	Keyword
hi def link syntaxElementKeyword1	Keyword
hi def link syntaxElementKeyword2	Keyword

let b:current_syntax = "log"
