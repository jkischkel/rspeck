module Spectr
  module Finder

    def detect_finder
      return 'ack' if /^\/\w+/ === `which ack`
      return 'ack-grep' if /^\/\w+/ === `which ack-grep`
      raise 'ack[-grep] not found!'
    end

    def find(pattern)
      results = `#{detect_finder} \"#{pattern}\" spec/ --ruby`
  
      results.split(/\n/).map do |line|
        parts = line.split(/:/).map(&:chomp).map(&:strip)

        { :file => parts[0],
          :line => parts[1],
          :spec => /"(.+)"/.match(parts[2]).captures.first }
      end
    end
  end
end
