@test "datadog-agent is running" {
  run /etc/init.d/datadog-agent info
  [ "$status" -eq 0 ]
}

@test "memcached is running" {
  run /etc/init.d/memcached status
  [ "$status" -eq 0 ]
}

@test "datadog-agent info returns an OK" {
  run /etc/init.d/datadog-agent info
  [[ "$output" =~ "OK" ]]
}

@test "datadog-agent info returns no ERRORs" {
  # induce a sleep here, since some integrations may not report immediately
  sleep 5

  run /etc/init.d/datadog-agent info
  [[ ! "$output" =~ "ERROR" ]]
}
