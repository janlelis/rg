module Rg
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.dirname(__FILE__) + '/../tasks/rg.rake'
    end
  end
end
