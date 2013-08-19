@test "agent is running" {
  run /etc/init.d/datadog-agent status
  [ "$status" -eq 0 ]
}

@test "status returns an OK" {
  run /etc/init.d/datadog-agent status
  [ "$status" -eq 0 ]
}

@test "info returns no ERRORs" {
  # induce a sleep here, since some integrations may not report immediately
  sleep 5
  
  run /etc/init.d/datadog-agent info
  [[ ! "$output" =~ "ERROR" ]]
}
