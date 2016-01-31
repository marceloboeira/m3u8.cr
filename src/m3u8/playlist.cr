module M3U8
  class Playlist
    def initialize
      @builder = ""
      @builder += header
    end

    def to_s
      @builder
    end

    private def header
      "#EXTM3U\n"
    end
  end
end
