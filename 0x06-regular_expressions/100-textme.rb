#!/usr/bin/env ruby
puts ARGV[0].scan(/from:([+ a-zA-Z 0-9]*)\] \[to:([+ \d]*)\] \[flags:([-:0-9]*)\]/).join(",")
