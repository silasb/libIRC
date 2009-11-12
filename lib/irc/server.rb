require 'socket'
require 'irc/channel'

module IRC
  class Server
    alias_method :connect, :initialize

    def self.connect(server, port, nick)
      @socket = TCPSocket.open(server, port)
      @channels = []
      say("NICK #{nick}")
      # don't know what the 0 * is for
      say("USER #{nick} 0 * #{nick}")
    end
    
    def channel(name)
      @channels << Channel.join(name)
    end

    def say(msg)
      @socket.puts msg
    end

    def disconnect
      @socket.close
    end
  end
end
