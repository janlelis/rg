module Rg
  class ResourceGenerator < ::Rails::Generators::NamedBase
    desc "Creates a new angular rails resource"
    include Helper


    def create_resource
      template 'resource.coffee.erb', APP_PATH + "/resources/#{file_name}_resource.coffee"
    end
  end
end