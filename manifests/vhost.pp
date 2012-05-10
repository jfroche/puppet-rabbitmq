define rabbitmq::vhost ($ensure   = present) {
  case $ensure {
    present: {
      exec{ "rabbitmqctl-vhost-${name}":
        command => "/usr/sbin/rabbitmqctl add_vhost '${name}'",
        onlyif  => "/usr/bin/test `rabbitmqctl -q list_vhosts |
  /bin/grep  '^${name}' | wc -l` -eq 0",
      }
    }
    absent: {
      exec{ "rabbitmqctl-vhost-${name}":
        command => "/usr/sbin/rabbitmqctl delete_vhost '${name}'",
        onlyif  => "/usr/bin/test `rabbitmqctl -q list_vhosts |
  /bin/grep '^${name}' | wc -l` -gt 0",
      }
    }
    default: {
      exec{ "rabbitmqctl-vhost-${name}":
        command => "/usr/sbin/rabbitmqctl add_vhost '${name}'",
        onlyif  => "/usr/bin/test `rabbitmqctl -q list_vhosts |
  /bin/grep  '^${name}' | wc -l` -eq 0",
      }
    }
  }

}

