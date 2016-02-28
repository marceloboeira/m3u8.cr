require "./../../spec_helper"

describe M3U8::MasterPlaylist::Stream do
  context "when rendenring a stream" do
    let(stream) { M3U8::MasterPlaylist::Stream.new("low-360p.m3u8", 1280000) }

    it "accepts with url and bandwidth" do
      output = "#EXT-X-STREAM-INF:BANDWIDTH=1280000\n" \
               "low-360p.m3u8\n"

      expect(stream.to_s).to match(/#{output}/)
    end
  end
end
