; extends

; VS Code-style f-string highlighting - only highlight prefix and braces
; F-string prefix (the 'f' before quotes)
(string
  (string_start) @PythonFStringPrefix
  (#lua-match? @PythonFStringPrefix "^f")
  (#set! "priority" 120))

; F-string interpolation braces only (VS Code style)
(interpolation
  "{" @PythonFStringBrace
  "}" @PythonFStringBrace
  (#set! "priority" 125))

; Enhanced bracket highlighting for all other bracket types
["(" ")" "[" "]"] @CustomBrackets (#set! "priority" 105)
; Note: {} braces in f-strings get special treatment above

; Function calls and definitions
(call
  function: (identifier) @Function)
(call  
  function: (attribute
    attribute: (identifier) @Function))
(function_definition
  name: (identifier) @Function)