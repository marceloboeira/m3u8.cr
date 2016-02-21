module M3U8
  class MasterPlaylist
    def initialize; end

    def to_s
      builder = ""
      builder += header
      builder += version
      builder += "\n"

      builder
    end

    # EXTM3U
    # https://tools.ietf.org/html/draft-pantos-http-live-streaming-18#section-4.3.1.1
    #
    # The EXTM3U tag indicates that the file is an Extended M3U Playlist file.
    # It MUST be the first line of every Media Playlist and every Master Playlist
    private def header
      "#EXTM3U\n"
    end

    # EXT-X-VERSION
    #
    # The EXT-X-VERSION tag indicates the compatibility version of the
    # Playlist file, its associated media, and its server.
    # Its format is: #EXT-X-VERSION:<n>
    # - n is an integer indicating the protocol compatibility version
    # number.
    #
    # It MUST appear in all Playlists containing tags or attributes that
    # are not compatible with protocol version 1 to support
    # interoperability with older clients.
    private def version
      "#EXT-X-VERSION:3\n"
    end
  end
end
