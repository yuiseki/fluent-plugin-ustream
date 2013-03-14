module Fluent
  class UstreamInput < Fluent::Input
    Plugin.register_input('ustream', self)

    config_param :api_key, :string, :default => 'yourDevKey';
    config_param :channel, :string
    config_param :tag, :string
    config_param :format, :string, :default => 'viewersNow'

    def initialize
      super
      require 'json'
      require 'open-uri'
    end

    def configure(conf)
      super
      domain = "api.ustream.tv"
      @uri = "http://#{domain}/html/channel/#{@channel}/listAllChannels?key=#{@api_key}"
    end

    def start
      @thread = Thread.new(&method(:run))
    end

    def shutdown
      Thread.kill(@thread)
    end

    def run
      loop do
        json = JSON.parse(open(@uri))
        json["result"].each do |channel|
          if channel["urlTitleName"] == @channel
            message = {
              "viewersNow" => channel["viewersNow"]
              "totalViews" => channel["totalViews"]
              "url"        => channel["url"]
              "status"     => channel["status"]
            }
            get_message(message)
          end
        end
        sleep 60
      end
    end

    def get_message(message)
      $log.info message.inspect
      record = message
      Engine.emit(@tag, Engine.now, record)
    end

  end
end
