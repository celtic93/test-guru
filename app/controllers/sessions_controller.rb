class SessionsController < Devise::SessionsController
  after_action :greeting, only: :create

  private

  def greeting
    flash[:success] = "Welcome, #{current_user.first_name}"
  end
end
