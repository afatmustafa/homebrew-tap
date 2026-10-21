cask "swapbar" do
  version "0.4.0"
  sha256 "8d43733811660eb9ef50f9b2cc0a346fee4510e13e179d63e9a0981e6927e0d6"

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
