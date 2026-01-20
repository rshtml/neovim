; extends

(macro_invocation
  macro: (identifier) @_macro_name
  (#eq? @_macro_name "v")
  (token_tree) @injection.content
  (#set! injection.language "html")
  (#set! injection.include-children)
  (#set! injection.combined)
  (#set! priority 120))

(macro_invocation
  macro: (identifier) @_macro_name
  (#eq? @_macro_name "v")
  (token_tree (token_tree) @injection.content) 
  (#match? @injection.content "^[{]")
  (#set! injection.language "rust")
  (#set! injection.include-children)
  (#set! injection.combined)
  (#set! priority 120))
