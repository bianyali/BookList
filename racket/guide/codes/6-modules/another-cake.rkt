(module another-cake racket
  (require "cake.rkt")
  (provide y)
  (set-box! y 12)
  (println "In another cake"))
