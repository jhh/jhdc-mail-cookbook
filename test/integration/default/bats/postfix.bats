@test "postfix service is running" {
  run systemctl status postfix.service
  [ "$status" -eq 0 ]
}
