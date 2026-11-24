# skwir-org's Homebrew tap

Formulae of skwir's projects, for macOS.

## skwird

An index of file names kept current by the system's change
notifications, answered over a local socket
([github.com/skwir-org/skwird](https://github.com/skwir-org/skwird)).
Built from its source.

Until its first release, from its main branch:

```sh
brew install --HEAD skwir-org/tap/skwird
```

Then, if you want it:

- `skwird logon add`: your own engine, started at each login;
- `sudo skwird service add`: the system service, every user's files,
  each user answered what they could list.

Without Full Disk Access, the folders macOS asks consent for (Desktop,
Documents, Downloads and others) are not read. Give it in System Settings,
Privacy & Security, Full Disk Access, and again after each upgrade: macOS
ties the grant to the program's signature.

Each formula is built and tested on GitHub's macOS runner at every push
(`.github/workflows/formulae.yml`).

## License

The formulae are under the MIT license, or Apache 2.0, at your choice, as
skwird is.
