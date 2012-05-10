require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # include AppMockHelper
  # mock_app

  def test_columns
    table = List::Table.new(:contacts)
    assert_equal 0, table.columns.size

    table.column :address
    assert_equal 1, table.columns.size
  end

end
