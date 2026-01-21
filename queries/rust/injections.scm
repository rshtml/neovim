;; extends

((macro_invocation
 macro: (identifier) @_macro_name
 (token_tree) @injection.content)
 (#not-eq? @_macro_name "v")
 (#set! injection.language "rust")
 (#set! injection.include-children))

(macro_invocation
  macro: [
    (scoped_identifier
      name: (_) @_macro_name)
    (identifier) @_macro_name
  ]
  (token_tree) @injection.content
  (#not-any-of? @_macro_name "v")
  (#set! injection.language "rust")
  (#set! injection.include-children))

(macro_invocation
  macro: [
    (scoped_identifier
      name: (_) @injection.language)
    (identifier) @injection.language
  ]
  (token_tree) @injection.content
  (#any-of? @injection.language "v")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children))

(macro_invocation
  macro: (identifier) @_macro_name
  (token_tree) @injection.content
  (#eq? @_macro_name "v")
  (#set! injection.language "html")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.combined)
  )

(macro_invocation
  macro: (identifier) @_macro_name
  (#eq? @_macro_name "v")
  (token_tree (token_tree) @injection.content) 
  (#match? @injection.content "^\\{")
  (#set! injection.language "rust")
  (#set! injection.include-children))
