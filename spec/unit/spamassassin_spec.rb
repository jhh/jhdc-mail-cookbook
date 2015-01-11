require 'spec_helper'

describe 'jhdc-mail::spamassassin' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "includes yum-epel::default recipe" do
    expect(chef_run).to include_recipe('yum-epel::default')
  end

  %w(spamassassin perl-Razor-Agent perl-Digest-SHA1).each do |p|
    it "upgrades #{p}" do
      expect(chef_run).to upgrade_package(p)
    end
  end

  it 'enables and starts spamassassin' do
    expect(chef_run).to enable_service('spamassassin')
    expect(chef_run).to start_service('spamassassin')
  end

  it "modifies /etc/sysconfig/sa-update" do
    expect(chef_run).to render_file('/etc/sysconfig/sa-update')
    .with_content(/SAUPDATE=yes/)
  end

end
