require 'yaml'
# class for working with credentials
module Credential
  def get_credentials
    YAML.load_file('icacls_files/credentials.yml')
  end
end