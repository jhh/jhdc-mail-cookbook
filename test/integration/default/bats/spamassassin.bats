@test "spamassassin service is running" {
  run systemctl status spamassassin.service
  [ "$status" -eq 0 ]
}

@test "spamd pinged" {
  run sa-check_spamd
  [ "$status" -eq 0 ]
}
