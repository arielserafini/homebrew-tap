# homebrew-tap

Homebrew tap for [Meeter](https://github.com/arielserafini/homebrew-tap) — a tiny native
macOS app that wraps Google Meet in its own window.

## Install

```sh
brew install --cask arielserafini/tap/meeter
```

That's it — no extra flags, no password. The app opens straight away.

> **Why no notarization?** Meeter is a personal side-project, code-signed but not notarized
> through Apple's paid Developer ID program. The cask removes the download quarantine flag on
> your behalf so macOS Gatekeeper doesn't block first launch. This only affects this one app,
> runs as your user (no admin password), and you can inspect exactly what it does in
> [`Casks/meeter.rb`](Casks/meeter.rb). If you'd rather macOS treat it like any other download,
> install with `--no-quarantine` omitted and approve it once via **System Settings → Privacy &
> Security → Open Anyway**.

## Update / uninstall

```sh
brew upgrade --cask meeter
brew uninstall --cask meeter          # remove the app
brew uninstall --zap --cask meeter    # also clear app state + saved Google login
```
