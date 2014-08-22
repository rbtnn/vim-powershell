" Vim syntax file
" Language:           Windows PowerShell
" Maintainer:         Peter Provost <peter@provost.org>
" Version:            2.10
" Project Repository: https://github.com/PProvost/vim-ps1
" Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327"
" License:            Apache 2.0

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case ignore

syntax sync minlines=100

syntax cluster powershellNotTop contains=@powershellComment,powershellCDocParam,powershellFunction

syntax match powershellCDocParam /.*/ contained
syntax match powershellCommentDoc /^\s*\zs\.\w\+\>/ nextgroup=powershellCDocParam contained
syntax match powershellCommentDoc /#\s*\zs\.\w\+\>/ nextgroup=powershellCDocParam contained
syntax match powershellComment /#.*/ contains=powershellCommentDoc,@Spell
syntax region powershellComment start="<#" end="#>" contains=powershellCommentDoc,@Spell

syntax keyword powershellConditional if else elseif switch default
syntax keyword powershellRepeat while for do until break continue foreach in
syntax match powershellRepeat /\<foreach\>/ nextgroup=powershellBlock skipwhite
syntax match powershellKeyword /\<while\>/ nextgroup=powershellBlock skipwhite
syntax match powershellKeyword /\<where\>/ nextgroup=powershellBlock skipwhite

syntax keyword powershellException begin process end exit
syntax keyword powershellKeyword try catch finally throw
syntax keyword powershellKeyword return filter in trap param data dynamicparam
syntax match powershellKeyword /&/
syntax keyword powershellConstant $true $false $null
syntax match powershellConstant +\$?+
syntax match powershellConstant +\$_+
syntax match powershellConstant +\$\$+
syntax match powershellConstant +\$^+

syntax keyword powershellKeyword class define from using var

syntax match powershellCmdlet /\w\+-\w\+/
syntax keyword powershellKeyword function nextgroup=powershellFunction skipwhite
syntax keyword powershellKeyword filter nextgroup=powershellFunction skipwhite
syntax match powershellFunction /\w\+-*\w*/ contained

syntax match powershellType /\[[a-z0-9_:.]\+\(\[\]\)\?\]/
syntax match powershellStandaloneType /[a-z0-9_.]\+/ contained
syntax keyword powershellScope global local private script contained

syntax match powershellVariable /\$\w\+/
syntax match powershellVariable /\${\w\+:\\\w\+}/
syntax match powershellScopedVariable /\$\w\+:\w\+/ contains=powershellScope
syntax match powershellVariableName /\w\+/ contained

syntax match powershellOperatorStart /-c\?/ nextgroup=powershellOperator
syntax keyword powershellOperator eq ne ge gt lt le like notlike match notmatch replace split /contains/ notcontains contained
syntax keyword powershellOperator ieq ine ige igt ile ilt ilike inotlike imatch inotmatch ireplace isplit icontains inotcontains contained
syntax keyword powershellOperator ceq cne cge cgt clt cle clike cnotlike cmatch cnotmatch creplace csplit ccontains cnotcontains contained
syntax keyword powershellOperator is isnot as join contained
syntax keyword powershellOperator and or not xor band bor bnot bxor contained
syntax keyword powershellOperator f contained

syntax region powershellString start=/"/ skip=/`"/ end=/"/ contains=@powershellStringSpecial
syntax region powershellString start=/'/ skip=/''/ end=/'/

syntax region powershellString start=/@"$/ end=/^"@/ contains=@powershellStringSpecial
syntax region powershellString start=/@'$/ end=/^'@/

syntax match powershellEscape /`./ contained
syntax region powershellInterpolation matchgroup=powershellInterpolationDelimiter start="$(" end=")" contained contains=ALLBUT,@powershellNotTop
syntax region powershellNestedParentheses start="(" skip="\\\\\|\\)" matchgroup=powershellInterpolation end=")" transparent contained
syntax cluster powershellStringSpecial contains=powershellEscape,powershellInterpolation,powershellVariable,powershellBoolean,powershellConstant,powershellBuiltIn

syntax match   powershellNumber "\<\(0[xX]\x\+\|\d\+\)\([KMGTP][B]\)\=\>"
syntax match   powershellNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[dD]\="
syntax match   powershellNumber "\<\d\+[eE][-+]\=\d\+[dD]\=\>"
syntax match   powershellNumber "\<\d\+\([eE][-+]\=\d\+\)\=[dD]\>"

syntax match powershellBoolean "$\%(true\|false\)\>"
syntax match powershellConstant /\$null\>/
syntax match powershellBuiltIn "$^\|$?\|$_\|$\$"
syntax match powershellBuiltIn "$\%(args\|error\|foreach\|home\|input\)\>"
syntax match powershellBuiltIn "$\%(match\(es\)\?\|myinvocation\|host\|lastexitcode\)\>"
syntax match powershellBuiltIn "$\%(ofs\|shellid\|stacktrace\)\>"

if !exists('g:powershell_nofold_blocks')
  syntax region powershellBlock start=/{/ end=/}/ transparent fold
endif

if !exists('g:powershell_nofold_sig')
  syntax region powershellSignature start=/# SIG # Begin signature block/ end=/# SIG # End signature block/ transparent fold
endif

highlight default link powershellNumber Number
highlight default link powershellBlock Block
highlight default link powershellException Exception
highlight default link powershellConstant Constant
highlight default link powershellString String
highlight default link powershellEscape SpecialChar
highlight default link powershellInterpolationDelimiter Delimiter
highlight default link powershellConditional Conditional
highlight default link powershellFunction Function
highlight default link powershellVariable Identifier
highlight default link powershellScopedVariable Identifier
highlight default link powershellVariableName Identifier
highlight default link powershellBoolean Boolean
highlight default link powershellConstant Constant
highlight default link powershellBuiltIn StorageClass
highlight default link powershellType Type
highlight default link powershellScope Type
highlight default link powershellStandaloneType Type
highlight default link powershellNumber Number
highlight default link powershellComment Comment
highlight default link powershellCommentDoc Tag
highlight default link powershellCDocParam Comment
highlight default link powershellOperator Operator
highlight default link powershellRepeat Repeat
highlight default link powershellRepeatAndCmdlet Repeat
highlight default link powershellKeyword Keyword
highlight default link powershellKeywordAndCmdlet Keyword
highlight default link powershellCmdlet Statement

let b:current_syntax = "powershell"

