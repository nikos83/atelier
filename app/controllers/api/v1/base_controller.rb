module Api
  module V1
    class BaseController < ActionController::API
      # before_action :check_login
    
      private
      def check_login
        
        render( json: {Error: 'access denid'}, status: 401) unless headers['X-api-key'] == 'aaa'
      end
      
    end  
  end
    
    
end
