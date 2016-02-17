require "./../spec_helper"

describe M3U8::Playlist do
  context "when rendering a playlist" do
    let(target_duration) { 3 }
    let(:segments) {
      [ M3U8::Playlist::Segment.new("S01E01-1080-0001.ts", 9.003),
        M3U8::Playlist::Segment.new("S01E01-1080-0002.ts", 9.003),
        M3U8::Playlist::Segment.new("S01E01-1080-0003.ts", 9.003) ]
    }
    let(playlist) { M3U8::Playlist.new(target_duration, segments) }

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
      it "renders multiple segments" do
        segments.each do |segment|
          expect(playlist.to_s).to match(/#{segment.to_s}/)
        end
      end

      it "allows to add segments on the fly" do
        new_segment = M3U8::Playlist::Segment.new("S01E01-1080-0004.ts", 9.003)
        playlist.segments << new_segment

        expect(playlist.to_s).to match(/#{new_segment.to_s}/)
      end
    end
  end
end
