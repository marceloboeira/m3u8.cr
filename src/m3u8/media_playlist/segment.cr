module M3U8
  class MediaPlaylist
    class Segment
      property uri, duration, title

      # EXTINF
      # https://tools.ietf.org/html/draft-pantos-http-live-streaming-18#section-4.3.2.1
      #
      # The EXTINF tag specifies the duration of a Media Segment. It applies only to the
      # next Media Segment. This tag is REQUIRED for each Media Segment.
      # Its format is: EXTINF:<duration>,[<title>]
      # - duration: a decimal-floating-point or decimal-integer number that specifies
      # the duration of the Media Segment in seconds.
      # - title: an optional human-readable informative title of the Media Segment.
      def initialize(@uri : String, @duration : Float64, @title = "" : String); end

      def to_s
        "#EXTINF:#{@duration},#{@title}\n" \
        "#{@uri}\n"
      end
    end
  end
end
