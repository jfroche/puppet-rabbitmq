class rabbitmq::plugins::webmachine {
  rabbitmq::plugin { 'webmachine':
    ensure   => present,
    filename => "webmachine-1.7.0-rmq${rabbitmq::params::version}-hg0c4b60a.ez",
    require  => Package['wget']
  }
}
