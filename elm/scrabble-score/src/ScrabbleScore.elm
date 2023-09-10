module ScrabbleScore exposing (scoreWord)

import Dict exposing (Dict)


prepareForScoring : String -> List Char
prepareForScoring word =
    List.map Char.toUpper (String.toList word)


scoreLetterForKey : Char -> Dict String Int -> String -> Int
scoreLetterForKey letter scoreMap key =
    if String.contains (String.fromChar letter) key then
        Maybe.withDefault 0 (Dict.get key scoreMap)

    else
        0


scoreLetter : Char -> Int
scoreLetter letter =
    let
        scoreMap : Dict String Int
        scoreMap =
            Dict.fromList
                [ ( "AEIOULNRST", 1 )
                , ( "DG", 2 )
                , ( "BCMP", 3 )
                , ( "FHVWY", 4 )
                , ( "K", 5 )
                , ( "JX", 8 )
                , ( "QZ", 10 )
                ]

        scores : List Int
        scores =
            List.map (scoreLetterForKey letter scoreMap) (Dict.keys scoreMap)
    in
    Maybe.withDefault 0 (List.maximum scores)


scoreWord : String -> Int
scoreWord x =
    List.sum (List.map scoreLetter (prepareForScoring x))
