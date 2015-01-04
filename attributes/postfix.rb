force_default['postfix']['use_procmail'] = false
force_default['postfix']['main']['recipient_delimiter'] = '+'
force_default['postfix']['main']['alias_maps'] = 'hash:/etc/aliases'

force_default['postfix']['main']['mydestination'] = [
  node['postfix']['main']['mydomain'], 'mail.' + node['postfix']['main']['mydomain'],
  node['postfix']['main']['myhostname'], node['hostname'],
  'localhost.localdomain', 'localhost'
].compact

# smtpd - recieving from network
# TLS
default['postfix']['main']['smtpd_use_tls'] = nil # override the handling by postfix recipe
force_default['postfix']['main']['smtpd_tls_security_level'] = 'may'
force_default['postfix']['main']['smtpd_tls_cert_file'] = "/etc/pki/tls/certs/#{node['fqdn']}.pem"
override['postfix']['main']['smtpd_tls_CAfile'] = "/etc/pki/tls/certs/#{node['hostname']}-bundle.crt"
force_default['postfix']['main']['smtpd_tls_key_file'] = "/etc/pki/tls/private/#{node['fqdn']}.key"
force_default['postfix']['main']['smtpd_tls_session_cache_database'] = 'btree:${data_directory}/smtpd_scache'
# relay and recipient restrictions
force_default['postfix']['main']['smtpd_relay_restrictions'] =
  "permit_mynetworks permit_sasl_authenticated defer_unauth_destination"
force_default['postfix']['main']['smtpd_recipient_restrictions'] =
  "permit_mynetworks permit_sasl_authenticated reject_unauth_destination"
force_default['postfix']['main']['smtpd_helo_required'] = 'yes'
force_default['postfix']['main']['smtpd_helo_restrictions'] =
"permit_mynetworks reject_non_fqdn_helo_hostname reject_invalid_helo_hostname reject_unknown_helo_hostname permit"
force_default['postfix']['main']['disable_vrfy_command'] = 'yes'
# SASL
force_default['postfix']['main']['smtpd_sasl_type'] = 'dovecot'
force_default['postfix']['main']['smtpd_sasl_auth_enable'] = 'yes'
force_default['postfix']['main']['smtpd_tls_auth_only'] = 'yes'
force_default['postfix']['main']['smtpd_sasl_path'] = 'private/auth'
# submission
default['postfix']['master']['submission'] = true

# smtp - sending to network
# TLS
default['postfix']['main']['smtp_use_tls'] = nil # override the handling by postfix recipe
force_default['postfix']['main']['smtp_tls_security_level'] = 'may'
force_default['postfix']['main']['smtp_tls_CAfile'] = '/etc/pki/tls/cert.pem'
force_default['postfix']['main']['smtp_tls_session_cache_database'] = 'btree:${data_directory}/smtp_scache'

# logging
force_default['postfix']['main']['smtpd_tls_received_header'] = 'yes'
force_default['postfix']['main']['smtp_tls_loglevel'] = 1
force_default['postfix']['main']['smtpd_tls_loglevel'] = 1
force_default['postfix']['main']['smtp_tls_note_starttls_offer'] = 'yes'
