module ActiveList
  module Rails
    class Engine < ::Rails::Engine
      initializer "active_list.integrate_methods" do |app|
        ActionController::Base.send(:include, List::ActionController)
        ActionView::Base.send(:include, List::ViewsHelper)
      end
    end
  end
end
