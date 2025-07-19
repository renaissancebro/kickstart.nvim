; extends

; F-string highlighting
(formatted_string
  ["{" "}"] @punctuation.bracket.fstring
  (#set! "priority" 105))

(interpolation
  ["{" "}"] @punctuation.bracket.fstring
  (#set! "priority" 105))

(format_expression
  ["{" "}"] @punctuation.bracket.fstring
  (#set! "priority" 105))