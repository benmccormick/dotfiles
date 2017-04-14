var hueToRgb = require('./hueToRgb');

/**
 * Convert a color from HSL to RGB
 *
 * @param {number} h - A value from 0 - 360
 * @param {number} s - A value from 0 - 100
 * @param {number} l - A value from 0 - 100
 * @returns {object} With the signature {r: 0-255, g: 0-255, b: 0-255}
 */
function hslToRgb(h, s, l) {

  h /= 360;
  s /= 100;
  l /= 100;

  var r, g, b;

  if (s === 0) {
    r = g = b = l; // achromatic
  } else {
    var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
    var p = 2 * l - q;
    r = hueToRgb(p, q, h + 1 / 3);
    g = hueToRgb(p, q, h);
    b = hueToRgb(p, q, h - 1 / 3);
  }

  return ({
    r: r * 255,
    g: g * 255,
    b: b * 255
  });
}

module.exports = hslToRgb;
