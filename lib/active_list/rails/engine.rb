module ActiveList
  module Rails
    class Engine < ::Rails::Engine
      engine_name "active_list"
      initializer "active_list.integrate_methods" do |app|
        ::ActionController::Base.send(:include, ActiveList::ActionPack::ActionController)
        ::ActionView::Base.send(:include, ActiveList::ActionPack::ViewsHelper)
        ::I18n.load_path += Dir[File.join(File.expand_path(File.dirname(__FILE__)), "..", "..", "..", "locales", "*.yml")]
      end
    end
  end
end
