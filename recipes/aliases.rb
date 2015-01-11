#
# Cookbook Name:: jhdc-mail
# Recipe:: aliases
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

pseudo_accounts = {
  'mailer-daemon' =>  'postmaster',
  'bin' =>            'root',
  'daemon' =>         'root',
  'adm' =>            'root',
  'lp' =>             'root',
  'sync' =>           'root',
  'shutdown' =>       'root',
  'halt' =>           'root',
  'mail' =>           'root',
  'news' =>           'root',
  'uucp' =>           'root',
  'operator' =>       'root',
  'games' =>          'root',
  'gopher' =>         'root',
  'nobody' =>         'root',
  'radiusd' =>        'root',
  'nut' =>            'root',
  'dbus' =>           'root',
  'vcsa' =>           'root',
  'canna' =>          'root',
  'wnn' =>            'root',
  'rpm' =>            'root',
  'nscd' =>           'root',
  'pcap' =>           'root',
  'apache' =>         'root',
  'webalizer' =>      'root',
  'dovecot' =>        'root',
  'fax' =>            'root',
  'quagga' =>         'root',
  'radvd' =>          'root',
  'pvm' =>            'root',
  'amandabackup' =>   'root',
  'privoxy' =>        'root',
  'ident' =>          'root',
  'named' =>          'root',
  'xfs' =>            'root',
  'gdm' =>            'root',
  'mailnull' =>       'root',
  'postgres' =>       'root',
  'sshd' =>           'root',
  'smmsp' =>          'root',
  'postfix' =>        'root',
  'netdump' =>        'root',
  'ldap' =>           'root',
  'squid' =>          'root',
  'ntp' =>            'root',
  'mysql' =>          'root',
  'desktop' =>        'root',
  'rpcuser' =>        'root',
  'rpc' =>            'root',
  'nfsnobody' =>      'root',
  'ingres' =>         'root',
  'system' =>         'root',
  'toor' =>           'root',
  'manager' =>        'root',
  'dumper' =>         'root',
  'abuse' =>          'postmaster',
  'newsadm' =>        'news',
  'newsadmin' =>      'news',
  'usenet' =>         'news',
  'ftpadm' =>         'ftp',
  'ftpadmin' =>       'ftp',
  'ftp-adm' =>        'ftp',
  'ftp-admin' =>      'ftp',
  'ftp-bugs' =>       'ftp',
  'ftp' =>            'root',
  'www' =>            'webmaster',
  'webmaster' =>      'root',
  'noc' =>            'root',
  'security' =>       'root',
  'hostmaster' =>     'root',
  'info' =>           'postmaster',
  'marketing' =>      'postmaster',
  'sales' =>          'postmaster',
  'support' =>        'postmaster',
}

node.override['postfix']['aliases'] = pseudo_accounts.merge(node['jhdc_mail']['aliases'])

include_recipe 'postfix::aliases'
