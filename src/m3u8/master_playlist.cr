module M3U8
  class MasterPlaylist
    property streams

    def initialize(@streams = [] of M3U8::MasterPlaylist::Stream); end

    def to_s
      builder = ""
      builder += header
      builder += version
      builder += "\n"

      @streams.each do |stream|
        builder += stream.to_s
      end

      builder
    end

    private def header
      "#EXTM3U\n"
    end

    private def version
      "#EXT-X-VERSION:3\n"
    end
  end
end
