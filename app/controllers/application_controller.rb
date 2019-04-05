class ApplicationController < ActionController::API
    #include ActionController::HttpAuthentication::Token::ControllerMethods
    after_action :set_csrf_cookie

  
    include JWTSessions::RailsAuthorization
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

    protected

        def set_csrf_cookie
            cookies["X-CSRF-Token"] = form_authenticity_token
        end

    private

        def current_user
        @current_user ||= User.find(payload['user_id'])
        end

        def not_authorized
        render json: { error: 'Not authorized' }, status: :unauthorized
        end
end