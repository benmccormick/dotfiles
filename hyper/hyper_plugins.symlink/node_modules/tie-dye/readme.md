![tie-dye](https://raw.githubusercontent.com/supercrabtree/tie-dye/master/media/tie-dye-header.jpg)

Although there are a bunch of color conversion libraries on npm, I couldn't find one where it was simple to just import the conversions you want. While importing a library is not a big deal in node, for the browser there is not reason to load a whole library of code you are not using. Normally I find I only need one conversion.

### Current API

##### Hexadecimal to HSL

```js
import hexToHsl from 'tie-dye/hexToHsl';

const paleCornflowerBlueHsl = hexToHsl('#ABCDEF');

console.log(paleCornflowerBlueHsl); // => { h: 210, s: 68, l: 80.3921568627451}
```
##### Hexadecimal to RGB

```js
import hexToRgb from 'tie-dye/hexToRgb';

const paleCornflowerBlueRgb = hexToRgb('#ABCDEF');

console.log(paleCornflowerBlueRgb); // => { r: 171, g: 205, b: 239 }
```

##### RGB to Hexadecimal

```js
import rgbToHex from 'tie-dye/rgbToHex';

const mintGreenHex = rgbToHex(152, 255, 152);

console.log(mintGreenHex); // => '#98FF98'
```

##### RGB to HSL

```js
import rgbToHsl from 'tie-dye/rgbToHsl';

const dreamyRedHsl = rgbToHsl(139, 255, 138);

console.log(dreamyRedHsl); // => { h: 0, s: 70.13574660633485, l: 56.666666666666664 }
```

##### HSL to Hexadecimal

```js
import hslToHex from 'tie-dye/hslToHex';

const mauveHex = hslToHex(276, 100, 85);

console.log(mauveHex); // => '#e0B3FF'
```

##### HSL to RGB

```js
import hslToRgb from 'tie-dye/hslToRgb';

const foamGreenRgb = hslToRgb(96, 46, 59);

console.log(foamGreenRgb); // => { r: 140.83139999999997, g: 198.543, b: 102.35699999999997 }
```

### Keeping it simple 
In the spirit of keeping it unixy this library does not aim to round your results, or allow you to pass arguments with r g b / h s l properties, etc. If you wanna do that here are some really simple examples.

##### Passing objects with h s l properties

```js
import hslToRgb from 'tie-dye/hslToRgb';

const hslObjectToRgb = obj => hslToRgb(obj.h, obj.s, obj.l);

const foamGreenHsl = {h: 96, s: 46, l: 59};

const foamGreenRgb = hslObjectToRgb(foamGreenHsl);

console.log(foamGreenRgb); // => { r: 140.83139999999997, g: 198.543, b: 102.35699999999997 }
```

##### Rounding results to two decimal places

```js
import hslToRgb from 'tie-dye/hslToRgb';
import { mapValues } from 'lodash/fp';

const roundTo2Decimal = x => Math.round(x * 100) / 100;
const roundObject = mapValues(roundTo2Decimal);

const foamGreenRgb = roundObject(hslToRgb(96, 46, 59));

console.log(foamGreenRgb); // => { r: 140.83, g: 198.54, b: 102.36 }
```
