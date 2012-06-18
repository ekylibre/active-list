module ActiveList
  module Rails
    class Engine < ::Rails::Engine
      engine_name "active_list"
      initializer "active_list.integrate_methods" do |app|
        ActionController::Base.send(:include, List::ActionController)
        ActionView::Base.send(:include, List::ViewsHelper)
      end
      # initializer "active_list.add_images_to_asset_paths" do |app|
      #   app.assets.paths << ActiveList.assets_path
      #   app.sass.load_paths << ActiveList.assets_path
      # end
    end
  end
end
