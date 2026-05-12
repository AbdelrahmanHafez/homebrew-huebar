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

- HueBar is ad-hoc signed (no Developer ID), so Homebrew applies the standard `com.apple.quarantine` xattr at install time and macOS Gatekeeper may block first launch. Two ways around it:

  ```bash
  # Option 1: install once with quarantine disabled
  brew install --cask --no-quarantine huebar

  # Option 2: install normally, then strip quarantine after each upgrade
  xattr -dr com.apple.quarantine /Applications/HueBar.app
  ```

  Or right-click `HueBar.app` in `/Applications` and choose Open. Signing roadmap is tracked in [jurre/huebar#36](https://github.com/jurre/huebar/issues/36).
- Requires macOS 15 (Sequoia) or later.
- This tap is unaffiliated with upstream.
