# homebrew-huebar

A Homebrew tap for [HueBar](https://github.com/jurre/huebar), a native macOS menubar app for controlling Philips Hue lights.

## Install

```bash
brew install --cask AbdelrahmanHafez/huebar/huebar
```

Or, equivalently:

```bash
brew tap AbdelrahmanHafez/huebar
brew install --cask huebar
```

## Brewfile

```ruby
tap "AbdelrahmanHafez/huebar"
cask "huebar"
```

## Updates

```bash
brew upgrade --cask huebar
```

The cask is auto-bumped within 24 hours of each upstream release via [`.github/workflows/bump.yml`](.github/workflows/bump.yml), which polls the latest [`jurre/huebar`](https://github.com/jurre/huebar/releases) release, verifies the `HueBar.zip` checksum, and commits the change directly to `main`.

## Uninstall

```bash
brew uninstall --cask huebar
brew untap AbdelrahmanHafez/huebar
```

To also remove HueBar's local data (bridge credentials, preferences):

```bash
brew uninstall --cask --zap huebar
```

## Notes

- HueBar is ad-hoc signed. Homebrew strips the `com.apple.quarantine` xattr on install, so Gatekeeper does not prompt.
- Requires macOS 15 (Sequoia) or later.
- This tap is unaffiliated with upstream. See [jurre/huebar#36](https://github.com/jurre/huebar/issues/36) for context.
