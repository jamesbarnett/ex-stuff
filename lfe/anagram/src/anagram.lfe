(defmodule anagram
  (export (find 2)))

(defun normalize(sa)
  (lists:sort (string:lowercase sa)))

(defun are-anagrams? (word1 word2)
  (and (=/= (string:lowercase word1)
            (string:lowercase word2))
       (== (normalize word1)
           (normalize word2))))

(defun find (word candidates)
  (lists:filter (lambda (x) (are-anagrams? word x)) candidates))
