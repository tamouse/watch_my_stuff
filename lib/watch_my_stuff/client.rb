#
# WatchMyClient::Client creates an Octokit client for the user
# Author: Tamara Temple <tamouse@gmail.com>
# Time-stamp: <2015-03-02 19:24:25 vagrant>
# Copyright (C) 2015 by Tamara Temple Web Development
#

module WatchMyStuff

  class Client

    attr_accessor :client

    # create an Octokit client, setting auto_paginate
    def initialize
      self.client = Octokit::Client.new(
        login: "tamouse",
        password: WatchMyStuff::Configuration.two_fa
        )
      self.client.auto_paginate = true
    end

    # toss everything we can to the actual client
    def method_missing(meth, *args)
      if client.respond_to?(meth)
        client.send(meth, *args)
      else
        super(meth, *args)
      end
    end
  end
end

      
