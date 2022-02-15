module.exports = {
  brew: [
    // http://conqueringthecommandline.com/book/ack_ag
    'ack',
    'ag',
    'ant',
    // https://github.com/wting/autojump
    'autojump',
    // alternative to `cat`: https://github.com/sharkdp/bat
    'bat',
    'bower',
    // Install GNU core utilities (those that come with macOS are outdated)
    // Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    'coreutils',
    'dos2unix',
    // Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
    'findutils',
    // 'fortune',
    'fzf',
    'readline', // ensure gawk gets good readline
    'gawk',
    'gdub',
    // http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
    'gifsicle',
    'gnupg',
    // Install GNU `sed`, overwriting the built-in `sed`
    // so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
    'gnu-sed --with-default-names',
    // upgrade grep so we can get things like inverted match (-v)
    'grep --with-default-names',
    'helm',
    // better, more recent grep
    'homebrew/dupes/grep',
    // https://github.com/jkbrzt/httpie
    'httpie',
    'go',
    // jq is a sort of JSON grep
    'jq',
    // Mac App Store CLI: https://github.com/mas-cli/mas
    'mas',
    'maven@3.5',
    // Install some other useful utilities like `sponge`
    'moreutils',
    'nmap',
    'openconnect',
    'python@2',
    'reattach-to-user-namespace',
    'redis',
    // better/more recent version of screen
    'homebrew/dupes/screen',
    'stern',
    'shpotify',
    'telnet',
    'terraform-docs',
    'tfenv',
    'tmux',
    'todo-txt',
    'tree',
    'ttyrec',
    // better, more recent vim
    'vim --with-client-server --with-override-system-vi',
    'watch',
    'wget',
    'yarn'
  ],
  cask: [
    'caffeine',
    'docker', // docker for mac
    'google-cloud-sdk',
    'intellij-idea',
    'iterm2',
    'java8',
    'minikube',
    'scroll-reverser',
    'little-snitch',
    'micro-snitch',
    'sizeup',
    //'sketchup',
    'slack',
    'spotify',
    'steam',
    'the-unarchiver',
    'visual-studio-code',
    'virtualbox',
    'xquartz'
  ],
  gem: [
  ],
  npm: [
    'artillery',
    'cloc',
    'eslint',
    'firebase-tools',
    'gulp',
    'instant-markdown-d',
    'npm-check-updates',
    'prettyjson',
    'trash',
    'vue',
    'vtop'
  ],
  mas: [
    //com.apple.dt.Xcode (10.2.1)
    //'497799835',
    //com.if.Amphetamine (4.1.6)
    //'937984704',
    //net.shinyfrog.bear (1.6.15)
    //'1091189122',
    //com.monosnap.monosnap (3.5.8)
    //'540348655',
    //com.app77.pwsafemac (4.17)
    //'520993579',
  ],
};
