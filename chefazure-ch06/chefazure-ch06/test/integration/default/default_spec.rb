describe service('Dhcp') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe host('localhost', port: 80, proto: 'tcp') do
  it { should_not be_reachable }
end
