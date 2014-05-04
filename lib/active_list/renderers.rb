# require 'active_support/core_ext/module/attribute_accessors'

module ActiveList

  module Renderers

    def self.[](name)
      ActiveList.renderers[name]
    end

    autoload :AbstractRenderer, 'active_list/renderers/abstract_renderer'
    autoload :SimpleRenderer,   'active_list/renderers/simple_renderer'
  end

end

