require 'fastercsv'
require 'csv'
require 'action_dispatch'
require 'rails'
# require 'active_support/all'

module ActiveList #:nodoc:
  

  CSV = (::CSV.const_defined?(:Reader) ? ::FasterCSV : ::CSV).freeze

  def self.version 
    v = nil
    File.open(File.join(File.dirname(__FILE__), "..", "VERSION")) {|f| v = f.read.strip}
    return v
  end
  VERSION = self.version.freeze

  def self.assets_path
    File.join(File.dirname(__FILE__), "assets", "images")
  end

end

require "active-list/definition"
require "active-list/generator"
require "active-list/action_pack"
require "active-list/rails/engine"
