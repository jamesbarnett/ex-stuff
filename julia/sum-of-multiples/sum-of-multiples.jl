function sum_of_multiples(limit, factors)
    sum(filter(i -> any(factor -> i % factor == 0,
                        filter(!=(0), factors)),
                        1:limit-1))
end

