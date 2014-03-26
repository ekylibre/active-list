module ActiveList
  module Rails
    class Engine < ::Rails::Engine
      engine_name "active_list"
      initializer "active_list.integrate_methods" do |app|
        ::ActionController::Base.send(:include, ActiveList::ActionPack::ActionController)
        ::ActionView::Base.send(:include, ActiveList::ActionPack::ViewsHelper)
        files = Dir[File.join(File.dirname(__FILE__), "..", "..", "..", "locales", "*.yml")]
        ::I18n.load_path.concat(files)
      end
    end
  end
end
