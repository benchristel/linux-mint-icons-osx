#!/usr/bin/env ruby

EXTENSIONS = [
  /\.png$/,
  /\.svg$/,
]

ARGF.each do |line|
  basename = File.basename(line.chomp)
  EXTENSIONS.each do |ext|
    basename.sub!(ext, '')
  end
  puts basename
end
