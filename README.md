# m3u8 [![Build Status](https://travis-ci.org/marceloboeira/m3u8.cr.svg?branch=master)](https://travis-ci.org/marceloboeira/m3u8.cr)
> Generate and parse m3u8 playlists for HTTP Live Streaming with Crystal

## Status

The project is currently on a very early stage of **development**, take a look at the [M3U8.md](M3U8.md) file in order to check the progress.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  m3u8:
    github: marceloboeira/m3u8.cr
```

## Usage

Small example:

```crystal
require "m3u8"

playlist = M3U8::Playlist.new(4)

playlist.segments << M3U8::Playlist::Segment.new("low-001.ts", 3.054)
playlist.segments << M3U8::Playlist::Segment.new("low-002.ts", 3.054)
...

puts playlist.to_s
```

## M3U8 in other languages

- [Ruby](https://github.com/zencoder/m3uzi)
- [Python](https://github.com/globocom/m3u8)
- [Go](https://github.com/grafov/m3u8)
- [Javascript](https://github.com/tedconf/node-m3u8)
- [Objective C](https://github.com/Jeanvf/M3U8Paser)
- [Java](http://sourceforge.net/projects/m3u8parser)
- [Erlang](https://github.com/karlll/erlm3u8)

## Contributing

Want to contribute? check [this](CONTRIBUTING.md) first.
