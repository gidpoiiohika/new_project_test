# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    protected

    def respond_with(resource, _options = {})
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
end
