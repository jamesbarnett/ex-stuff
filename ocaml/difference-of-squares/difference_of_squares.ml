let rec range acc n = 
  match n with 
  0 -> acc |
  _ -> range (n::acc) (n - 1)

let square x =
  x * x

let sum = List.fold_left (+) 0

let square_of_sum x =
  range [] x
  |> sum
  |> square
  
let sum_of_squares x =
  range [] x
  |> List.map square
  |> sum

let difference_of_squares n =
  square_of_sum n - sum_of_squares n
