
class Lexicon

    def Lexicon.scan(sentence)
        return [] if sentence.nil?
        result = []
        sentence.split.each do |word|
            if (["north", "south", "east", "west", "down", "up", "left", "right", "back"].include?(word))
                result.push(["direction", word])
            elsif (["go", "stop", "kill", "eat"].include?(word))
                result.push(["verb", word])
            elsif (["the", "in", "of", "from", "at", "it"].include?(word))
                result.push(["stop", word])
            elsif (["door", "bear", "princess", "cabinet"].include?(word))
                result.push(["noun", word])
            elsif (convert_number(word) != nil)
                result.push(["number", convert_number(word)])
            else
                result.push(["error", word])
            end
        end
        result
    end

    def Lexicon.convert_number(object)
      begin
        return Integer(object)
      rescue
        return nil
      end
    end

end
