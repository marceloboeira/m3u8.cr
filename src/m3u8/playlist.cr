module M3U8
  class Playlist
    def initialize
      @builder = ""
      @builder += header
    end

    def add_segment(uri : String, duration : Float64)
      @builder += "#EXTINF:#{duration},\n" \
                  "#{uri}\n"
    end

    def to_s
      @builder
    end

    private def header
      "#EXTM3U\n" \
      "\n"
    end
  end
end
