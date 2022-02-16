#!/usr/bin/env ruby

require "yaml"
require "fileutils"
require_relative "lib/icon.rb"

here = __dir__

CATEGORIES=%w(
    actions
    animations
    apps
    categories
    devices
    emblems
    mimetypes
    places
    status
    stock
)

SIZES=%w(
    16
    22
    24
    32
    48
    96
    128
)

src_dir = File.join(here, "src")
resized_dir = File.join(here, "resized")

FileUtils.mkdir_p resized_dir

config = YAML.load(File.open "config.yml")

icons = config["icons"].map(&Icon.method(:new))

icons.each do |icon|
    SIZES.each do |size|
        src = icon.src_image_for_size(size)
        dest = File.join(resized_dir, icon.resized_image(size))

        # Skip building if the output file exists already, since resizing
        # images is expensive. Images will never need to be rebuilt if the
        # src names aren't changed.
        next if File.exists? dest
        system("magick", File.join(src_dir, src), "-resize", size, dest)
    end
end

CATEGORIES.each do |category|
    SIZES.each do |size|
        FileUtils.mkdir_p File.join(here, category, size)
    end
end

icons.each do |icon|
    SIZES.each do |size|
        icon.categories.product(icon.names).each do |category, name|
            src = icon.resized_image(size)
            dest = File.join(category, size.to_s, "#{name}#{File.extname(src)}")
            FileUtils.ln_s File.join("..", "..", "resized", src), dest, force: true
        end
    end
end

index = <<-EOF
[Icon Theme]
Name=OSX
Inherits=Mint-X-Aqua,gnome,hicolor
Comment=Icon theme built for Linux Mint. Uses elements of Faenza and Elementary.
Directories=#{CATEGORIES.product(SIZES).map { |c, s| "#{c}/#{s}" }.join(",") }

#{CATEGORIES.product(SIZES).map { |c, s|
        <<-BLOCK
[#{c}/#{s}]
Size=#{s}
Context=#{c.capitalize}
Type=#{s.to_s == "128" ? "Scalable" : "Fixed"}
MinSize=8
MaxSize=512
        BLOCK
    }.join("\n")}
EOF

File.write(File.join(here, "index.theme"), index)