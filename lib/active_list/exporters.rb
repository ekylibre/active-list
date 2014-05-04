# require 'active_support/core_ext/module/attribute_accessors'
module ActiveList

  module Exporters

    def self.hash
      ActiveList.exporters
    end

    autoload :AbstractExporter,                'active_list/exporters/abstract_exporter'
    autoload :OpenDocumentSpreadsheetExporter, 'active_list/exporters/open_document_spreadsheet_exporter'
    autoload :CsvExporter,                     'active_list/exporters/csv_exporter'
    autoload :ExcelCsvExporter,                'active_list/exporters/excel_csv_exporter'
  end

end

