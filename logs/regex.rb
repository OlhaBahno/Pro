class Regex
  attr_accessor :file

  def read_file(name_file)
    @file = File.open("config/#{name_file}")
  end

  def find_string(string)
    count_of_matches = 0
    # змінна, аби розуміти скільки разів повторюється рядок. Якщо це значення буде більше 1 то тести fail.
    # Якщо буде 0 - то це значит що строка не існує, а значит тест на відсутність рядка пройде.
    @file.each do |line|
      count_of_matches += 1 if /#{string}/ =~ line
    end
    count_of_matches
  end

  def in_order?(string)
    whole_file_string = ''
    is_o = false
    @file.each do |line|
      whole_file_string += line
    end
    is_o = true if /#{string}/ =~ whole_file_string
    is_o
  end
end
