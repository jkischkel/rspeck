module Spectr
  module Finder

    def detect_finder
      return 'ack' if /^\/\w+/ === `which ack`
      return 'ack-grep' if /^\/\w+/ === `which ack-grep`
      raise 'ack[-grep] not found!'
    end

    def find(pattern)
      regex = /(\W|\A)it\W.*#{pattern}/
      results = `#{detect_finder} \"#{regex}\" spec/ --ruby`
  
      results.split(/\n/).map do |line|
        parts = line.split(/:/).map(&:chomp).map(&:strip)

        { :file => parts[0],
          :line => parts[1],
          :spec => parts[2] }
      end
    end
  end
end
