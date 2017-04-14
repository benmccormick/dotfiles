/**
 * Convert a color from RGB to hexidecimal
 *
 * @param {number} r - A value from 0 - 255
 * @param {number} g - A value from 0 - 255
 * @param {number} b - A value from 0 - 255
 * @returns {string} In the format #000000
 */
function rgbToHex(r, g, b) {
  var integer = ((Math.round(r) & 0xFF) << 16)
    + ((Math.round(g) & 0xFF) << 8)
    + (Math.round(b) & 0xFF);

  var string = integer.toString(16).toUpperCase();
  return '#' + ('000000'.substring(string.length) + string);
}

module.exports = rgbToHex;
