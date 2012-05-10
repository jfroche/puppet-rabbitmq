# Class: rabbitmq::install::redhat
#
#
class rabbitmq::install::redhat {
  package { 'rabbitmq-server':
            ensure  => '2.6.1-1',
            require => [Yumrepo['arsia','epel'], User['rabbitmq']]
  }
}
