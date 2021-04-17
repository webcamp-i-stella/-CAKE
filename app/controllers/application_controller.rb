class ApplicationController < ActionController::Base

 private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(AdminUser)
        root_path #ログイン後は注文履歴一覧に遷移、admin_orderの変数が出来次第変更
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_user
        new_admin_user_session_path
    else
        root_path
    end
  end
end
