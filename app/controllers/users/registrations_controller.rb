class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'You have signed up successfully. However, we could not sign you in because your account is not yet activated.', data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: 'User could not be created successfull', errors: resource.errors.full_messages }
      }
    end
  end
end
