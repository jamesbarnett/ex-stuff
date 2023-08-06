module BettysBikeShop exposing (poundsToString, penceToPounds)


import String exposing(fromFloat)

penceToPounds : Int -> Float
penceToPounds pence =
  (Basics.toFloat pence) / 100.0

poundsToString : Float -> String
poundsToString pounds =
  "£" ++ (fromFloat pounds)
