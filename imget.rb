#!/usr/bin/env ruby

require 'trollop'
require 'open-uri'
require 'fileutils'
require 'yaml'

opts = Trollop::options do 
  opt :input, "Input list formatted with URLS and folder structure", type: :string, short: "i"
end

unless opts[:input_given]
  print "Please supply an input list\n"
  exit(1)
end
pwd = Dir::pwd + "/"

if opts[:input].match(/\.yml/)
  inputname = opts[:input]
else
  inputname = opts[:input]+".yml"
end

p inputname

unless File.exists?("#{pwd}#{inputname}")
  print "#{pwd}#{inputname} does not exist or has insufficient permissions\n"
  exit(2)
end

inputlist = YAML.load_file(pwd+inputname)

p inputlist

inputlist.each do |k,v|
  tgt = pwd+k
  unless File.exist?(tgt)
    FileUtils::mkdir_p(tgt)
  end

  v.each do |link|
    urlchunks = link.split("/")
    filename = urlchunks.last
    unless File.exists?(tgt+filename)
      begin
        print "Retrieving #{filename}\n"
        filename.match(/[a-zA-Z1-9]+\.(?:jpe?g|gif|png)/i)[0]
        filesrc = open(link).read
        file = open(tgt+filename,"wb")
        file.write(filesrc)
        file.close
      rescue NoMethodError
        print "There seems to be an error processing #{filename}. Please Review #{inputname} for errors.\n"
      rescue OpenURI::HTTPError => e
        print "There seems to be an error processing #{filename}. #{e.to_s}\n"
      end
    else
      print "#{filename} already exists, skipping\n"
    end
  end
end