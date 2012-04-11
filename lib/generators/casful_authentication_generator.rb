require 'rails/generators'
require 'rails/generators/named_base'
class CasfulAuthenticationGenerator < Rails::Generators::NamedBase
  desc "This generator adds cas authentication files and installs the rubycas-client plugin optionally. Once run the user must
        fill in specifics on how to find a user once authenticated."
  attr_reader :cas_server
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
  argument :cas_server, :required => true, :desc => "The URL of the CAS server to authenticate through"
  class_option :skip_gem, :type => :boolean, :default => false, :desc => "Skip installing the rubycas-client plugin"
  
  def manifest
    unless options[:skip_gem]
      puts "Installing the rubycas-client gem"
      gem("rubycas-client")
    end
    template "cas_authentication.rb", "lib/cas_authentication.rb"
    template "cas.rb", "config/initializers/cas.rb"
    inject_into_class "app/controllers/application_controller.rb","ApplicationController" do
      "  include CasAuthentication\n"
    end
    output = %Q{
      Done! 

      Be sure to add

        before_filter :login_required

      to any controllers that need CAS authentication.

    }
    if(behavior == :invoke)
      puts output
    end
  end
end
