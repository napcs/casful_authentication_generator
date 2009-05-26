class CasfulAuthenticationGenerator < Rails::Generator::NamedBase
  
  attr_reader :cas_server
  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on('--skip-plugin', "does not install the plugin") { |value| options[:skip_plugin] = value }    
  end
  
  def banner
    "Usage: #{$0} casful_authentication ModelName https://cas.example.com/cas/"
  end
  
  def initialize(runtime_args, runtime_options = {})
    
    super
    runtime_args.shift.inspect
    @cas_server = runtime_args.shift
  end
  
  def manifest
    

    record do |m|
      
      
      unless options[:skip_plugin]
        puts "Installing the Cas plugin from"
        puts "http://rubycas-client.googlecode.com/svn/trunk/rubycas-client"
        `ruby script/plugin install http://rubycas-client.googlecode.com/svn/trunk/rubycas-client --force`
      end
            
      m.template "cas_authentication.rb", "lib/cas_authentication.rb"
      m.template "cas.rb", "config/initializers/cas.rb"

      output = %Q{
        Done! Be sure to add

           include CasAuthentication  

        to your ApplicationController.

        Then just add

          before_filter :login_required

        to any controllers that need CAS authentication.

      }

      puts output
    end
    

    
    
    
  end
   
end