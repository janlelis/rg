namespace :rg do
  desc 'Setup bower and angular'
  task :setup do
    sh "rails g rg:bower"
    sh "bower install angular angularjs-rails-resource --save"
    sh "rails g rg:install --manifests=application.js"
  end
end
