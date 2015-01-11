require 'spec_helper'

describe 'jhdc-mail::dovecot' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'upgrades dovecot' do
    expect(chef_run).to upgrade_package('dovecot')
  end

  it 'enables dovecot' do
    expect(chef_run).to enable_service('dovecot')
  end

  it "modifies local.conf" do
    expect(chef_run).to render_file('/etc/dovecot/local.conf')
  end

  %w{master ssl mail}.each do |cfg|
    it "modifies #{cfg}" do
      expect(chef_run).to render_file("/etc/dovecot/conf.d/10-#{cfg}.conf")
    end
  end

  it 'restarts dovecot for local.conf' do
    resource = chef_run.cookbook_file('/etc/dovecot/local.conf')
    expect(resource).to notify('service[dovecot]').to(:restart)
  end

  %w{master ssl mail}.each do |cfg|
    it "restarts dovecot for #{cfg}"  do
      resource = chef_run.template("/etc/dovecot/conf.d/10-#{cfg}.conf")
      expect(resource).to notify('service[dovecot]').to(:restart)
    end
  end

  it "adds port 993/tcp to firewalld" do
    expect(chef_run).to add_firewalld_port("993/tcp")
  end

end
