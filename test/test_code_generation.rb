require 'helper'

class TestCodeGeneration < Test::Unit::TestCase
  #include AppMockHelper
  #mock_app

  def setup
  end

  def test_generate_simple_table
    table = List::Table.new(:people)
    assert_nothing_raised do
      table.load_default_columns
    end
    assert_nothing_raised do
      table.generate_controller_method_code
    end
    assert_nothing_raised do
      table.generate_view_method_code
    end
  end

  def test_generate_table_with_reflection
    table = List::Table.new(:contact)
    assert_nothing_raised do
      table.load_default_columns
    end
    assert_nothing_raised do
      table.generate_controller_method_code
    end
    assert_nothing_raised do
      table.generate_view_method_code
    end
  end

end
