module Rg
  class ServiceGenerator < ::Rails::Generators::NamedBase
    desc "Creates a new angular service"
    include Helper


    def create_service
      template 'service.coffee.erb', APP_PATH + "/services/#{file_name}.coffee"
    end
  end
end
