module M3U8
  class Playlist
    def initialize(@target_duration : Int32)
      @builder = ""
      @builder += header
    end

    # EXTINF
    # https://tools.ietf.org/html/draft-pantos-http-live-streaming-18#section-4.3.2.1
    #
    # The EXTINF tag specifies the duration of a Media Segment. It applies only to the
    # next Media Segment. This tag is REQUIRED for each Media Segment.
    # Its format is: EXTINF:<duration>,[<title>]
    # - duration: a decimal-floating-point or decimal-integer number that specifies
    # the duration of the Media Segment in seconds.
    # - title: an optional human-readable informative title of the Media Segment.
    def add_segment(uri : String, duration : Float64)
      add_segment(uri, duration, "")
    end

    def add_segment(uri : String, duration : Float64, title : String)
      @builder += "#EXTINF:#{duration},#{title}\n" \
                  "#{uri}\n"
    end

    def to_s
      @builder
    end

    # EXTM3U
    # https://tools.ietf.org/html/draft-pantos-http-live-streaming-18#section-4.3.1.1
    #
    # The EXTM3U tag indicates that the file is an Extended M3U Playlist file.
    # It MUST be the first line of every Media Playlist and every Master Playlist
    private def header
      "#EXTM3U\n" \
      "#{target_duration}" \
      "\n"
    end

    # EXT-X-TARGETDURATION
    # https://tools.ietf.org/html/draft-pantos-http-live-streaming-18#section-4.3.3.1
    #
    # The EXT-X-TARGETDURATION tag specifies the maximum Media Segment
    # duration. The EXTINF duration of each Media Segment in the Playlist
    # file, when rounded to the nearest integer, MUST be less than or equal
    # to the target duration; longer segments can trigger playback stalls
    # or other errors. It applies to the entire Playlist file.
    # Its format is: EXT-X-TARGETDURATION:<s>
    # - s is a decimal-integer indicating the target duration in seconds.
    # The EXT-X-TARGETDURATION tag is REQUIRED.
    private def target_duration
      "#EXT-X-TARGETDURATION:#{@target_duration}\n"
    end
  end
end
