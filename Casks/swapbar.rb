cask "swapbar" do
  version "0.3.0"
  sha256 "f34a30dc3d2200875f0c3379486aea365e27a562fada91fa79416342b2d8bf8d"

  url "https://github.com/afatmustafa/swapbar/releases/download/v#{version}/Swapbar.dmg"
  name "Swapbar"
  desc "Menu bar quota monitor and account switcher for claude-swap"
  homepage "https://swapbar.afat.me/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Swapbar.app"

  uninstall launchctl: "com.miova.swapbar",
            quit:      "com.miova.swapbar"

  zap trash: [
    "~/.config/swapbar",
    "~/Library/LaunchAgents/com.miova.swapbar.plist",
  ]

  caveats <<~EOS
    Swapbar shows the accounts of claude-swap (cswap). Install it and add your accounts first:
      https://github.com/realiti4/claude-swap
  EOS
end
