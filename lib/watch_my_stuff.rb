require 'octokit'
require 'watch_my_stuff/cli'
require 'watch_my_stuff/configuration'
require 'watch_my_stuff/client'
require "watch_my_stuff/version"

module WatchMyStuff

  # do the work
  def self.run!
    WatchMyStuff.configure
    client = WatchMyStuff::Client.new
    repos = client.repositories

    puts "WatchMyStuff - subscribe to all my repos. Version: #{WatchMyStuff::VERSION}\n"

    repos.map{|r| r[:full_name]}.each do |repo|
      print "Updating subscription for #{repo} "
      client.update_subscription(repo, {subscription: true})
      sub = client.subscription(repo)
      print " subscribed: #{sub[:subscribed]}"
      puts
    end

    puts "\nComplete."
  end
end
