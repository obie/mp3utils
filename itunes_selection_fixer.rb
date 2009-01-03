#! /usr/bin/ruby

require 'rubygems'
require 'rbosa'

album_name = ARGV[0]

itunes = OSA.app('itunes')
itunes.selection.each do |track|
  filename = track.location
  track.name =~ /^(\d+)[^\d](.*?)-(.*)/
  track.track_number, track.artist, track.name = $1.to_i, $2.strip, $3.strip
  track.album = album_name
end
