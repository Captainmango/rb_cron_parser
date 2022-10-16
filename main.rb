#!/usr/local/bin/ruby -w
# frozen_string_literal: true

require './lib/rb_cron_parser'

input = ARGV.join(' ').split(' ')

raise ArgumentError, 'Incorrect size cron passed in' if input.length > 5

cron = Cron.new(*input)

RbCronParser::Formatter.format(
  RbCronParser::Parser.parse(cron)
)
