require 'spec_helper'

describe 'lesson', :type => :class do

  shared_examples_for 'a linux os' do
    context 'with default paramameters' do
      let(:params) {{ }}
      it { should compile.with_all_deps }
      it { should contain_class('lesson::params') }
    end
  end

  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "lesson class without any parameters on #{osfamily}" do
        let(:facts) {{ :osfamily => osfamily, }}
        it_behaves_like 'a linux os' do
        end
      end
    end
  end
  context 'unsupported operating systems' do
    let(:facts) {{ :osfamily => 'xxx' }}
    it 'should fail if operating system family not supported' do
      expect { should compile }.to raise_error(/not supported/)
    end
  end
end
