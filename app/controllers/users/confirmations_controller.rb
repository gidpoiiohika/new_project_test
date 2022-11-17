class Users::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      render json: {
        status: { code: 200, message: "Your account has been successfully verified", data: resource }
      }, status: :ok
    else
      render json: {
        status: { code: 401, message: "Something went wrong" }
      }, status: :unauthorized
    end
  end
end
