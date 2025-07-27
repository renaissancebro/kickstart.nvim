; extends

; Template literals (backticks) highlighting
(template_string) @JSTemplateLiteral (#set! "priority" 110)

; Enhanced bracket highlighting
["(" ")" "[" "]" "{" "}"] @CustomBrackets (#set! "priority" 105)

; Template substitution brackets
(template_substitution
  "${" @JSTemplateLiteral
  "}" @JSTemplateLiteral
  (#set! "priority" 115))