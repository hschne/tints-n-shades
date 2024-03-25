import { DefaultRubyVM } from "https://cdn.jsdelivr.net/npm/@ruby/3.3-wasm-wasi@2.5.0/dist/browser/+esm";
const response = await fetch("./ruby-web.wasm");
const module = await WebAssembly.compileStreaming(response);
const { vm } = await DefaultRubyVM(module);

const generate = (color, name, format, output) => {
  const result = vm.eval(`
  require "/bundle/setup"
  require "js"
  require "tns"

  color = "${color}"
  name = "${name}"
  color_format = "${format}"
  output = "${output}"
  rgb = TNS::Color::RGB.from_hex(color)
  palette = TNS::Palette.new(rgb).to(color_format)
  output = TNS::Output.from_argument(output, name)
  output.format(palette)
`);
  return result.toString();
};

const toggleSpinners = () => {
  const spinner = document.querySelector("#spinner");
  const output = document.querySelector("#code");
  spinner.classList.toggle("hidden");
  output.classList.toggle("hidden");
};

const onClick = () => {
  const color = document.querySelector("#color").value;
  const name = document.querySelector("#name").value;
  const format = document.querySelector("#format").value;

  document.querySelector("#css").innerHTML = generate(
    color,
    name,
    format,
    "css",
  );
  document.querySelector("#sass").innerHTML = generate(
    color,
    name,
    format,
    "sass",
  );
  document.querySelector("#tailwind").innerHTML = generate(
    color,
    name,
    format,
    "tailwind",
  );
};

document.querySelector("#button").addEventListener("click", (_event) => {
  toggleSpinners();
  onClick();
  toggleSpinners();
});

onClick();
toggleSpinners();
