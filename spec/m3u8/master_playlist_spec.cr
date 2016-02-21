require "./../spec_helper"

describe M3U8::MasterPlaylist do
  context "when rendering a playlist" do
    let(playlist) { M3U8::MasterPlaylist.new }

    it "inserts the header" do
      expect(playlist.to_s).to match(/#EXTM3U\n/)
    end

    it "inserts the version tag" do
      expect(playlist.to_s).to match(/#EXT-X-VERSION:3\n/)
    end
  end
end
