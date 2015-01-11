require 'spec_helper'

describe 'jhdc-mail::procmail' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "modifies /etc/procmailrc" do
    expect(chef_run).to render_file('/etc/procmailrc')
      .with_content(/INCLUDERC=\/etc\/mail\/spamassassin\/spamassassin-spamc.rc/)
  end
end
