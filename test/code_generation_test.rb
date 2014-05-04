require 'test_helper'

class CodeGenerationTest < ActiveSupport::TestCase

  def test_generate_simple_table
    table = ActiveList::Definition::Table.new(:people)
    assert_nothing_raised do
      table.load_default_columns
    end
    # assert_nothing_raised do
    #   table.generate_controller_method_code
    # end
    # assert_nothing_raised do
    #   table.generate_view_method_code
    # end
  end

  def test_generate_table_with_reflection
    table = ActiveList::Definition::Table.new(:contact)
    assert_nothing_raised do
      table.load_default_columns
    end
    # assert_nothing_raised do
    #   table.generate_controller_method_code
    # end
    # assert_nothing_raised do
    #   table.generate_view_method_code
    # end
  end

end
