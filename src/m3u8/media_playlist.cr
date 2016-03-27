module M3U8
  class MediaPlaylist
    property duration, segments

    def initialize(@duration : Int32, @segments = [] of M3U8::MediaPlaylist::Segment); end

    def to_s
      builder = ""
      builder += header
      builder += version
      builder += target_duration
      builder += media_sequence
      builder += "\n"

      @segments.each do |segment|
        builder += segment.to_s
      end

      builder
    end

    private def header
      "#EXTM3U\n"
    end

    private def version
      "#EXT-X-VERSION:3\n"
    end

    private def target_duration
      "#EXT-X-TARGETDURATION:#{@duration}\n"
    end

    private def media_sequence
      "#EXT-X-MEDIA-SEQUENCE:0\n"
    end
  end
end
