# # encoding: utf-8

# Inspec test for recipe myiis::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Test that Port 80 is open
describe port(80) do
  it { should be_listening }
end

# Test that you web page says Hello, world Windows!
describe command('Invoke-WebRequest http://localhost') do
  its(:stdout) { should match /Hello, world Windows!/ }
end

# Windows Versions - Check for Min of Win 2012
# Win2016 - NT 10.0 | Win 2012 R2 - NT 6.3 | Win 2012 - NT 6.2
#

control 'WINDOWS VERSION' do
  impact 0.8
  title 'This test checks for a minimum Windows version of 2012 - NT 6.2.0'

  describe os.family do
    it { should eq 'windows' }
  end

  describe os.name do
    it { should eq 'windows_server_2012_r2_standard' }
  end

  describe os.release do
    it { should > '6.2' }
  end
end