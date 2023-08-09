module PhoneNumber exposing (getNumber)


getNumber : String -> Maybe String
getNumber phoneNumber =
    let
        sanitized =
            String.filter Char.isDigit phoneNumber

        length =
            String.length sanitized

        ones =
            String.indices "1" sanitized

        zeros =
            String.indices "0" sanitized
    in
    case length of
        10 ->
            if
                List.member 0 zeros
                    || List.member 3 zeros
                    || List.member 0 ones
                    || List.member 3 ones
            then
                Nothing

            else
                Maybe.Just sanitized

        11 ->
            if
                List.member 1 zeros
                    || List.member 4 zeros
                    || List.member 1 ones
                    || List.member 4 ones
                    || not (List.member 0 ones)
            then
                Nothing

            else
                Maybe.Just (String.right 10 sanitized)

        _ ->
            Nothing
