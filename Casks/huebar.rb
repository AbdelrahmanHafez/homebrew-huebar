cask "huebar" do
  version "0.1.17"
  sha256 "b2722b0ca7f4ec9405c8caee333f4ace3b0a10e55820160b7efebcee4e5a5b5e"

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

  caveats <<~EOS
    HueBar is ad-hoc signed (no Developer ID). On first launch macOS Gatekeeper
    may block it. To allow:

      xattr -dr com.apple.quarantine /Applications/HueBar.app

    Or right-click HueBar.app in /Applications and choose Open.

    Signing roadmap: https://github.com/jurre/huebar/issues/36
  EOS

  zap trash: [
    "~/Library/Application Support/HueBar",
    "~/Library/Caches/com.jurre.huebar",
    "~/Library/HTTPStorages/com.jurre.huebar",
    "~/Library/Preferences/com.jurre.huebar.plist",
    "~/Library/Saved Application State/com.jurre.huebar.savedState",
  ]
end
