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

        return match(word_list, 'noun') if next_word == 'noun'
        return match(word_list, 'direction') if next_word == 'direction'
        raise ParserError.new("Expected a noun or direction next.")
    end

    def self.parse_subject(word_list)
        skip(word_list, 'stop')
        next_word = peek(word_list)

        return match(word_list, 'noun') if next_word == 'noun'
        return ['noun', 'player'] if next_word == 'verb'
        raise ParserError.new("Expected a verb next.")
    end

end
