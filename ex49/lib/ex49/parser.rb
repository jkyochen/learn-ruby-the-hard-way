require "ex49/sentence.rb"

class ParserError < Exception
end

class Parser

    def self.parse_sentence(word_list)
        subj = parse_subject(word_list)
        verb = parse_verb(word_list)
        obj = parse_object(word_list)

        return Sentence.new(subj, verb, obj)
    end

    def self.peek(word_list)
        return nil if !word_list || word_list.empty? || word_list[0].empty?
        word_list[0][0]
    end

    def self.match(word_list, expecting)
        return nil if !word_list || word_list.empty?
        return nil if word_list[0].empty? || word_list[0][0] != expecting
        word_list.shift
    end

    def self.skip(word_list, word_type)
        while peek(word_list) == word_type
            match(word_list, word_type)
        end
    end

    def self.parse_verb(word_list)
        skip(word_list, 'stop')

        raise ParserError.new("Expected a verb next.") if peek(word_list) != 'verb'
        match(word_list, 'verb')
    end

    def self.parse_object(word_list)
        skip(word_list, 'stop')
        next_word = peek(word_list)

        if next_word == 'noun'
            return match(word_list, 'noun')
        elsif next_word == 'direction'
            return match(word_list, 'direction')
        else
            raise ParserError.new("Expected a noun or direction next.")
        end
    end

    def self.parse_subject(word_list)
        skip(word_list, 'stop')
        next_word = peek(word_list)

        if next_word == 'noun'
            return match(word_list, 'noun')
        elsif next_word == 'verb'
            return ['noun', 'player']
        else
            raise ParserError.new("Expected a verb next.")
        end
    end

end
