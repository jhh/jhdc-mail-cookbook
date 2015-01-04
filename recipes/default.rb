#
# Cookbook Name:: jhdc-mail
# Recipe:: default
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.

include_recipe 'certificate'
include_recipe 'jhdc-mail::dovecot'
include_recipe 'jhdc-mail::postfix'
include_recipe 'jhdc-mail::spamassassin'
include_recipe 'jhdc-mail::procmail'
include_recipe 'jhdc-mail::aliases'

package 'mailx'
