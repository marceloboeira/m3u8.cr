module M3U8
  module Codec
    class Audio
      # Codecs name
      AAC_LC = "aac-lc"
      HE_AAC = "he-aac"
      MP3    = "mp3"

      # HLS referecne
      AAC_LC_HLS = "mp4a.40.2"
      HE_AAC_HLS = "mp4a.40.5"
      MP3_HLS    = "mp4a.40.34"

      LIST = [
        { name: AAC_LC, hls: AAC_LC_HLS },
        { name: HE_AAC, hls: HE_AAC_HLS },
        { name: MP3,    hls: MP3_HLS    }
      ]

      def initialize(@name); end

      def to_hls
        LIST.each do |item|
          return item[:hls] if @name == item[:name]
        end
      end
    end
  end
end
