@test "procmailrc file rendered" {
  run grep -q "INCLUDERC=/etc/mail/spamassassin/spamassassin-spamc.rc" /etc/procmailrc
  [ "$status" -eq 0 ]
}
