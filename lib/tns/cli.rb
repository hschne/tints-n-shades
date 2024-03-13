# frozen_string_literal: true

require "thor"

require_relative "../tns"

module TNS
  # CLI to generate stuff
  class CLI < Thor
    desc "generate <color>", "Generate tints and shades from a given color"
    long_desc <<~LONGDESC
      Tints 'N Shades (tns) is a tints and shades generator for command line
      lovers. Generate palettes in CSS/SASS/Tailwind based on a Hex color.

        tns g #ff7d00
        --primary-100: #ffe5cc;
        --primary-200: #ffcb99;
    LONGDESC

    option :name, default: "primary",
                  type: :string,
                  aliases: "-n",
                  desc: "The name of your color"
    option :output, default: "css",
                    enum: %w[css sass tailwind],
                    type: :string,
                    aliases: "-o",
                    desc: "The output format"
    option "color-format", default: "hex",
                           enum: %w[hex hsl rgb],
                           type: :string,
                           aliases: "-c",
                           desc: "The color format to use. "
    def generate(color)
      rgb = Color::RGB.from_hex(color)
      name = options["name"]
      color_format = options["color-format"]
      output = options["output"]
      palette = Palette.new(rgb).to(color_format)
      output = Output.from_argument(output, name)
      puts output.format(palette)
    rescue ArgumentError => e
      # Wrap argument errors into thor errors for nicer reporting to user
      raise Thor::Error, e.message
    end

    map "g" => :generate

    def self.exit_on_failure?
      true
    end
  end
end
