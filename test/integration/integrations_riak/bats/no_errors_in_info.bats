@test "agent is running" {
  run /etc/init.d/datadog-agent info
  [ "$status" -eq 0 ]
}

@test "riak is running" {
  run /etc/init.d/riak status
  [ "$status" -eq 0 ]
  [ "$output" == "riak is running..." ]
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
