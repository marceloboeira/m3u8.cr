require "./../spec_helper"

describe M3U8::Playlist do
  context "when creating a playlist" do
    let(target_duration) { 3 }
    let(playlist) { M3U8::Playlist.new(target_duration) }

    it "inserts the header" do
      expect(playlist.to_s).to match(/#EXTM3U\n/)
    end

    it "inserts the target-duration tag" do
      expect(playlist.to_s).to match(/#EXT-X-TARGETDURATION:3\n/)
    end

    it "inserts an empty line between the header and rest" do
      expect(playlist.to_s.lines[2]).to eq("\n")
    end

    it "accepts new segments" do
      playlist.add_segment("S01E01-1080-0001.ts", 9.003)

      output = "#EXTINF:9.003,\n" \
               "S01E01-1080-0001.ts\n"

      expect(playlist.to_s).to match(/#{output}/)
    end
  end
end
