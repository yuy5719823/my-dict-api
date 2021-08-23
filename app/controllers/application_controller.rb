class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        # skip_before_action :verify_authenticity_token, if: :devise_controller?
        before_action :configure_permitted_parameters, if: :devise_controller?


        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
                devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        end
end
