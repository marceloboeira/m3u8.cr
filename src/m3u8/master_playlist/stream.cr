module M3U8
  class MasterPlaylist
    class Stream
      property uri

      def initialize(@uri : String, @bandwidth : Int); end

      def to_s
        "#EXT-X-STREAM-INF:BANDWIDTH=#{@bandwidth}\n" \
        "#{@uri}\n"
      end
    end
  end
end
