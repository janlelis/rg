module Rg
  class SerializerGenerator < ::Rails::Generators::NamedBase
    desc "Creates a new angular serializer"
    include Helper


    def create_serializer
      template 'serializer.coffee.erb', APP_PATH + "/serializers/#{file_name}_serializer.coffee"
    end
  end
end