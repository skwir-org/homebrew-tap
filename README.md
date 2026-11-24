# skwir-org's Homebrew tap

Formulae and casks of skwir's projects, for macOS.

## skwird

An index of file names kept current by the system's change
notifications, answered over a local socket
([github.com/skwir-org/skwird](https://github.com/skwir-org/skwird)).
Built from its source.

Until its first release, from its main branch. Homebrew asks that a
tap of anyone but its own be trusted first:

```sh
brew tap skwir-org/tap
brew trust skwir-org/tap
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

## skwir

A file manager for humans and agents
([skwir.org](https://skwir.org/)): the Mac app of skwir's release, for
Apple silicon and macOS 12 or later. The cask installs the release's
own zip, as it is on the release's page:

```sh
brew tap skwir-org/tap
brew trust skwir-org/tap
brew install --cask skwir-org/tap/skwir
```

`brew upgrade` then updates it, and skwir says nothing of its new
versions itself. The app is signed ad hoc and not notarized by Apple, so
macOS refuses its first start: open it once, then choose Open Anyway
beside skwir in System Settings, Privacy & Security. The cask leaves
that to macOS and never takes the quarantine off. `skwir` is also put
on the PATH, for scripts and agents. The cask is installed and
uninstalled on GitHub's macOS runner at every push.

## License

The formulae and casks are under the MIT license, or Apache 2.0, at your
choice.
