notification :off

guard 'rake', :task => 'spec' do
  watch(%r{^manifests/.+\.pp$})
  watch(%r{^spec/(classes|defines|functions|hosts)/.+_spec\.rb$})
end
