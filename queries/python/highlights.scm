; extends

; F-string highlighting
(string
  (string_start) @PythonFString
  (string_content)? @PythonFString
  (string_end) @PythonFString
  (#match? @PythonFString "^f")
  (#set! "priority" 110))

; Enhanced bracket highlighting for all bracket types
["(" ")" "[" "]" "{" "}"] @CustomBrackets (#set! "priority" 105)

; F-string interpolation brackets (highest priority)
(interpolation
  "{" @PythonFString
  "}" @PythonFString
  (#set! "priority" 115))