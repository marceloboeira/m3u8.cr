module M3U8
  class MasterPlaylist
    class Stream
      property uri : String, bandwidth : Int32

      def initialize(@uri, @bandwidth); end

      def to_s(io : IO = MemoryIO.new)
        io << <<-STRING
        #EXT-X-STREAM-INF:BANDWIDTH=#{@bandwidth}
        #{@uri}

        STRING

        io.to_s
      end
    end
  end
end
