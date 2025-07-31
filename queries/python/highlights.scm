; extends

; VS Code-style f-string highlighting - enhanced
; F-string prefix (the 'f' before quotes)
(string
  (string_start) @string.special
  (#lua-match? @string.special "^f")
  (#set! "priority" 130))

; F-string interpolation braces with enhanced priority
(interpolation
  "{" @punctuation.special
  "}" @punctuation.special
  (#set! "priority" 135))

; F-string content expressions
(interpolation
  (identifier) @variable
  (#set! "priority" 125))

(interpolation
  (call
    function: (identifier) @function.call)
  (#set! "priority" 125))

(interpolation
  (attribute
    object: (identifier) @variable
    attribute: (identifier) @variable.member)
  (#set! "priority" 125))

; Format specifiers in f-strings
(format_specifier) @string.escape

; Enhanced bracket highlighting with different colors
; Function call parentheses
(call
  "(" @punctuation.bracket
  ")" @punctuation.bracket
  (#set! "priority" 110))

; List brackets
(list
  "[" @punctuation.bracket
  "]" @punctuation.bracket  
  (#set! "priority" 110))

; Dictionary/set braces (but not f-string braces)
(dictionary
  "{" @punctuation.bracket
  "}" @punctuation.bracket
  (#set! "priority" 110))

(set
  "{" @punctuation.bracket
  "}" @punctuation.bracket
  (#set! "priority" 110))

; Tuple parentheses
(tuple
  "(" @punctuation.bracket
  ")" @punctuation.bracket
  (#set! "priority" 110))

; Subscript brackets
(subscript
  "[" @punctuation.bracket
  "]" @punctuation.bracket
  (#set! "priority" 110))

; Parameter lists
(parameters
  "(" @punctuation.bracket
  ")" @punctuation.bracket
  (#set! "priority" 110))

; Function definitions
(function_definition
  name: (identifier) @function
  (#set! "priority" 115))

; Enhanced function calls
(call
  function: (identifier) @function.call
  (#set! "priority" 115))

(call  
  function: (attribute
    attribute: (identifier) @function.method)
  (#set! "priority" 115))

; Built-in functions
((identifier) @function.builtin
 (#any-of? @function.builtin
   "print" "len" "range" "enumerate" "zip" "map" "filter" 
   "sorted" "sum" "max" "min" "abs" "round" "type" "str" 
   "int" "float" "bool" "list" "dict" "set" "tuple"))

; Constants
((identifier) @constant
 (#any-of? @constant "None" "True" "False" "__name__" "__main__"))