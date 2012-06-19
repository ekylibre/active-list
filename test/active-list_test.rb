require 'test_helper'

class InvalidRenderer
end

class ActiveListTest < ActiveSupport::TestCase
  # include AppMockHelper

  def test_add_renderer
    assert_raise ArgumentError do
      ActiveList.register_renderer(InvalidRenderer)
    end
  end


  def test_existing_renderers
    assert ActiveList.renderers.size > 0, "No renderer found"

    for name, renderer in ActiveList.renderers
      assert renderer.respond_to?(:remote_update_code)
      assert renderer.respond_to?(:build_data_code)
    end
  end

  def test_existing_exporters
    for name, exporter in ActiveList.exporters
      assert exporter.respond_to?(:send_data_code)
      assert exporter.respond_to?(:mime_type)
      assert exporter.respond_to?(:file_extension)
    end
  end

end
