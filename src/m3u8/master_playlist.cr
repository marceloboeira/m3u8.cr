require "./playlist"

module M3U8
  class MasterPlaylist < Playlist
    def initialize; end

    def to_s
      builder = super
      builder += "\n"

      builder
    end
  end
end
