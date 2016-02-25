require "./playlist"

module M3U8
  class MediaPlaylist < Playlist
    property duration, segments

    def initialize(@duration : Int32, @segments = [] of M3U8::Playlist::Segment); end

    def to_s
      builder = super
      builder += target_duration
      builder += "\n"

      @segments.each do |segment|
        builder += segment.to_s
      end

      builder
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
