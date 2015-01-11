require 'spec_helper'

describe 'jhdc-mail::aliases' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end
  it "includes postfix::aliases recipe" do
    expect(chef_run).to include_recipe('postfix::aliases')
  end

  it "modifies /etc/aliases" do
    expect(chef_run).to render_file('/etc/aliases').with_content(/support: "postmaster"/)
  end

end
