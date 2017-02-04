" Vim syntax file
" Language:         Generic log files
" Maintainer:       Alex Dzyoba <avd@reduct.ru>
" Latest Revision:  2013-03-08
" Changes:          2013-03-08 Initial version

" Based on messages.vim - syntax file for highlighting kernel messages

if exists("b:current_syntax")
  finish
endif

syn match   log_error           '\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*'
syn match   log_warning         '\c.*\<\(WARNING\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\).*'
syn match   log_trace           '\vT\@.*$'

syn match   ipaddr              /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
"syn match  ipportall            /\(:[0-9]\{1,5}\)/
syn match   ipport              /443/
syn match   ipport              /:443/
syn match   ipport              /:80/
syn match   ipport              /:8080/
syn match   ipport              /:8010/

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

syn keyword   KeywordEqNum      sock fd policy action nextgroup=mKeywordEqNum1,mKeywordEqNum2 skipwhite

syn match    mKeywordEqStr      '=\w\+' contained
syn keyword   KeywordEqStr      policy action nextgroup=mKeywordEqStr skipwhite

syn keyword  KeywordVals        bypass
syn match    MatchVals          'POLICY DENIED'

hi def link  log_string         String
"hi def link log_number         Number
"hi def link log_date           Constant
"hi def link log_time           Type
hi def link  log_error          ErrorMsg
hi def link  log_warning        WarningMsg
hi def link  log_trace          Comment

hi def link  ipaddr             Identifier
hi def link  ipport             Constant
hi def link  ipportall          Constant

hi def link  KeywordBasic       Keyword
hi def link  KeywordKey         Type
hi def link  KeywordVals        IncSearch
hi def link  MatchVals          IncSearch

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


" ##########################################
"              TEST TEXT HERE
" ##########################################
syn keyword kNormal           vNormal           
syn keyword kComment          vComment          
syn keyword kCursorLine       vCursorLine       
syn keyword kCursorColumn     vCursorColumn     
syn keyword kColorColumn      vColorColumn      
syn keyword kLineNr           vLineNr           
syn keyword kNonText          vNonText          
syn keyword kSpecialKey       vSpecialKey       
syn keyword kBoolean          vBoolean          
syn keyword kCharacter        vCharacter        
syn keyword kNumber           vNumber           
syn keyword kString           vString           
syn keyword kConditional      vConditional      
syn keyword kConstant         vConstant         
syn keyword kCursor           vCursor           
syn keyword kDebug            vDebug            
syn keyword kDefine           vDefine           
syn keyword kDelimiter        vDelimiter        
syn keyword kDiffAdd          vDiffAdd          
syn keyword kDiffChange       vDiffChange       
syn keyword kDiffDelete       vDiffDelete       
syn keyword kDiffText         vDiffText         
syn keyword kDirectory        vDirectory        
syn keyword kError            vError            
syn keyword kErrorMsg         vErrorMsg         
syn keyword kException        vException        
syn keyword kFloat            vFloat            
syn keyword kFoldColumn       vFoldColumn       
syn keyword kFolded           vFolded           
syn keyword kFunction         vFunction         
syn keyword kIdentifier       vIdentifier       
syn keyword kIgnore           vIgnore           
syn keyword kIncSearch        vIncSearch        
syn keyword kKeyword          vKeyword          
syn keyword kLabel            vLabel            
syn keyword kMacro            vMacro            
syn keyword kMatchParen       vMatchParen       
syn keyword kModeMsg          vModeMsg          
syn keyword kMoreMsg          vMoreMsg          
syn keyword kOperator         vOperator         
syn keyword kPmenu            vPmenu            
syn keyword kPmenuSel         vPmenuSel         
syn keyword kPmenuSbar        vPmenuSbar        
syn keyword kPmenuThumb       vPmenuThumb       
syn keyword kPreCondit        vPreCondit        
syn keyword kPreProc          vPreProc          
syn keyword kQuestion         vQuestion         
syn keyword kRepeat           vRepeat           
syn keyword kSearch           vSearch           
syn keyword kSignColumn       vSignColumn       
syn keyword kSpecialChar      vSpecialChar      
syn keyword kSpecialComment   vSpecialComment   
syn keyword kSpecial          vSpecial          
syn keyword kSpellBad         vSpellBad     
syn keyword kSpellCap         vSpellCap     
syn keyword kSpellLocal       vSpellLocal   
syn keyword kSpellRare        vSpellRare    
syn keyword kStatement        vStatement        
syn keyword kStatusLine       vStatusLine       
syn keyword kStatusLineNC     vStatusLineNC     
syn keyword kStorageClass     vStorageClass     
syn keyword kStructure        vStructure        
syn keyword kTag              vTag              
syn keyword kTitle            vTitle            
syn keyword kTodo             vTodo             
syn keyword kTypedef          vTypedef          
syn keyword kType             vType             
syn keyword kUnderlined       vUnderlined       
syn keyword kVertSplit        vVertSplit        
syn keyword kVisualNOS        vVisualNOS        
syn keyword kVisual           vVisual           
syn keyword kWarningMsg       vWarningMsg       
syn keyword kWildMenu         vWildMenu         



