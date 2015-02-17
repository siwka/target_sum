#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'quest'
require 'cli'

quest = Quest.new(Cli.new)
unless quest.start
  quest.run_boring_menu
  quest.run_permutation
  # quest.run_knapsack
end
quest.finish