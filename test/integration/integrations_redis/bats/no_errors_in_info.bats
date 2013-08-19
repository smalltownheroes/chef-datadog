@test "agent is running" {
  run /etc/init.d/datadog-agent info
  [ "$status" -eq 0 ]
}

@test "info returns an OK" {
  run /etc/init.d/datadog-agent info
  [[ "$output" =~ "OK" ]]
}

@test "info returns no ERRORs" {
  # induce a sleep here, since some integrations may not report immediately
  sleep 5
  
  run /etc/init.d/datadog-agent info
  [[ ! "$output" =~ "ERROR" ]]
}
