require 'spec_helper'

describe 'jhdc-mail::postfix' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "includes postfix::server recipe" do
    expect(chef_run).to include_recipe('postfix::server')
  end

  it 'installs postfix' do
    expect(chef_run).to install_package('postfix')
  end

  it 'enables postfix' do
    expect(chef_run).to enable_service('postfix')
  end

  it "adds port 587/tcp to firewalld" do
    expect(chef_run).to add_firewalld_port("587/tcp")
  end

  it "adds port 25/tcp to firewalld" do
    expect(chef_run).to add_firewalld_port("25/tcp")
  end

  it "modifies /etc/postfix/main.cf" do
    expect(chef_run).to render_file('/etc/postfix/main.cf')
  end

  it "modifies /etc/postfix/master.cf" do
    expect(chef_run).to render_file('/etc/postfix/master.cf')
  end

end
