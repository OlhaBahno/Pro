require_relative './icacls_work.rb'

begin
  users_permission = Permission.new('C:\\Program Files (x86)\\Entity Framework Tools','eula.rtf')

  line = users_permission.get_users_string
  result = users_permission.print_permissions(line)

  users_permission.display_result(line,result)
end