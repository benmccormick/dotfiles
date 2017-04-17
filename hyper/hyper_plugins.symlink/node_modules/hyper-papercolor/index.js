const backgroundColor = '#EEEEEE';
const foregroundColor = '#444444';
const cursorColor = 'rgba(31, 188, 210, 0.8)';
const borderColor = 'rgba(0, 0, 0, 0.15)';

const colors = {
  black: foregroundColor,
  red: '#D70000',
  green: '#008700',
  yellow: '#F8A738',
  blue: '#0087AF',
  magenta: '#8700AF',
  cyan: '#00AF5F',
  white: backgroundColor,
  lightBlack: '#546386',
  lightRed: '#E17E85',
  lightGreen: '#61BA86',
  lightYellow: '#FFB68E',
  lightBlue: '#4CB2FF',
  lightMagenta: '#BE86E3',
  lightCyan: '#2DCED0',
  lightWhite: foregroundColor,
  lightGray: 'rgba(0, 0, 0, 0.075)',
};

exports.decorateConfig = config => {
  return Object.assign({}, config, {
    foregroundColor,
    backgroundColor,
    borderColor,
    colors,
    cursorColor: config.cursorColor || cursorColor,
    termCSS: `
      ${config.termCSS || ''}

      ::selection { background: ${colors.lightGray} !important }
    `,
    css: `
      ${config.css || ''}

      .hyper_main { border-color: transparent !important }
      .tab_textInner, .tabs_title { color: ${foregroundColor} !important }
      .tab_textInner { opacity: 0.35 !important; }
      .tab_textActive .tab_textInner { opacity: 1 !important }
      .tab_icon {
        color: ${foregroundColor} !important;
        border-radius: 2px !important;
      }
      .tab_icon:hover { background-color: ${colors.lightGray} !important }
    `
  });
};
