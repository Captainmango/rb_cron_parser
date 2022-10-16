#!/usr/local/bin/ruby -w
# frozen_string_literal: true

require_relative './lib/rb_cron_parser'

input = ARGV.join(' ').split(' ')

raise ArgumentError, 'Incorrect size cron passed in' if input.length > 5

cron_struct = Struct.new(:day, :month, :hour, :minute, :second)
my_cron_struct = cron_struct.new(*input)

RbCronParser::Formatter.format(
  RbCronParser::Parser.parse(my_cron_struct)
)
