module Rg
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path "../templates", __FILE__
    JS_PATH  = 'app/assets/javascripts'
    APP_PATH = JS_PATH + '/app'
    desc "Creates a new angular project structure"

    class_option :symlinks, type: :boolean, default: false,
      desc: "Create utility symlinks for working with the angular project"
    class_option :manifests, type: :array, default: [],
      desc: "List sprocket manifests in which angular should be included"
    class_option :libraries, type: :array, default: %w[
        angular
        angularjs-rails-resource
        ./app/app
      ],
      desc: "JavaScript libraries/files to load in manifests"


    def create_app_coffee
      say "Creating new app.coffee file"
      copy_file 'app.coffee', APP_PATH + '/app.coffee'
    end

    def create_directories
      say 'Creating new angular directory structure'
      %w[
        controllers
        resources
        directives
        services
        filters
      ].each{ |directory|
        create_file APP_PATH + '/' + directory + '/.keep'
      }
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
