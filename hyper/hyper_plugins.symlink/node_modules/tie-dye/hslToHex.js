var hslToRgb = require('./hslToRgb');
var rgbToHex = require('./rgbToHex');

function hslToHex(h, s, l) {
  var rgb = hslToRgb(h, s, l);
  return rgbToHex(rgb.r, rgb.g, rgb.b);
}

module.exports = hslToHex;
