module M3U8
  class MasterPlaylist
    class Stream
      property uri : String, bandwidth : Int32

      def initialize(@uri, @bandwidth); end

      def to_s
        "#EXT-X-STREAM-INF:BANDWIDTH=#{@bandwidth}\n" \
        "#{@uri}\n"
      end
    end
  end
end
