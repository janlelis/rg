module Rg
  class ControllerGenerator < ::Rails::Generators::NamedBase
    desc "Creates a new angular controller"
    include Helper


    def create_controller
      template 'controller.coffee.erb', APP_PATH + "/controllers/#{file_name}_controller.coffee"
    end
  end
end