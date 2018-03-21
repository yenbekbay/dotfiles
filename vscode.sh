#!/usr/bin/env bash

code --install-extension dbaeumer.vscode-eslint
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension flowtype.flow-for-vscode
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension PeterJausovec.vscode-docker
code --install-extension robertohuertasm.vscode-icons
code --install-extension vsmobile.vscode-react-native
code --install-extension WakaTime.vscode-wakatime
code --install-extension will-stone.plastic

cat > "~/Library/Application Support/Code/User/settings.json" <<EOF
{
  "editor.detectIndentation": true,
  "editor.fontFamily": "Monoid-Retina, Menlo, monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 11,
  "editor.fontWeight": "300",
  "editor.renderWhitespace": "boundary",
  "editor.rulers": [80],
  "editor.scrollBeyondLastLine": false,
  "editor.wordBasedSuggestions": false,

  "extensions.ignoreRecommendations": true,

  "files.associations": {
    ".flowconfig": "ini",
    "*.h": "objective-c",
    "*.js.flow": "javascript",
    "*.podspec": "ruby",
    "Appfile": "ruby",
    "Deliverfile": "ruby",
    "Fastfile": "ruby",
    "Gymfile": "ruby",
    "Matchfile": "ruby",
    "Podfile": "ruby",
    "Vagrantfile": "ruby"
  },

  "flow.runOnEdit": false,

  "gitlens.blame.line.enabled": false,
  "gitlens.codeLens.enabled": false,

  "javascript.validate.enable": false,
  "javascript.nameSuggestions": false,

  "search.useRipgrep": false,

  "terminal.integrated.fontSize": 11,

  "window.zoomLevel": 0,
  "window.openFilesInNewWindow": "off",

  "workbench.colorTheme": "Plastic - deprioritised punctuation",
  "workbench.iconTheme": "vscode-icons",
  "workbench.sideBar.location": "right",

  "vsicons.associations.files": [
    {
      "icon": "config",
      "extensions": ["env.example"],
      "light": true,
      "format": "FileFormat.svg"
    }
  ],
  "vsicons.dontShowNewVersionMessage": true,
  "vsicons.projectDetection.disableDetect": true
}
EOF
