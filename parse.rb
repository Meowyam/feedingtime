#!/usr/bin/env ruby

require 'rubygems'
require 'simple-rss'
require 'open-uri'

def bytag('parselist', 'tag')
    feeds = []
    puts 'Please type the tag to parse:'
    tag = gets.strip.downcase
    File.open('parselist') do |x|
        x.each {|line| line.strip! ; return true if line.include? tag}
    end
    
    feeds
end

end

#open list of feeds and read line by line

def main

    feedlist = File.foreach('parselist') do |wholeline|

        wholeline.strip!

        next if wholeline.empty?

        line = wholeline.split(",")
        url = line[0].strip
        tag = line[1].strip

        #parse each feed

        rss = SimpleRSS.parse(open(url).read)

        puts ' '
        puts rss.feed.title
        puts ' '

        rss.items[0..2].each do|i|
            puts "Date: #{i.pubDate or i.published}"
            puts "Title: #{i.title}"
            puts "Link: #{i.link}"
            puts "=" * 80
        end

    end

end

bytag

#main



