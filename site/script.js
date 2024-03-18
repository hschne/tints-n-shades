import { DefaultRubyVM } from "https://cdn.jsdelivr.net/npm/@ruby/3.3-wasm-wasi@2.5.0/dist/browser/+esm";
const response = await fetch("ruby-web.wasm");
const module = await WebAssembly.compileStreaming(response);
const { vm } = await DefaultRubyVM(module);

function generatePalette() {
  const color = document.querySelector("#color").value;
  const name = document.querySelector("#color").value;

  const result = vm.eval(`
  require "/bundle/setup"
  require "js"
  require "tns"

  color = "${color}"
  rgb = TNS::Color::RGB.from_hex(color)
  name = "${name}"
  color_format = "hex"
  output = "tailwind"
  palette = TNS::Palette.new(rgb).to(color_format)
  output = TNS::Output.from_argument(output, name)
  output.format(palette)
`);

  document.querySelector("#output").innerHTML = result;
}

document.querySelector("#button").addEventListener("click", (_event) => {
  generatePalette();
});
