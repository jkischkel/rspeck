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
        match = line.split(/:/).map(&:strip).map(&:chomp)
        /"(.+)"/ =~ match[2]

        { :file => match[0],
          :line => match[1],
          :spec => $1 }
      end
    end
  end
end
