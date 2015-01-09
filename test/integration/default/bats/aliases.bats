
@test "additional aliases merged with default" {
  run postalias -q alice hash:/etc/aliases
  [ "$status" -eq 0 ]
}
