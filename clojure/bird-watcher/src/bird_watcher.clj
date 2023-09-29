(ns bird-watcher)

(def last-week
  [0 2 5 3 7 8 4])

(defn today [birds]
  (first (rseq birds)))

(defn inc-bird [birds]
  (assoc birds (- (.length birds) 1)
         (+ 1 (get birds (- (.length birds) 1)))))

(defn day-without-birds? [birds]
  (> (count (filterv #(= % 0) birds)) 0))

(defn n-days-count [birds n]
  (reduce + (take n birds)))

(defn busy-days [birds]
  (count (filterv #(>= % 5) birds)))

(defn odd-week? [birds]
  (.equals (for [x (range (count birds))
                 :let [y (mod (+ x 1) 2)]] y)
           birds))
