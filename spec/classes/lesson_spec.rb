require 'spec_helper'

describe 'lesson', :type => :class do

  shared_examples_for 'a linux os' do
    context 'with default paramameters' do
      let(:params) {{ }}
      it { should compile.with_all_deps }
      it { should contain_class('lesson::params') }
      it { should contain_class('apt') } 
    end
  end

  context 'supported operating systems' do
    describe 'ubuntu' do
      ['precise', 'trusty'].each do |lsbdistcodename|
        context "#{lsbdistcodename}" do
          let(:facts) {{
            :osfamily => 'Debian',
            :operatingsystem => 'Ubuntu',
            :lsbdistcodename => lsbdistcodename,
            :lsbdistid => 'ubuntu'
          }}
          it_behaves_like 'a linux os' do end
        end
      end
    end
    describe 'debian' do
      ['squeeze', 'wheezy'].each do |lsbdistcodename|
        context "#{lsbdistcodename}" do
          let(:facts) {{
            :osfamily => 'Debian',
            :operatingsystem => 'Debian',
            :lsbdistcodename => lsbdistcodename,
            :lsbdistid => 'Debian'
          }}
          it_behaves_like 'a linux os' do end
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
