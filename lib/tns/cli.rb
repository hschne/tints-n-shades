# frozen_string_literal: true

require "thor"

require_relative "../tns"

module TNS
  # CLI to generate stuff
  class CLI < Thor
    desc "generate <color>", "Generate tints and shades from a given color"
    long_desc <<-LONGDESC
      LONG DESCRIPTION GOES HERE
    LONGDESC

    option :name, default: "primary",
                  type: :string,
                  aliases: "-n",
                  desc: "The name of your color"
    option :format, default: "css",
                    enum: %w[css sass json],
                    type: :string,
                    aliases: "-o",
                    desc: "The output format"
    option "color-format", default: "hex",
                           enum: %w[hex hsl rgb],
                           type: :string,
                           aliases: "-c",
                           desc: "The color format to use. "
    option :size, default: 10,
                  type: :numeric,
                  aliases: "-s",
                  desc: "The total number of colors to include in your palette."
    option :index, default: 5,
                   type: :numeric,
                   aliases: "-i",
                   desc: "Which index to give your base color"
    def generate(color)
      rgb = Color::RGB.from_hex(color)
      name = options["name"]
      format = options["format"]
      color_format = options["color-format"]
      palette = Palette.new(rgb).to(color_format)
      text = Output::Text.new(name, format)
      puts text.format(palette)
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
