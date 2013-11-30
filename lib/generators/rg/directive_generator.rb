module Rg
  class DirectiveGenerator < ::Rails::Generators::NamedBase
    desc "Creates a new angular directive"
    include Helper


    def create_directive
      template 'directive.coffee.erb', APP_PATH + "/directives/#{file_name}.coffee"
    end
  end
end