module M3U8
  class MediaPlaylist
    class Segment
      property uri, duration, title

      def initialize(@uri : String, @duration : Float64, @title : String = ""); end

      def to_s
        "#EXTINF:#{@duration},#{@title}\n" \
        "#{@uri}\n"
      end
    end
  end
end
