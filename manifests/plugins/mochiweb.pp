class rabbitmq::plugins::mochiweb {
    rabbitmq::plugin { 'mochiweb':
      ensure   => present,
      filename => "mochiweb-1.3-rmq${rabbitmq::params::version}-git9a53dbd.ez",
      require  => Package['wget']
    }
}
