module.exports = {
  multipass: true,
  js2svg: {
    eol: 'lf',
    finalNewline: true,
    indent: 2,
  },
  plugins: [
    'preset-default',
    {
      name: 'preset-default',
      params: {
        overrides: {
          removeViewBox: false,
          cleanupIds: {
            preservePrefixes: ['SVGID_'],
          },
        },
      },
    },
    'sortAttrs',
  ],
};