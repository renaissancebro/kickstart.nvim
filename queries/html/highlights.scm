; extends

; HTML tag names
(tag_name) @HTMLTag (#set! "priority" 110)
(end_tag (tag_name) @HTMLTag) (#set! "priority" 110)

; HTML attributes
(attribute_name) @HTMLAttr (#set! "priority" 105)

; Enhanced bracket highlighting for HTML
["<" ">" "</" "/>"] @CustomBrackets (#set! "priority" 100)