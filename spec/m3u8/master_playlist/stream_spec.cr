require "./../../spec_helper"

describe M3U8::MasterPlaylist::Stream do
  context "when rendenring a stream" do
    it "accepts with url" do
      stream = M3U8::MasterPlaylist::Stream.new("low-360p.m3u8")

      output = "#EXT-X-STREAM-INF:\n" \
               "low-360p.m3u8\n"

      expect(stream.to_s).to match(/#{output}/)
    end
  end
end
