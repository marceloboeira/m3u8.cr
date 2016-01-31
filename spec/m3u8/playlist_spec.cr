require "./../spec_helper"

describe M3U8::Playlist do
  describe "when creating a playlist" do
    let(playlist) { M3U8::Playlist.new }

    it "inserts the header" do
      expect(playlist.to_s).to eq("#EXTM3U\n")
    end
  end
end
