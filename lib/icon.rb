class Icon
    def initialize(config)
        @config = config
    end

    def src_image_for_size(requested)
        sizes_in_order.each do |breakpoint, image|
            return image if requested.to_i <= breakpoint
        end
        _, biggest = sizes_in_order[-1]
        return biggest if biggest
        raise "icon doesn't have any sizes"
    end

    def resized_image(size)
        name = src_image_for_size(size)
        extension = File.extname(name)
        basename = File.basename(name, extension)
        "#{basename}-#{size}#{extension}"
    end

    def categories
        @config["categories"]
    end

    def names
        @config["names"]
    end

    private

    def sizes_in_order
        @sizes_in_order = (config["sizes"] || {}).each_pair.sort_by { |key, _| key }
    end

    def config
        @config
    end
end
