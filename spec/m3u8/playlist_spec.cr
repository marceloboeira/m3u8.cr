require "./../spec_helper"

describe M3U8::Playlist do
  context "when creating a playlist" do
    let(playlist) { M3U8::Playlist.new }

    it "inserts the header" do
      expect(playlist.to_s).to match(/#EXTM3U\n/)
    end

    it "accepts new segments" do
      playlist.add_segment("S01E01-1080-0001.ts", 9.003)

      output = "#EXTINF:9.003,\n" \
        "S01E01-1080-0001.ts\n"

      expect(playlist.to_s).to match(/#{output}/)
    end
  end
end
