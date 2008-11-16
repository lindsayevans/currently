# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  class NotFound < StandardError; end 

  helper :all
  
  #rescue_from ActiveRecord::RecordNotFound, NotFound do
  #  render :file => File.join(RAILS_ROOT, "public", "404.html"), :status => :not_found
  #end


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'b94422216227ad73594ffa99d7284ce8'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password

  protected
    before_filter :remove_trailing_slashes
    def remove_trailing_slashes
      if (uri = request.request_uri).length > 1 and uri[-1,1] == '/'
        redirect_to uri.chop, :status => 301
        return false
      end
    end
    
    before_filter :no_www
    def no_www
     if (bad_subdirs = ["ww", "www"]).any? {|s| [s]==request.subdomains(2)}
        redirect_to :host => request.domain(TLD_LENGTH), :status => 301
       return false
     end
    end
    
    def render_404
      render :file => "#{RAILS_ROOT}/public/404.html", :status => :not_found
    end
  
  def d(*o)
    render :text => '<pre>'+YAML::dump(o)+'</pre>'
  end

  #
end
