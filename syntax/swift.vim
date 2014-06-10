" Vim syntax file
" Language:     Swift
" Maintainer:   Andrew Stiles
" Filenames:    *.swift

if exists("b:current_syntax")
    finish
endif

syn match swiftOperator "->"
syn keyword swiftOperator as in is

syn match swiftComment  "\%(^\s*\)\@<=//.*"
syn region swiftComment start="/\*" end="\*/" contains=swiftComment

syn region swiftString start=+"+ end=+"\|$+ skip=+\\"+ keepend contains=swiftEscapedSeq,swiftInterpolation
syn match swiftEscapedSeq "\\[0\\tnr"']" contained
syn match swiftEscapedSeq "\\x\x\{2}" contained
syn match swiftEscapedSeq "\\u\x\{4}" contained
syn match swiftEscapedSeq "\\U\x\{8}" contained
syn region swiftInterpolation matchgroup=swiftEscapedSeq start="\\(" end=")" skip="\\)" contained contains=TOP

syn keyword swiftDeclarations class deinit enum extension func init let
syn keyword swiftDeclarations protocol static struct subscript typealias var

syn keyword swiftInclude import

syn keyword swiftStatement break case continue default do else fallthrough if
syn keyword swiftStatement for return switch where while

syn keyword swiftBuiltin assert dynamicType false new nil print println self
syn keyword swiftBuiltin Self sort super true Type

syn keyword swiftBuiltinType AnyObject
syn keyword swiftBuiltinType Array Bool Character Dictionary Double Float String
syn keyword swiftBuiltinType Int Int8 Int16 Int32 Int64
syn keyword swiftBuiltinType UInt UInt8 UInt16 UInt32 UInt64

syn keyword swiftSpecial __COLUMN__ __FILE__ __FUNCTION__ __LINE__

syn keyword swiftModifier associativity didSet get infix inout left mutating
syn keyword swiftModifier none nonmutating operator override postfix
syn keyword swiftModifier precedence prefix right set unowned weak willSet

syn match swiftInteger "-\?\<\%([0-9][0-9_]*\)\>\@>[.eE]\@!"
syn match swiftInteger "-\?\<0b\%([01_]\+\>\)\@>\.\@!"
syn match swiftInteger "-\?\<0o\%([0-7_]\+\>\)\@>\.\@!"
syn match swiftInteger "-\?\<0x\%([0-9a-fA-F_]\+\>\)\@>[.pP]\@!"

syn match swiftFloat   "\<[0-9]\+[eE][-+]\?[0-9]\+\>"
syn match swiftFloat   "\<[0-9]\+\.[0-9]\+\%([eE][-+]\?[0-9]\+\)\?\>"
syn match swiftFloat   "\<0x\x\+[pP][-+]\?\x\+\>"
syn match swiftFloat   "\<0x\x\+\.\x\+\%([pP][-+]\?\x\+\)\?\>"

syn match swiftParameter "[[:alnum:]]\+\s*:"

syn match swiftDeclaration "\%(var\|let\)\@<=\s\+\zs[^=;]\+" contains=swiftType
syn match swiftType "\%(:\s*\)\@<=[[:alnum:]]\+" contained

syn region swiftFunctionDefinition start="\%(func\s*\)\@<=[^(]\+(" end=")" contains=swiftType
syn region swiftFunctionReturn start="\%(->\)\@<=\s*" end="{" contains=swiftReturnType
syn match swiftReturnType "[[:alnum:]]\+" contained

syn match swiftClassDefinition "\%(class\)\@<=\s*[^{]*" contains=swiftType

hi def link swiftComment           Comment
hi def link swiftString            String
hi def link swiftEscapedSeq        SpecialChar
hi def link swiftDeclarations      Keyword
hi def link swiftInclude           Include
hi def link swiftStatement         Statement
hi def link swiftBuiltin           Function
hi def link swiftBuiltinType       swiftBuiltin
hi def link swiftSpecial           Special
hi def link swiftModifier          Type
hi def link swiftOperator          Operator
hi def link swiftInteger           Number
hi def link swiftFloat             Number
hi def link swiftStringEOL         Error
hi def link swiftType              Type
hi def link swiftReturnType        Type
hi def link swiftParameter         Operator

let b:current_syntax = "swift"

" vim:set et sts=4 sw=4 ts=8:
