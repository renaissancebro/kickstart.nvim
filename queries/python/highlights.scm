; extends

; Simple test - highlight ALL brackets in python files
["{" "}"] @punctuation.bracket.fstring (#set! "priority" 105)