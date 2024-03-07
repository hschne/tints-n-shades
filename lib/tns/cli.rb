# frozen_string_literal: true

require "thor"

require_relative "../tns"

module TNS
  # CLI to generate stuff
  class CLI < Thor
    desc "g <color>", "Generate tints and shades from a given color"
    long_desc <<-LONGDESC
      LONG DESCRIPTION GOES HERE
    LONGDESC

    argument :colors, optional: false, type: :array, description: "Colors in hex format",
                      banner: "color[:name] color[:name]"
    option :format, default: ["css"],
                    enum: %w[css scss raw],
                    type: :array,
                    aliases: "-f",
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
    def g
      palettes = Input.named_colors(colors).map do |(color, name)|
        rgb = Color::RGB.from_hex(color)
        color_format = options["color-format"].to_sym
        palette = Palette.new(rgb).to(color_format)

        "// #{name.upcase}\n#{format_palette(palette).join("\n")}"
      end
      puts palettes.join("\n\n")
    rescue ArgumentError => e
      # Wrap argument errors into thor errors for nicer reporting to user
      raise Thor::Error, e.message
    end

    def format_palette(palette)
      palette.map { |variant| Output::CSSVariable.new(variant, name) }
             .map(&:to_s)
             .map { |string| "#{string};" }
    end

    def self.exit_on_failure?
      true
    end
  end
end
