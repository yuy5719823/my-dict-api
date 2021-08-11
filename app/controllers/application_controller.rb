class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        # skip_before_action :verify_authenticity_token, if: :devise_controller?

        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        end
end
