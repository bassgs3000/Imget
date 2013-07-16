#!/usr/bin/env ruby

require 'trollop'
require 'open-uri'
require 'fileutils'

opts = Trollop::options do 
  opt :input, "Input list formatted with URLS and folder structure", type: :string, short: "i"
  opt :folders, "Folders that need to be created", type: :string, short: "f"  
end

unless opts[:input_given]
  print "Please supply an input list"
  exit(1)
end

inputlist = open(opts[:input],"rb").readlines
pwd = Dir::pwd + "/"
folders = []
folderindex = []
folderhash = {}

inputlist.each do |line|
  if line.match(/^[\s+][^\n]/)
    folders << line.strip
    folderindex << inputlist.index(line)
    folderhash[line.strip] = inputlist.index(line)
  end
end

folderhash.each do |f,i|
  folder = pwd+f
  if File.exists?(folder)
    #print "Folder #{f} exists\n"
  else
    #print "Created #{folder}\n"
    FileUtils::mkdir_p folder
  end
end