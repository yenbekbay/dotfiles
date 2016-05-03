# Ayan's dotfiles ![](https://img.shields.io/badge/platform-osx-lightgrey.svg) ![](https://img.shields.io/github/license/yenbekbay/dotfiles.svg)

This repository holds my [configuration files](https://en.wikipedia.org/wiki/Configuration_file) so that I can clone them to other machines easily.

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

```bash
curl -fsSL https://raw.githubusercontent.com/yenbekbay/dotfiles/master/bootstrap.sh | sh
```

---

You can also try my dotfiles without polluting your development environment.

First install [Vagrant](https://www.vagrantup.com/docs/installation/) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Then set up an El Capitan machine by running:

```bash
vagrant init jhcook/osx-elcapitan-10.11
vagrant up --provider virtualbox
```

## Credits

Inspired by:

- [@b4b4r07's dotfiles](https://github.com/b4b4r07/dotfiles)
- [@mathiasbynens's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [@thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles)

## License

MIT © [Ayan Yenbekbay](http://yenbekbay.me)
