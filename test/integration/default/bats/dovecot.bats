@test "dovecot service is running" {
  run systemctl status dovecot.service
  [ "$status" -eq 0 ]
}
