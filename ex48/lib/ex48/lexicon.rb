
class Lexicon

    def Lexicon.scan(sentence)
        words = sentence.split
        result = []
        words.each do |word|
            if (["north", "south", "east", "west", "down", "up", "left", "right", "back"].include?(word))
                result.push(["direction", word])
            end
        end
        result
    end
end
