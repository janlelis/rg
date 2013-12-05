module Rg
  class AppGenerator < ::Rails::Generators::NamedBase
    desc "Creates a new angular app config"
    include Helper


    def create_app_config
      template 'app/config.coffee.erb', APP_PATH + "/app/#{file_name}.coffee"
    end
  end
end
