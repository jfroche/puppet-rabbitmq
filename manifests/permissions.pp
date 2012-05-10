# Define: rabbitmq::permissions
# Parameters:
# arguments
#
define rabbitmq::permissions ($ensure = present,
                              $vhost  = '/',
                              $conf   = '.*',
                              $read   = '.*',
                              $write  = '.*') {

  require rabbitmq

  case $ensure {
    present: {
      exec{ "rabbitmqctl-permissions-${name}":
        command => "/usr/sbin/rabbitmqctl set_permissions -p
  '${vhost}' '${name}' '${conf}' '${write}' '${read}'",
        onlyif  => "/usr/bin/test `rabbitmqctl -q list_permissions
  -p '${vhost}' | /bin/grep '^${name}\t${conf}\t${write}\t${read}' |
  wc -l` -eq 0",
      }
    }
    absent: {
      exec{ "rabbitmqctl-permissions-${name}":
        command => "/usr/sbin/rabbitmqctl clear_permissions -p
  '${vhost}' '${name}'",
        onlyif  => "/usr/bin/test `rabbitmqctl -q list_permissions
  -p '${vhost}' | /bin/grep '^${name}\t${conf}\t${write}\t${read} ' |
  wc -l` -gt 0",
      }
    }
    default: {
    }
  }
}
