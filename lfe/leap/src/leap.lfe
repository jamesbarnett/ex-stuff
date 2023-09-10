(defmodule leap
  (export (leap-year 1)))

(defun leap-year (year)
  (and (== (rem year 4) 0)
    (or (not (== (rem year 100) 0))
        (== (rem year 400) 0))))

