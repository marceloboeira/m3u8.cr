require "./../spec_helper"

describe M3U8::Playlist do
  context "when rendering a playlist" do
    let(target_duration) { 3 }
    let(playlist) { M3U8::Playlist.new(target_duration) }

    it "inserts the header" do
      expect(playlist.to_s).to match(/#EXTM3U\n/)
    end

    it "inserts the version tag" do
      expect(playlist.to_s).to match(/#EXT-X-VERSION:3\n/)
    end

    it "inserts the target-duration tag" do
      expect(playlist.to_s).to match(/#EXT-X-TARGETDURATION:3\n/)
    end

    it "inserts an empty line between the header and rest" do
      expect(playlist.to_s.lines[3]).to eq("\n")
    end

    context "with segments" do
      let(:segments) {
        [ M3U8::Playlist::Segment.new("S01E01-1080-0001.ts", 9.003),
          M3U8::Playlist::Segment.new("S01E01-1080-0002.ts", 9.003),
          M3U8::Playlist::Segment.new("S01E01-1080-0003.ts", 9.003) ]
      }

      before do
        segments.each do |segment|
          playlist.add_segment(segment)
        end
      end

      it "renders multiple segments" do
        segments.each do |segment|
          expect(playlist.to_s).to match(/#{segment.to_s}/)
        end
      end
    end
  end
end
