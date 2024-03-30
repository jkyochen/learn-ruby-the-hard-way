require "ex49/parser.rb"
require "ex49/lexicon.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase

  def test_normal()
    sentence = parse_sentence(Lexicon.scan("bear eat door"))
    assert_equal(sentence.subject, 'bear');
    assert_equal(sentence.verb, 'eat');
    assert_equal(sentence.object, 'door');
  end

  def test_no_subject()
    sentence = parse_sentence(Lexicon.scan("eat door"))
    assert_equal(sentence.subject, 'player');
    assert_equal(sentence.verb, 'eat');
    assert_equal(sentence.object, 'door');
  end

  def test_no_verb()
    assert_raise(ParserError.new("Expected a verb next.")) {
      parse_sentence(Lexicon.scan("bear door"))
    }
  end

end
