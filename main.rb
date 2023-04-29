#!/usr/local/bin/ruby -w
# frozen_string_literal: true

require './lib/rb_cron_parser'

input = ARGV.join(' ').split(' ')

puts "hello"

raise ArgumentError, 'Incorrect size cron passed in' if input.length > 6

# @param cron [RbCronParser::Cron]
cron = RbCronParser::Cron.new(*input)
cron.test2

RbCronParser::Formatter.format(
  RbCronParser::Parser.parse(cron)
)
 
