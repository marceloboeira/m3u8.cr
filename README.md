# m3u8 [![Build Status](https://travis-ci.org/marceloboeira/m3u8.cr.svg?branch=master)](https://travis-ci.org/marceloboeira/m3u8.cr)
> Generate and parse m3u8 playlists for HTTP Live Streaming with Crystal

## Status

The project is currently on a very early stage of **development**, take a look at the [M3U8.md](M3U8.md) file in order to check the progress.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  m3u8:
    github: marceloboeira/m3u8
```

## Usage

Small example:

```crystal
require "m3u8"

playlist = M3U8::Playlist.new

playlist.add_segment("low-001.ts", 3.054)
playlist.add_segment("low-002.ts", 3.054)
playlist.add_segment("low-003.ts", 3.054)

puts playlist.to_s
```

## Contributing

Want to contribute? check [this](CONTRIBUTE.md) first.
