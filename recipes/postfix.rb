#
# Cookbook Name:: jhdc-mail
# Recipe:: postfix
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.


include_recipe 'postfix::server'

# smtp and submission
include_recipe 'jhdc-firewall::firewalld'

jhdc_firewall_port 25 do
  action :add
end

jhdc_firewall_port 587 do
  action :add
end
