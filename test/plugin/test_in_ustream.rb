require 'helper'

class UstreamInputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    api_key   yourDevKey
    channel   yuiseki
    tag       input.ustream
  ]

  def create_driver(conf=CONFIG,tag='test')
    Fluent::Test::OutputTestDriver.new(Fluent::UstreamInput, tag).configure(conf)
  end

  def test_configure
    assert_raise(Fluent::ConfigError) {
      d = create_driver('')
    }
    d = create_driver %[
      api_key   yourDevKey
      channel   yuiseki
      tag       input.ustream
    ]
    d.instance.inspect
    assert_equal 'yourDevKey', d.instance.api_key
    assert_equal 'yuiseki', d.instance.channel
  end

end
