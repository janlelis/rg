module Rg
  class InstallGenerator < ::Rails::Generators::Base
    desc "Creates a new angular project structure"
    include Helper


    class_option :symlinks, type: :boolean, default: false,
      desc: "Create utility symlinks for working with the angular project"
    class_option :manifests, type: :array, default: [],
      desc: "List sprocket manifests in which angular should be included"
    class_option :libraries, type: :array, default: %w[
        angular
        angularjs-rails-resource
        ./angular/app/main
      ],
      desc: "JavaScript libraries/files to add to manifests"
    class_option :'csrf-token', type: :boolean, default: true,
      desc: "Create Rails CSRF-Token configuration"

    def create_directories
      say 'Creating new angular directory structure'
      %w[
        app
        services
        resources
        controllers
        filters
        directives
      ].each{ |directory|
        create_file APP_PATH + '/' + directory + '/.keep'
      }
    end

    def create_main_coffee
      say "Creating app/main.coffee file"
      template 'app/main.coffee.erb', APP_PATH + '/app/main.coffee'
    end

    def create_settings_coffee
      say "Creating app/settings.coffee file"
      template 'app/settings.coffee.erb', APP_PATH + '/app/settings.coffee'
    end

    def create_csrf_token_coffee
      return unless options[:"csrf-token"]
      say "Creating app/csrf_token.coffee file"
      template 'app/csrf_token.coffee.erb', APP_PATH + '/app/csrf_token.coffee'
    end

    def create_symlinks
      return unless options[:symlinks]
      say "Creating symlinks"
      # create_link APP_PATH + '/views', 'public/html'
      create_link 'angular', APP_PATH
    end

    def inject_into_sprockets
      options[:manifests].each{ |manifest_file|
        manifest_path = JS_PATH + '/' + manifest_file
        if File.exists?(manifest_path)
          manifest_data = File.read(manifest_path)
          options[:libraries].each{ |library|
            unless manifest_data =~ /require #{library}( |$)/
              append_to_manifest manifest_path, library
            end
          }
        else
          create_manifest manifest_path, options[:libraries]
        end
      }
    end

    private

    def manifest_content(config = {})
      Array(config[:libraries]).map{ |library|
        "#{ config[:ext] == '.coffee' ? '#' : '//' }= require #{library}\n"
      }.join
    end

    def append_to_manifest(manifest_path, libraries)
      say "Injecting #{libraries} into manifest at #{manifest_path}"
      append_to_file manifest_path, "\n" + manifest_content(
        libraries: libraries,
        ext: File.extname(manifest_path),
      )
    end

    def create_manifest(manifest_path, libraries)
      say "Creating new manifest at #{manifest_path}"
      create_file manifest_path, manifest_content(
        libraries: libraries,
        ext: File.extname(manifest_path),
      )
    end
  end
end
