cask "huebar" do
  version "0.1.19"
  sha256 "393af2530c0b656a611af0d7cb491cd3f8b1d758afe557cf4e768676304509bf"

  url "https://github.com/jurre/huebar/releases/download/v#{version}/HueBar.zip"
  name "HueBar"
  desc "Menu bar app for controlling Philips Hue lights"
  homepage "https://github.com/jurre/huebar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "HueBar.app"

  uninstall quit: "com.jurre.huebar"

  zap trash: [
    "~/Library/Application Support/HueBar",
    "~/Library/Caches/com.jurre.huebar",
    "~/Library/HTTPStorages/com.jurre.huebar",
    "~/Library/Preferences/com.jurre.huebar.plist",
    "~/Library/Saved Application State/com.jurre.huebar.savedState",
  ]

  caveats <<~EOS
    HueBar is ad-hoc signed (no Developer ID). On first launch macOS Gatekeeper
    may block it. To allow:

      xattr -dr com.apple.quarantine /Applications/HueBar.app

    Or right-click HueBar.app in /Applications and choose Open.

    Signing roadmap: https://github.com/jurre/huebar/issues/36
  EOS
end
