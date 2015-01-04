#
# Cookbook Name:: jhdc-mail
# Recipe:: procmail
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.

package 'procmail'

cookbook_file '/etc/procmailrc' do
  source 'procmailrc'
  mode '0644'
end
