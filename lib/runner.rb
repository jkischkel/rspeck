require_relative 'parsor.rb'
require_relative 'finder.rb'
require_relative 'colors.rb'

require 'open3'

module Spectr
  class Runner
    include Finder, ArgsHelper

    def run(arguments)
      args = parse(arguments)

      if args.empty?
        puts 'No spec pattern given!'
        exit 1
      end

      matches = find(args.first)

      matches.each do |match|
        puts "## testing #{match[:file]}:#{match[:line]} ##".yellow
        puts match[:spec].green

        cmd = "bundle exec rake spec SPEC=#{match[:file]}:#{match[:line]}"

        o, _, _ = Open3.capture3(cmd)
        puts o.pink
      end
    end
  end
end
