require 'rspec'
require './logs/regex.rb'

describe 'Regex' do
  before do
    @regex_work = Regex.new
    @regex_work.read_file('logfile.txt')
  end

  it 'should return 0 as string does not exist' do
    count = @regex_work.find_string('does_not_existed_string')
    expected_result = 0
    expect(count).to eq expected_result
  end

  it 'should return 1 as string repeats one time' do
    count = @regex_work.find_string('ceqVIBdKQ3iEvCkJ7Sco')
    expected_result = 1
    expect(count).to eq expected_result
  end

  it 'should return value that is more than 100' do
    count = @regex_work.find_string('aa')
    expected_result = 100
    expect(count).to be > expected_result
  end

  it 'should return true if in order' do
    count = @regex_work.in_order?('h7jMlG9zC7JrZyiDs5Z1\s(\w+\s)*SbqsrZxuK6KiywKcdzwZ')
    expected_result = true
    expect(count).to eq expected_result
  end
end