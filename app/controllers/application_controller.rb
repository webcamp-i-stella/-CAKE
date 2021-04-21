class ApplicationController < ActionController::Base

 private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(AdminUser)
        admin_orders_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    return new_admin_user_session_path if resource_or_scope == :admin_user
    root_path
  end
end
