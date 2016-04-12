module M3U8
  class MasterPlaylist
    property streams : Array(Stream)

    def initialize(@streams); end

    def to_s(io : IO = MemoryIO.new)
      io << header
      io << version
      io << "\n"

      @streams.each do |stream|
        io << stream.to_s
      end

      io.to_s
    end

    private def header
      "#EXTM3U\n"
    end

    private def version
      "#EXT-X-VERSION:3\n"
    end
  end
end
