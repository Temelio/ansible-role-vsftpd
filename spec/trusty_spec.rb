require 'serverspec'

describe 'vsftpd Ansible role' do

    # Tests
    #------

    it 'installs the right version of Ubuntu' do
        expect(get_os_version()).to include('Ubuntu 14.04')
    end

    describe package('vsftpd') do
        it { should be_installed }
    end

    # Functions
    #----------

    # Get os version of container
    def get_os_version
        command('lsb_release -a').stdout
    end
end

