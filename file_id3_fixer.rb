#! /usr/bin/ruby

require 'rubygems'
require 'id3lib'

album_name = ARGV[0]
genre = ARGV[1]
files = `ls -b *.mp3`.split("\n")

files.each do |file|
  begin
    print "Processing #{file}... "
    tag = ID3Lib::Tag.new(file)
    file =~ /^(\d+)[^\d](.*?)-(.*?)\.mp3/
    tag.track, tag.artist, tag.title = $1.to_i, $2.strip, $3.strip
    tag.album = album_name
    tag.genre = genre
    tag.update!
    puts " updated."
  rescue Exception => e
    puts "failed (#{e})"
  end
end