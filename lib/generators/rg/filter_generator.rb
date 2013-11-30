module Rg
  class FilterGenerator < ::Rails::Generators::NamedBase
    desc "Creates a new angular filter"
    include Helper


    def create_filter
      template 'filter.coffee.erb', APP_PATH + "/filters/#{file_name}.coffee"
    end
  end
end