" ##########################################
hi def link kNormal           Normal           
hi def link kComment          Comment          
hi def link kCursorLine       CursorLine       
hi def link kCursorColumn     CursorColumn     
hi def link kColorColumn      ColorColumn      
hi def link kLineNr           LineNr           
hi def link kNonText          NonText          
hi def link kSpecialKey       SpecialKey       
hi def link kBoolean          Boolean          
hi def link kCharacter        Character        
hi def link kNumber           Number           
hi def link kString           String           
hi def link kConditional      Conditional      
hi def link kConstant         Constant         
hi def link kCursor           Cursor           
hi def link kDebug            Debug            
hi def link kDefine           Define           
hi def link kDelimiter        Delimiter        
hi def link kDiffAdd          DiffAdd          
hi def link kDiffChange       DiffChange       
hi def link kDiffDelete       DiffDelete       
hi def link kDiffText         DiffText         
hi def link kDirectory        Directory        
hi def link kError            Error            
hi def link kErrorMsg         ErrorMsg         
hi def link kException        Exception        
hi def link kFloat            Float            
hi def link kFoldColumn       FoldColumn       
hi def link kFolded           Folded           
hi def link kFunction         Function         
hi def link kIdentifier       Identifier       
hi def link kIgnore           Ignore           
hi def link kIncSearch        IncSearch        
hi def link kKeyword          Keyword          
hi def link kLabel            Label            
hi def link kMacro            Macro            
hi def link kMatchParen       MatchParen       
hi def link kModeMsg          ModeMsg          
hi def link kMoreMsg          MoreMsg          
hi def link kOperator         Operator         
hi def link kPmenu            Pmenu            
hi def link kPmenuSel         PmenuSel         
hi def link kPmenuSbar        PmenuSbar        
hi def link kPmenuThumb       PmenuThumb       
hi def link kPreCondit        PreCondit        
hi def link kPreProc          PreProc          
hi def link kQuestion         Question         
hi def link kRepeat           Repeat           
hi def link kSearch           Search           
hi def link kSignColumn       SignColumn       
hi def link kSpecialChar      SpecialChar      
hi def link kSpecialComment   SpecialComment   
hi def link kSpecial          Special          
hi def link kSpellBad         SpellBad     
hi def link kSpellCap         SpellCap     
hi def link kSpellLocal       SpellLocal   
hi def link kSpellRare        SpellRare    
hi def link kStatement        Statement        
hi def link kStatusLine       StatusLine       
hi def link kStatusLineNC     StatusLineNC     
hi def link kStorageClass     StorageClass     
hi def link kStructure        Structure        
hi def link kTag              Tag              
hi def link kTitle            Title            
hi def link kTodo             Todo             
hi def link kTypedef          Typedef          
hi def link kType             Type             
hi def link kUnderlined       Underlined       
hi def link kVertSplit        VertSplit        
hi def link kVisualNOS        VisualNOS        
hi def link kVisual           Visual           
hi def link kWarningMsg       WarningMsg       
hi def link kWildMenu         WildMenu         
" ##########################################


let b:current_syntax = "log"

