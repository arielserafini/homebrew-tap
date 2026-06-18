# homebrew-tap

Homebrew tap for **Meeter** — a tiny native macOS app that wraps Google Meet in its own window.

## Install

```sh
brew install --cask --appdir=~/Applications arielserafini/tap/meeter
```

`--appdir=~/Applications` installs into your **personal** Applications folder, which never asks
for an admin password. On managed / work Macs the system `/Applications` is usually locked down,
so a plain install would prompt for `sudo` — pointing it at `~/Applications` sidesteps that. The
`~` expands to your own home folder. (If Homebrew ever says the folder is missing, run
`mkdir -p ~/Applications` first.)

> **Admin on your own Mac and happy with `/Applications`?** Drop the flag:
> `brew install --cask arielserafini/tap/meeter`
>
> **Want `~/Applications` to stick for upgrades too?** Add this to your shell profile
> (`~/.zshrc`, `~/.bashrc`, …) once, then the flag is no longer needed:
> `export HOMEBREW_CASK_OPTS="--appdir=~/Applications"`

## Update / uninstall

```sh
brew upgrade --cask meeter
brew uninstall --cask meeter          # remove the app
brew uninstall --zap --cask meeter    # also clear app state + saved Google login
```

## Notes

- **Not notarized.** Meeter is a personal side-project — code-signed, but not run through Apple's
  paid Developer ID notarization. The cask removes the download quarantine flag for you so macOS
  Gatekeeper doesn't block first launch (no admin password needed). You're trusting this build;
  it's all inspectable in [`Casks/meeter.rb`](Casks/meeter.rb).
- **First-tap trust prompt.** Recent Homebrew may ask you to trust this third-party tap before
  installing. If so, run `brew tap arielserafini/tap` and then the install command above.
