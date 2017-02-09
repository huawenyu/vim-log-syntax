let blacklist = ['c', 'h', 'hpp', 'C', 'c++', 'cpp', 'vim', 'py', 'txt']
au BufNewFile,BufRead *.log set filetype=log
au BufNewFile,BufRead log.* if index(blacklist, &ft) < 0 | set filetype=log
command -count=1 -nargs=0 Log silent! call log#Ignore(<count>)
