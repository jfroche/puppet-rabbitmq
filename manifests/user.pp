# Define: rabbitmq::user
# Parameters:
# $ensure = present,
# $password = false,
# $vhost = '/',
# $conf = '.*',
# $read = '.*',
# $write = '.*'
#
define rabbitmq::user ($ensure   = present,
$password = false,
$vhost    = '/',
$conf     = '.*',
$read     = '.*',
$write    = '.*') {

  require rabbitmq

  case $ensure {
    present: {
      if ! $password {
        fail "Must pass password to rabbitmq::user $name"
      }
      exec{ "rabbitmqctl-user-${name}":
        command => "/usr/sbin/rabbitmqctl add_user '${name}' '${password}'",
        onlyif  => "/usr/bin/test `rabbitmqctl -q list_users | /bin/grep  '^${name}\t' | wc -l` -eq 0",
      }
    }
    absent: {
      exec{ "rabbitmqctl-user-${name}":
        command => "/usr/sbin/rabbitmqctl delete_user '${name}'",
        onlyif  => "/usr/bin/test `rabbitmqctl -q list_users | /bin/grep '^${name}\t' | wc -l` -gt 0",
      }
    }
    default: {
      fail 'Ensure must be present or absent'
    }
  }

  rabbitmq::permissions { $name:
    ensure => $ensure,
    vhost  => $vhost,
    conf   => $conf,
    read   => $read,
    write  => $write,
  }
}
