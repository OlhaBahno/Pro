class Rights

  attr_reader :path, :name
  def initialize(path, name)
    @path = path
    @name = name
  end

  def get_res_string(name_file)
    system("cd #{@path} && icacls #{@name} > #{name_file}.txt")
    written_file = File.open("#{@path}\\#{name_file}.txt")
    written_file.each do |line|
      return line if line.include?'Users'
    end
  end

  def print_rights(rights_line)
    res_string = 'Users have '
    case
    when rights_line.include?('(F)') then res_string += 'full access'
    when rights_line.include?('(N)') then res_string += 'no access'
    when rights_line.include?('(M)') then res_string += 'modify access'
    when rights_line.include?('(RX)') then res_string += 'read-and-execute access'
    when rights_line.include?('(R)') then res_string += 'read access'
    when rights_line.include?('(W)') then res_string += 'write access'
    when rights_line.include?('(D)') then res_string += 'delete access'
    else res_string += '?????'
    end
    res_string
  end

  def display_res(access_string, rights)
    puts("String with access: #{access_string.strip}")
    puts(rights)
  end
end