require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')

class EnumeratedPredicateTest < SemanticAttributes::TestCase
  def setup
    @predicate = Predicates::Enumerated.new(:foo)
  end

  def test_validation
    @predicate.options = [1, 2, '3']

    assert @predicate.validate(1, nil)
    assert @predicate.validate(2, nil)
    assert !@predicate.validate(3, nil), 'type is important'
    assert @predicate.validate('3', nil)
    assert !@predicate.validate(6, nil)
  end

  def test_or_empty
    assert !Predicates::Enumerated.new(:foo).allow_empty?
    assert Predicates::Enumerated.new(:foo, :or_empty => true).allow_empty?
  end
end
