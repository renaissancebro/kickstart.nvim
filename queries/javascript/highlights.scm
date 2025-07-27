; extends

; VS Code-style template literal highlighting - only highlight substitution braces
; Template substitution braces only (like VS Code)
(template_substitution
  "${" @JSTemplateBrace
  "}" @JSTemplateBrace
  (#set! "priority" 115))

; Enhanced bracket highlighting for normal brackets
["(" ")" "[" "]"] @CustomBrackets (#set! "priority" 105)
; Note: {} braces in template literals get special treatment above