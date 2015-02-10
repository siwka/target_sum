#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'quest'
# require 'calculator'
require 'cli'

quest = Quest.new(Cli.new)
quest.start
quest.run
quest.finish