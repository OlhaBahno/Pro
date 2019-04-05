require './icacls_files/icacls_work.rb'
module ResultTesting
  def final_result(user_permission)
    user_permission.print_permissions(user_permission.get_users_string)
  end
end