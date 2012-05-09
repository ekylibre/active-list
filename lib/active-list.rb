require 'csv'

module List #:nodoc:
  
  VERSION = version.freeze

  CSV = (::CSV.const_defined?(:Reader) ? ::FasterCSV : ::CSV).freeze

  def self.version 
    v = nil
    File.open(File.join(File.dirname(__FILE__), "..", "VERSION")) {|f| v = f.read}
    return v
  end

end

require "list/definition"
require "list/generator"
require "list/action_pack"
