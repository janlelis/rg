module Rg
  module Helper
    extend self


    JS_PATH  = 'app/assets/javascripts'
    APP_PATH = JS_PATH + '/angular'


    def camelizeLower(name)
      name.camelize.sub(/./){ |c| c.downcase }
    end

    def app_name
      @app_name ||= appName.underscore
    end

    def appName
      @appName ||= bowerName || railsName
    end

    def railsName
      camelizeLower(Rails.application.class.parent_name)
    end

    def bowerName
      JSON.parse(
        File.read(
          Rails.root + 'bower.json'
        )
      )["name"]
    rescue
      nil
    end

    def self.included(base)
      base.source_root File.dirname(__FILE__) + '/../generators/rg/templates'
    end
  end
end
