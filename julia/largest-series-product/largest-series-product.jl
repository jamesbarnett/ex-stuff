function largest_product(str, span)
    handle_error(str, span)

    xs = [parse(Int, c) for c in str]

    chunkedranges = filter(x -> first(x) <= length(xs) && last(x) <= length(xs),
                           map(x -> (x:x + span - 1), 1:length(xs)))
    
    reduce(max, [reduce(*, xs[chunkedranges[i]]) 
                 for i in 1:length(chunkedranges)])
end

function handle_error(str, span)
    if isempty(str)
        throw(ArgumentError("str must not be empty"))
    end

    if span > length(str)
        throw(ArgumentError("span cannot be greater than length of str"))
    end

    if span < 0
        throw(ArgumentError("span must be a positive integer"))
    end
end
