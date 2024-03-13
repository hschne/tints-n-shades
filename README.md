<div align="center">

<img alt="logo" src="assets/logo.webp" width="300px" height="auto">

### The tints & shades generator for CLI lovers 🩶

</div>

## Usage

Install Tints 'N Shades (TNS) using [Bundler](https://bundler.io/).

```bash
bundle install tints-n-shades
```

Run `tns generate` (or the short variant, `tns g`) with any color you need tints and shades for in hex format.

```bash
 tns g #ff7d00
--primary-100: #ffe5cc;
--primary-200: #ffcb99;
--primary-300: #ffb166;
--primary-400: #ff9733;
--primary-500: #ff7d00;
--primary-600: #cc6400;
--primary-700: #994b00;
--primary-800: #663200;
--primary-900: #331900;
```

### Color Formats

TNS supports outputs in Hex, HSL and RGB formats using the `--color-format` / `-c` argument.

```bash
tns g #ff7d00 -c hex
--primary-100: #ffe5cc;
--primary-200: #ffcb99;

 tns g #ff7d00 --color-format hsl
--primary-100: hsl(29 100 90);
--primary-200: hsl(29 100 80);
...

 tns g #ff7d00 --color-format rgb
--primary-100: rgb(255 229 204);
--primary-200: rgb(255 203 153);
...
```

### Output Formats

TNS supports outputting color palettes as CSS variables, SCSS variables, or Tailwind configuration.

```text
tns g #ff7d00 -o css
--primary-100: #ffe5cc;
--primary-200: #ffcb99;
...

tns g #ff7d00 -o sass
$primary-100: #ffe5cc;
$primary-200: #ffcb99;
...

tns g #ff7d00 -o tailwind
{
  "primary": {
    "100": "#ffe5cc",
    "200": "#ffcb99",
    ...
  }
}
...
```

### Others

To change the name of your color use the `--name` / `-n` argument. For additional configuration options see

```
tns help generate
```

## Why another Color generator? 

While there are numerous palette, tint and shade generators out there, none of them quite fit my use case. That is, taking colors from some palette (e.g. [coolors](https://coolors.co/)) and generating complete CSS/SASS variables in various formats. 

There are tools that will only output Hex variables, other support only Tailwind, and so on. There are none that provide that level of customization that I was looking for. 

Also: None that work on the command line! TNS is a simple executable that lends itself perfectly for scripting.

## Credit

This project was primarily inspired by [maketintsandshades.com](https://maketintsandshades.com/) and [tints.dev](https://www.tints.dev/). The starting point code-wise was the [color gem](https://github.com/halostatue/color). The RGB to HSL conversion algorithm is based off of [this Stackoverflow answer](https://stackoverflow.com/a/39147465)

## Contributing

Thank you for contributing! :heart:

Please use [GitHub issues](https://github.com/hschne/mr-loga-loga/issues) to submit bugs or feature requests.

## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tints 'N Shades project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](https://github.com/hschne/tints-n-shades/blob/master/CODE_OF_CONDUCT.md).
