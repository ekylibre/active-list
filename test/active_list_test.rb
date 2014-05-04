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
    assert ActiveList.renderers.any?, "No renderer found"

    for name, renderer in ActiveList.renderers
      assert renderer.instance_methods.include?(:remote_update_code), "Renderer #{name} does not respond to :remote_update_code"
      assert renderer.instance_methods.include?(:build_data_code),    "Renderer #{name} does not respond to :build_data_code"
    end
  end

  def test_existing_exporters
    assert ActiveList.exporters.any?, "No exporter found"

    for name, exporter in ActiveList.exporters
      assert exporter.instance_methods.include?(:send_data_code), "Exporter #{name} does not respond to :send_data_code"
      assert exporter.instance_methods.include?(:mime_type),      "Exporter #{name} does not respond to :mime_type"
      assert exporter.instance_methods.include?(:file_extension), "Exporter #{name} does not respond to :file_extension"
    end
  end

end
