require "./../spec_helper"

describe M3U8::MasterPlaylist do
  context "when rendering a playlist" do
    let(streams) { [ M3U8::MasterPlaylist::Stream.new("low.m3u8", 1280000),
                     M3U8::MasterPlaylist::Stream.new("medium.m3u8", 2560000),
                     M3U8::MasterPlaylist::Stream.new("high.m3u8", 7680000) ] }
    let(playlist) { M3U8::MasterPlaylist.new(streams) }

    it "inserts the header" do
      expect(playlist.to_s).to match(/#EXTM3U\n/)
    end

    it "inserts the version tag" do
      expect(playlist.to_s).to match(/#EXT-X-VERSION:3\n/)
    end

    it "inserts an empty line between the header and rest" do
      expect(playlist.to_s.lines[2]).to eq("\n")
    end

    context "with streams" do
      it "renders multiple streams" do
        streams.each do |stream|
          expect(playlist.to_s).to match(/#{streams.to_s}/)
        end
      end

      it "allows to add streams on the fly" do
        new_streams = M3U8::MasterPlaylist::Stream.new("another.m3u8", 123123123)
        playlist.streams << new_streams

        expect(playlist.to_s).to match(/#{new_streams.to_s}/)
      end
    end
  end
end
