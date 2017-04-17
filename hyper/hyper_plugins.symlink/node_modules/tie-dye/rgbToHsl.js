/**
 * Convert a color from RGB to HSL
 *
 * @param {number} r - A value from 0 - 255
 * @param {number} g - A value from 0 - 255
 * @param {number} b - A value from 0 - 255
 * @returns {object} With the signature {h: 0-359, s: 0-100, l: 0-100}
 */
function rgbToHsl(r, g, b) {

  r /= 255, g /= 255, b /= 255;

  var max = Math.max(r, g, b);
  var min = Math.min(r, g, b);

  var h, s, l = (max + min) / 2;

  if (max === min) {
    h = s = 0; // achromatic
  } else {
    var d = max - min;
    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
    switch (max) {
      case r:
        h = (g - b) / d + (g < b ? 6 : 0);
      break;
      case g:
        h = (b - r) / d + 2;
      break;
      case b:
        h = (r - g) / d + 4;
      break;
    }
    h /= 6;
    h *= 360;
    s *= 100;
    l *= 100;
  }

  return ({
    h: h,
    s: s,
    l: l
  });
}

module.exports = rgbToHsl;
