module.exports = {
  config: {
    fontSize: 11,
    fontFamily: 'Monoid, monospace',
    padding: '12px 14px',
    cursorShape: 'BLOCK',
    shell: '/usr/local/bin/zsh',
    shellArgs: ['--login'],
    env: {},
    bell: 'SOUND',
    copyOnSelect: false,
    summonShortcut: 'Ctrl+`',
  },
  plugins: [
    'hyperterm-base16-tomorrow-night',

    'hyper-autohide-tabs',
    'hyper-statusline',
    'hyper-tabs-enhanced',
    'hypercwd',
    'hyperlinks',
    'hyperterm-paste',
    'hyperterm-summon',
  ],
  localPlugins: [],
};
