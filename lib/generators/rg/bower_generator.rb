require 'json'

module Rg
  class BowerGenerator < ::Rails::Generators::Base
    desc "Generates a new .bowerrc and an iniatial bower.json"


    class_option :name,      type: :string, default: Rg::Helper.railsName,
      desc: "Name for the new angular project (will be used as angular app name)"
    class_option :directory, type: :string, default: "vendor/assets/bower",
      desc: 'Directory to install your bower components for your .bowerrc'
    class_option :version,   type: :string, default: "0.0.0",
      desc: 'Semantic vesion'
    class_option :license,   type: :string,
      desc: "License to use"
    class_option :authors,   type: :array,
      desc: "Authors"


    def bower_rc(directory = nil)
      create_file '.bowerrc', JSON.pretty_generate(
        directory: options[:directory],
      )
    end

    def bower_json
      output = options.to_hash
      output.delete "directory"
      create_file 'bower.json', JSON.pretty_generate(output)
    end
  end
end