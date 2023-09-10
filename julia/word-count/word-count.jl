function wordcount(sentence)
    wordcountmap = Dict{String,Int64}()
    words = split(lowercase(sentence), r"('\B|\B'|[^\w'])+"; keepempty=false)
    
    for word in words
        wordcountmap[word] = get(wordcountmap, word, 0) + 1
    end

    return wordcountmap
end

