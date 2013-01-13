# Class: rabbitmq
#
#
class rabbitmq {
    require rabbitmq::params
    include rabbitmq::install
    include rabbitmq::config
    include rabbitmq::service
    include rabbitmq::plugins::webmachine
    include rabbitmq::plugins::mochiweb
    include rabbitmq::plugins::rabbitmq_mochiweb
    include rabbitmq::plugins::amqp
    include rabbitmq::plugins::management_agent
    include rabbitmq::plugins::management
}
