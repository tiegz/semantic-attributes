require File.dirname(__FILE__) + '/test_helper'

class AnnotationSetTest < Test::Unit::TestCase
  def setup
    @set = AnnotationSet.new
  end

  def test_add
    assert_raises ArgumentError do @set.add :foo end
    assert_nothing_raised {@set.add AnnotatedField.new(:foo)}
  end

  def test_find
    # test retrieving a previously set field
    a = AnnotatedField.new(:a)
    @set.add a
    assert_equal a, @set[:a]

    # test creating a field by requesting it
    assert_equal :b, @set[:b].field
  end
end
