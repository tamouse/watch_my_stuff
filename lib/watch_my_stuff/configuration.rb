#
# WatchMyStuff::Configuration - provides configuration class for app
# Copyright (C) 2015 by Tamara Temple Web Development
# Author: Tamara Temple <tamouse@gmail.com>
# Time-stamp: <2015-03-02 19:26:58 vagrant>
#

require 'yaml'
require 'erb'

module WatchMyStuff

  module Configuration

    class << self
      def user
        @@user
      end

      def user=(arg)
        @@user = arg
      end
      
      def token
        @@token
      end

      def token=(arg)
        @@token = arg
      end
    end

  end

  def self.configure
    @@config = YAML.load(ERB.new(File.read(File.expand_path("../../../config/github.yml", __FILE__))).result)
    Configuration.user  = @@config["user"]
    Configuration.token = @@config["token"]
  end

end
