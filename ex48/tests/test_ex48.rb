require "ex48/lexicon.rb"
require "test/unit"

class TestLexicon < Test::Unit::TestCase

  def test_directions()
      assert_equal(Lexicon.scan("north"), [['direction', 'north']])
      result = Lexicon.scan("north south east")

      assert_equal(result, [['direction', 'north'],
             ['direction', 'south'],
             ['direction', 'east']])
    end

    def test_verbs()
      assert_equal(Lexicon.scan("go"), [['verb', 'go']])
      result = Lexicon.scan("go kill eat")
      assert_equal(result, [['verb', 'go'],
             ['verb', 'kill'],
             ['verb', 'eat']])
    end

    def test_stops()
      assert_equal(Lexicon.scan("the"), [['stop', 'the']])
      result = Lexicon.scan("the in of")
      assert_equal(result, [['stop', 'the'],
             ['stop', 'in'],
             ['stop', 'of']])
    end

end
