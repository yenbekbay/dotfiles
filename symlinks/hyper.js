module.exports = {
  config: {
    fontSize: 11,
    fontFamily: 'Monoid, Menlo, monospace',
    cursorShape: 'BLOCK',
    termCSS: `
      .cursor-node[focus=true] {
        mix-blend-mode: difference;
      }
    `,
    padding: '12px 14px',
    bell: 'SOUND',
    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hypercwd',
    'hyperlinks',
    'hyper-snazzy'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
