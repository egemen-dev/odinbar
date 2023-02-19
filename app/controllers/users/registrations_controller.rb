# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def destroy
      resource.destroy
      redirect_to new_user_registration_path
    end

    protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end
  end
end
