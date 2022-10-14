class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    groups_path
  end
end
