module M3U8
  class MediaPlaylist
    class Segment
      property uri : String,
               duration : Float64,
               title : String

      def initialize(@uri, @duration, @title = ""); end

      def to_s(io : IO = MemoryIO.new)
        io << <<-STRING
        #EXTINF:#{@duration},#{@title}
        #{@uri}

        STRING

        io.to_s
      end
    end
  end
end
