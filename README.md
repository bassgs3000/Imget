Imget
-----
Imget is a simple solution to downloading and organizing pictures at the same time.

## Requirements
- Ruby >= 1.9.3 
- Trollop >= 2.0

Run bundler to install the gemfile or run `gem install trollop`

** Has not been tested any other Version of Trollop.

## Yaml Format

Imget uses a Yaml file to load in the structure.

The format is as follows:

	Folder/Path/Here/:
	  - http://website.com/image.jpg
	Folder/has/to/end/with/a/forwardslash/:
	  - http://website.com/image.jpg
	Folder/has/no/beginning/forwardslash/:
	  - http://website.com/image.jpg
	  - http://websites.are/indented/with/spaces/not/tabs.gif

The folders should end with a forwardslash and the urls should end in .jpeg(jpg),png, or gif.
The urls need to be indented using spaces, tabs will throw an error.

Yaml has some [documentation](http://yaml.org/spec/1.2/2009-07-21/spec.html#id2576668) that explains it further

## Instructions

To run imget, run the imget script and use the -i parameter to supply the yaml file.

	ruby imget.rb -i inputlist

In this example, the inputlist did not include the .yml extension, but it will look for inputlist.yml 
in the current working directory.
