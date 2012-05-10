class rabbitmq::plugins::management_agent {
  rabbitmq::plugin { 'management_agent':
    ensure   => present,
    filename => "rabbitmq_management_agent-${rabbitmq::params::version}.ez",
    require  => Package['wget']
  }
}
