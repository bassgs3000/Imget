#!/bin/bash

chmod +x "$(dirname $0)/imget.rb"
ln -s $(readlink -f "$(dirname $0)/imget.rb") /usr/local/bin/imget