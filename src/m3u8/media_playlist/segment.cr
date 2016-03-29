module M3U8
  class MediaPlaylist
    class Segment
      property uri : String,
               duration : Float64,
               title : String

      def initialize(@uri, @duration, @title = ""); end

      def to_s
        "#EXTINF:#{@duration},#{@title}\n" \
        "#{@uri}\n"
      end
    end
  end
end
