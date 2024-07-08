;; extends

((template_string) @sql
 (#match? @sql "^`\\s*SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP")
 (#offset! @sql 0 1 0 -1)
 (#set! injection.language "sql"))

((string) @sql
 (#match? @sql "^'\\s*SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP")
 (#offset! @sql 0 1 0 -1)
 (#set! injection.language "sql"))

((string) @sql
 (#match? @sql "^\"\\s*SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP")
 (#offset! @sql 0 1 0 -1)
 (#set! injection.language "sql"))
