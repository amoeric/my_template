

def set_javascripts
  append_file 'app/assets/javascripts/application.js' do
    "//= require jquery3\n//= require popper\n//= require bootstrap"
  end 
end

def set_stylesheets
  folder_path = 'app/assets/stylesheets/'
  File.rename(folder_path+'application.css', folder_path+'application.scss')
#   append_file folder_path+'application.scss', '@import "bootstrap;"'
    append_file 'app/assets/stylesheets/application.scss' do
      <<~CSS
        @import "bootstrap";
      CSS
    end    
end

def add_bootstrap
  add_gem 
  after_bundle do
    set_javascripts
    set_stylesheets
  end
end

private
def add_gem
  gem 'bootstrap', '~> 4.5.0'
  gem 'jquery-rails'
end