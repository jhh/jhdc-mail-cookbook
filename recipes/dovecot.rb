#
# Cookbook Name:: jhdc-mail
# Recipe:: default
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.

package 'dovecot'

%w{master ssl mail}.each do |cfg|
  template "/etc/dovecot/conf.d/10-#{cfg}.conf" do
    source "dovecot-#{cfg}.conf.erb"
    mode '0644'
    notifies :restart, 'service[dovecot]'
  end
end

cookbook_file '/etc/dovecot/local.conf' do
  source 'dovecot.local.conf'
    mode '0644'
    notifies :restart, 'service[dovecot]'
end

service 'dovecot' do
  supports status: true, restart: true, reload: true
  action :enable
end

# imaps
include_recipe 'jhdc-firewall::firewalld'
jhdc_firewall_port 993 do
  action :add
end
