require 'csv'
require 'action_dispatch'
require 'rails'

module ActiveList

  CSV = ::CSV

  # Build and returns a short UID
  def self.new_uid
    @@last_uid ||= 0
    uid = @@last_uid.to_s(36).to_sym
    @@last_uid += 1
    return uid
  end

  def self.version 
    v = nil
    File.open(File.join(File.dirname(__FILE__), "..", "VERSION")) {|f| v = f.read.strip}
    return v
  end

  VERSION = self.version.freeze

  autoload :Helpers,    'active_list/helpers'
  autoload :Definition, 'active_list/definition'
  autoload :Renderers,  'active_list/renderers'
  autoload :Exporters,  'active_list/exporters'
  autoload :Generator,  'active_list/generator'
  autoload :ActionPack, 'active_list/action_pack'
end

unless "".respond_to? :dig
  class ::String
    def dig(depth = 1)
      return self.strip.gsub(/^/, '  ' * depth) + "\n"
    end
  end
end


require 'active_list/rails/engine'
