require './icacls_files/icacls_work'
require 'rspec'
require './testrail/testrail.rb'
require './icacls_files/final_result_test'
require './icacls_files/credentials.rb'

describe Permission do
  include ResultTesting
  include Credential
  before(:context) do
    @client = TestRail::APIClient.new('https://olhabahno.testrail.io/')
    @client.user = get_credentials['username']
    @client.password = get_credentials['password']
    @users_permission = Permission.new
  end

  it 'should return RX access' do
    @users_permission.path = 'C:\\Program Files (x86)\\Entity Framework Tools'
    @users_permission.name = 'eula.rtf'
    expected_result = 'Users have read-and-execute access'
    expect(final_result(@users_permission)).to eq expected_result
    @client.send_post('add_result_for_case/1/1', {status_id: 1, comment: 'This test worked fine - eula!'})
  end

  it 'should return R access' do
    @users_permission.path = 'C:\\PerfLogs\\Admin'
    @users_permission.name = 'forPAL_000001.blg'
    expected_result = 'Users have read access'
    expect(final_result(@users_permission)).to eq expected_result
    @client.send_post('add_result_for_case/1/2', {status_id: 1, comment: 'This test worked fine - blg file!'})
  end

  it "shouldn't return W access" do
    @users_permission.path = 'C:\\Program Files (x86)\\Entity Framework Tools'
    @users_permission.name = 'eula.rtf'
    expected_result = 'Users have write access'
    expect(final_result(@users_permission)).not_to eq expected_result
  end
end

