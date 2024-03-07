# frozen_string_literal: true

require "thor"

require_relative "../tns"

module TNS
  class CLI < Thor
    desc "g <color>", "Generate tints and shades from a given color"
    long_desc <<-LONGDESC
      LONG DESCRIPTION GOES HERE
    LONGDESC

    argument :colors, optional: false, type: :array, description: "The colors to pass",
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
                           desc: "The color format"
    option :size, default: 10,
                  type: :numeric,
                  aliases: "-s",
                  desc: "The total number of colors to include in your palette."
    option :index, default: 5,
                   type: :numeric,
                   aliases: "-i",
                   desc: "Which index to give your base color"
    def g
      palettes = named_colors(colors).map do |(color, name)|
        rgb = Color::RGB.from_hex(color)
        palette = Palette.new(rgb).to_a.map { |variant| Output::CSSVariable.new(variant, name).to_s }
        "// #{name.upcase}\n#{palette.join("\n")}"
      end
      puts palettes.join("\n\n")
    end

    no_commands do
      def named_colors(colors)
        colors
          .to_h do |color|
            split = color.split(":")
            split << "color-#{ordinal_numerals.next}" if split.size != 2
            split
          end
      end

      def ordinal_numerals
        @ordinal_numerals ||= %w[
          primary secondary
          teratiary quartary
          quinary senary
          septenary octonary
          nonary decenary
        ].each
      end
    end

    def self.exit_on_failure?
      true
    end
  end
end
