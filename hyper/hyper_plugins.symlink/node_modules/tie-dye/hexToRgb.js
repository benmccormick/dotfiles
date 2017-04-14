/**
 * Convert a color from hexidecimal to RGB
 *
 * @param {string} hex - A string containing six hexidecimal characters
 * @returns {object} With the signature {r: 0-255, g: 0-255, b: 0-255}
 */
function hexToRgb(hex) {

  var match = hex.toString(16).match(/[a-f0-9]{6}/i);

  if (!match) {
    return {r: 0, g: 0, b: 0};
  }

  var integer = parseInt(match[0], 16);
  var r = (integer >> 16) & 0xFF;
  var g = (integer >> 8) & 0xFF;
  var b = integer & 0xFF;

  return {
    r: r,
    g: g,
    b: b
  };
}

module.exports = hexToRgb;
