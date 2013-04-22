require 'getoptlong'

module Spectr
  module ArgsHelper

    ARGUMENTS = ['--help', '-h', GetoptLong::NO_ARGUMENT]

    def print_help
      puts 'rspeck "example matcher" [DIRECTORY...]'
    end

    def parse(args)
      opts = GetoptLong.new(ARGUMENTS)

      opts.each do |opt, arg|
        case opt
        when '--help'
          print_help
          exit 0
        end
      end

      args
    end
  end
end