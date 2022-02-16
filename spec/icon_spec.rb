require_relative "../lib/icon.rb"

describe "Icon#src_image_for_size" do
    it "raises an error if no sizes are declared" do
        icon_params = {}
        icon = Icon.new(icon_params)
        expect { icon.src_image_for_size(16) }.to raise_error "icon doesn't have any sizes"
    end

    it "returns the image name for the requested size" do
        icon_params = {
            "sizes" => {
                16 => "sixteen.png",
                24 => "twenty-four.png",
            }
        }
        icon = Icon.new(icon_params)
        expect(icon.src_image_for_size(16)).to eq "sixteen.png"
        expect(icon.src_image_for_size(24)).to eq "twenty-four.png"
    end

    it "returns the next size up if there's no mapping for the requested size" do
        icon_params = {
            "sizes" => {
                16 => "sixteen.png",
                24 => "twenty-four.png",
            }
        }
        icon = Icon.new(icon_params)
        expect(icon.src_image_for_size(8)).to eq "sixteen.png"
        expect(icon.src_image_for_size(22)).to eq "twenty-four.png"
    end

    it "accepts strings or numbers" do
        icon_params = {
            "sizes" => {
                16 => "sixteen.png",
                128 => "big.png",
            }
        }
        icon = Icon.new(icon_params)
        expect(icon.src_image_for_size("16")).to eq "sixteen.png"
    end

    it "deals with sizes that are declared out of order" do
        icon_params = {
            "sizes" => {
                24 => "twenty-four.png",
                16 => "sixteen.png",
            }
        }
        icon = Icon.new(icon_params)
        expect(icon.src_image_for_size(16)).to eq "sixteen.png"
    end

    it "returns the biggest size if you request something really big" do
        icon_params = {
            "sizes" => {
                16 => "sixteen.png",
                24 => "twenty-four.png",
                128 => "big.png",
            }
        }
        icon = Icon.new(icon_params)
        expect(icon.src_image_for_size(1000)).to eq "big.png"
    end
end

describe "Icon#resized_image" do
    it "includes the size in the image name" do
        icon_params = {
            "sizes" => {
                16 => "sixteen.png",
                24 => "big.png",
            }
        }
        icon = Icon.new(icon_params)
        expect(icon.resized_image(8)).to eq "sixteen-8.png"
        expect(icon.resized_image(128)).to eq "big-128.png"
    end

    it "uses the extension from the original image" do
        icon_params = {
            "sizes" => {
                16 => "sixteen.foo",
            }
        }
        icon = Icon.new(icon_params)
        expect(icon.resized_image(16)).to eq "sixteen-16.foo"
    end
end