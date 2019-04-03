class Permission

  attr_reader :path, :name
  def initialize(path, name)
    @path = path
    @name = name
  end

  def users_string
    line = `cd #{@path} && icacls #{@name}`
    line_users = ''
    (line.index('Users')..line.size).each do |number|
      line_users += line[number]
      break if line[number] == "\n"
    end
    line_users
  end

  def print_permissions(permission_line)
    result_string = 'Users have '
    permission = { '(F)' => 'full access',
                   '(N)' => 'no access',
                   '(M)' => 'modify access',
                   '(RX)' => 'read-and-execute access',
                   '(R)' => 'read access',
                   '(W)' => 'write access',
                   '(D)' => 'delete access' }
    permission.each do |number, value|
      result_string += value if permission_line.include?number
    end
    result_string
  end

  def display_result(access_string, permission)
    puts("String with access: #{access_string}")
    puts(permission)
  end
end