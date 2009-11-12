module IRC
  class Channel
    alias_method :join, :initialize

    def self.join(channel)
      @channel = channel
    end

    def say(msg)
      say "PRIVMSG ##{@channel} :#{msg}"
    end

    def quit(msg = "Daisy Dukes")
      say "PART ##{@channel} :#{msg}"
    end
  end
end
