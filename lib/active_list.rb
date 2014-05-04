require 'csv'
require 'action_dispatch'
require 'rails'
# require 'compass-rails'
require 'code_string'

module ActiveList

  CSV = ::CSV

  # Build and returns a short UID
  def self.new_uid
    @@last_uid ||= 0
    uid = @@last_uid.to_s(36).to_sym
    @@last_uid += 1
    return uid
  end

  autoload :VERSION,    'active_list/version'
  autoload :Helpers,    'active_list/helpers'
  autoload :Definition, 'active_list/definition'
  autoload :Renderers,  'active_list/renderers'
  autoload :Exporters,  'active_list/exporters'
  autoload :Generator,  'active_list/generator'
  autoload :ActionPack, 'active_list/action_pack'

  mattr_reader :renderers
  @@renderers = {}

  def self.register_renderer(name, renderer)
    raise ArgumentError.new("A renderer must be ActiveList::Renderers::Renderer") unless renderer < ActiveList::Renderers::AbstractRenderer
    @@renderers[name] = renderer
  end

  mattr_reader :exporters
  @@exporters = {}

  def self.register_exporter(name, exporter)
    raise ArgumentError.new("ActiveList::Exporters::AbstractExporter expected (got #{exporter.name}/#{exporter.ancestors.inspect})") unless exporter < ActiveList::Exporters::AbstractExporter
    @@exporters[name] = exporter
  end

end

ActiveList.register_renderer(:simple_renderer, ActiveList::Renderers::SimpleRenderer)

ActiveList.register_exporter(:ods,  ActiveList::Exporters::OpenDocumentSpreadsheetExporter)
ActiveList.register_exporter(:csv,  ActiveList::Exporters::CsvExporter)
ActiveList.register_exporter(:xcsv, ActiveList::Exporters::ExcelCsvExporter)


unless "string".respond_to? :dig
  class ::String
    def dig(depth = 1)
      return self.strip.gsub(/^/, '  ' * depth) + "\n"
    end
  end
end


require 'active_list/rails/engine'
