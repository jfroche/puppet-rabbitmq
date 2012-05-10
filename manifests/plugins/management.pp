class rabbitmq::plugins::management {
  rabbitmq::plugin { 'management':
    ensure   => present,
    filename => "rabbitmq_management-${rabbitmq::params::version}.ez",
    require  => Package['wget']
  }
}
