# OSX-style icons for Linux Mint

## Installation

Clone this repository. Then symlink it into ~/.icons:

```
ln -s /path/to/linux-mint-icons-osx ~/.icons/osx
```

Launch the Themes app and select `osx` as your icon theme.

## Development

You'll need Ruby 2.7 and `magick` (the imagemagick CLI) installed. Other
versions of Ruby might work too; I haven't tried them though.

Once you have those, you can change `config.yml` and run `build.rb` to
generate the icons.

`rspec spec` runs the tests for the build tool.

## License

GPL 3.0

[Some icons](https://www.iconfinder.com/iconsets/DarkGlass_Reworked) are by
Alessandro Rei (licensed under the GPL)
