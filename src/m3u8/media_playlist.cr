module M3U8
  class MediaPlaylist
    property duration : Int32, segments : Array(Segment)

    def initialize(@duration, @segments); end

    def to_s(io : IO = MemoryIO.new)
      io << header
      io << version
      io << target_duration
      io << media_sequence
      io << "\n"

      @segments.each do |segment|
        io << segment.to_s
      end

      io.to_s
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
