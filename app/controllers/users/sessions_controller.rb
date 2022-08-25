class Users::SessionsController < Devise::SessionsController
    respond_to :json, :html
    private
    def respond_with(resource, _opts = {})
      render json: { 
        message: 'you are Logged in',
        user: current_user
        }, status: :ok
    end
    def respond_to_on_destroy
      current_user ? log_out_success : log_out_failure
    end
    def log_out_success
      render json: { message: "Logged out." }, status: :ok
    end
    def log_out_failure
      render json: { message: "Logged out failure."}, status: :unauthorized
    end
end