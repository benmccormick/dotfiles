var hexToRgb = require('./hexToRgb');
var rgbToHsl = require('./rgbToHsl');

function hexToHsl(hex) {
  var rgb = hexToRgb(hex);
  return rgbToHsl(rgb.r, rgb.g, rgb.b);
}

module.exports = hexToHsl;
