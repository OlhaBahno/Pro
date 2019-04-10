module Windows
  def get_bit_version
    line = `systeminfo`
    line_users = ''
    (line.index('System Type:')..line.size).each do |number|
      line_users += line[number] if line[number] =~ /\d/
      break if line[number] == "\n"
    end
    puts "The bit version of your OS is #{line_users}-bit"
  end
end