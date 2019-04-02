require_relative './icacls_work.rb'

begin
  new_icacls = Rights.new('C:\\Program Files (x86)\\Entity Framework Tools','eula.rtf')
  string_right = new_icacls.get_res_string('info_file')
  decypher_rights = new_icacls.print_rights(string_right)

  new_icacls.display_res(string_right, decypher_rights)
end