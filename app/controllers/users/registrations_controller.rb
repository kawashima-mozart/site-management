class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy

  def check_guest
    redirect_to root_path if resource.email == 'guest@example.com'
  end
end
