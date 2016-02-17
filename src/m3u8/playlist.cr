module M3U8
  class Playlist
    @duration : Int32
    @segments : Array(M3U8::Playlist::Segment)

    def initialize(@duration)
      @segments = [] of M3U8::Playlist::Segment
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
    def add_segment(segment : M3U8::Playlist::Segment)
      @segments << segment
    end

    def to_s
      builder = ""
      builder += header
      builder += version
      builder += target_duration
      builder += "\n"

      @segments.each do |segment|
        builder += segment.to_s
      end

      builder
    end

    # EXTM3U
    # https://tools.ietf.org/html/draft-pantos-http-live-streaming-18#section-4.3.1.1
    #
    # The EXTM3U tag indicates that the file is an Extended M3U Playlist file.
    # It MUST be the first line of every Media Playlist and every Master Playlist
    private def header
      "#EXTM3U\n"
    end

    # EXT-X-VERSION
    # https://tools.ietf.org/html/draft-pantos-http-live-streaming-18#section-4.3.1.2
    #
    # The EXT-X-VERSION tag indicates the compatibility version of the
    # Playlist file, its associated media, and its server.
    # Its format is: #EXT-X-VERSION:<n>
    # - n is an integer indicating the protocol compatibility version
    # number.
    #
    # It MUST appear in all Playlists containing tags or attributes that
    # are not compatible with protocol version 1 to support
    # interoperability with older clients.
    private def version
      "#EXT-X-VERSION:3\n"
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
      "#EXT-X-TARGETDURATION:#{@duration}\n"
    end
  end
end
