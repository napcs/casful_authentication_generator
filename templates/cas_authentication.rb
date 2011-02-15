# CasAuthentication helper methods to handle authentication.
# You would be very wise not to modify this file and instead
# include this into a controller of your own and override 
# methods you need to customize.
# 
# class AuthenticatedController < ApplicationController
#   include CasAuthentication
#
#   def access_denied
#     redirect_to root_url, :notice => "You don't have access to that."
#   end
#
#   def locate_user
#     current_user = User.find_by_username(session[:cas_user]
#   end
#
# end
#
module CasAuthentication
  protected
  
  # Inclusion hook to make #current_user and #logged_in?
  # available as ActionView helper methods.
  def self.included(base)
    base.send :helper_method, :current_<%=singular_name %>, :logged_in?
  end
  
  # Helper method for use in your views to see if there's a logged in user
  def logged_in?
    !!current_<%=singular_name %>
  end
  
  # This is meant to be used as a before_filter in your controllers
  # Use this when you need to force a user to log in.
  # invokes the login_from_cas method which will invoke access_denied
  # when no user can be found. 
  def login_required             
    login_from_cas
  end
    
  def login_from_cas
     unless session[:cas_user]
       ## HACK HACK HACK. 
       # This is gonna get called twice. The first time it gets called is the redirection
       # to CAS. This needs to redirect. We will explicitly return
       # if we don't have a cas_user in the session.
       # The second time through the CAS filter will not redirect. The return
       # is not necessary, and in fact we'll never get this far if CAS didn't 
       # let them through, so session[:cas_user] WILL have data in it, so we will 
       # not return. 
        CASClient::Frameworks::Rails::Filter.filter(self)
        return unless session[:cas_user]
     end
     # look them up in our system - based on restful_auth's login_from_session
     self.current_<%=singular_name %> = locate_<%=singular_name %>
     access_denied unless self.current_<%=singular_name%>
     self.current_<%=singular_name %>
  end
  
  # override this in your own controller
  # if you want different rules, for example
  # if you would like to find only active users,
  # or users of a certain role.
  # 
  # By default, you just look them up if their username exists in the session.
  # But this would be a good place to check them against another system, or 
  # do some role checking.
  def locate_<%=singular_name %>
    <%=class_name %>.find_by_username(session[:cas_user]) if session[:cas_user]
  end
  
  
  # feel free to override this method in your own controller
  # to handle situations where they get past CAS but
  # don't get past your own internal database.
  def access_denied
    render :text => "You don't have access to this"
  end

  
  # Accesses the current user from the session. 
  # Future calls avoid the database because nil is not equal to false.
  def current_<%=singular_name %>
    @current_user ||= locate_<%=singular_name %> unless @current_<%=singular_name %> == false
  end

  # Store the given user id in the session.
  def current_<%=singular_name %>=(new_<%=singular_name %>)
    @current_<%=singular_name %> = new_<%=singular_name %> || false
  end
  
  # Store the URI of the current request in the session.
  #
  # We can return to this location by calling #redirect_back_or_default.
  def store_location
    session[:return_to] = request.request_uri
  end

  # Redirect to the URI stored by the most recent store_location call or
  # to the passed default.
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
end
