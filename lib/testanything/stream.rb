module Testanything
  class Stream
    def initialize(out)
      @out = out
      @out.puts "TAP version 13"
    end

    def plan(count)
      @out.puts "1..#{count}"
    end
  end
end
