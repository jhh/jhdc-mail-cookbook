#
# Cookbook Name:: jhdc-mail
# Recipe:: dovecot
#
# Copyright 2015, Jeff Hutchison <jeff@jeffhutchison.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package 'dovecot' do
  action :upgrade
end

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
include_recipe 'firewalld::default'
firewalld_port "993/tcp"
