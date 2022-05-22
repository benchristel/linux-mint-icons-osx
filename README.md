# OSX-style icons for Linux Mint

## Installation

Clone this repository. Then symlink it into ~/.icons:

```
ln -s /path/to/linux-mint-icons-osx ~/.icons/osx
```

Launch the Themes app and select `osx` as your icon theme.

I've only tested this on Linux Mint 20.3 Cinnamon. YMMV on other systems.

## Development

To customize this icon theme, you'll need Ruby 2.7 and `magick` (the
imagemagick CLI) installed. Other versions of Ruby might work too; I haven't
tried them though.

- **Ruby 2.7**: `apt install ruby`.
- **imagemagick**: download the portable `magick` binary from here: https://imagemagick.org/script/download.php. Put it in your PATH, e.g. `/usr/local/bin/magick`

Once you have those tools installed, you can change `config.yml` and run
`build.rb` to generate the icons. The build tool looks for image files in
`src/`.

`rspec spec` runs the tests for the build tool.

## Hacking Icons

You can find a list of icon names in `dev/icon-names.txt`.
This list can be generated on Cinnamon systems by running `dev/list-icons.sh`.

There are a lot of icons in this list—over 7500. If you're trying to replace a
given icon, you can often find it in the list with a simple text search.
However, this may turn up false positives, so it's good to check what
the icon actually looks like on your current system. To do that, run
`dev/whatis some-icon-name`. This will both print the path to the file and open
the file in your default image viewer.

If even this process gets too tedious, you can try:

```
grep some-icon-name dev/icon-names.txt | xargs -n1 dev/whatis
```

## License

GPL 3.0

[Some icons](https://www.iconfinder.com/iconsets/DarkGlass_Reworked) are by
Alessandro Rei (licensed under the GPL)
