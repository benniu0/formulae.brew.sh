cask "printopia" do
  version "3.0.19"
  sha256 "fe565c3e5da8ce86dd912fcddd6bca472dd4e33bdfc537018841bcaf73828d16"

  url "https://download.decisivetactics.com/downloads/printopia/Printopia_#{version}.zip"
  name "Printopia"
  desc "AirPrint to any printer"
  homepage "https://www.decisivetactics.com/products/printopia/"

  livecheck do
    url "https://www.decisivetactics.com/api/checkupdate?x-app_id=com.decisivetactics.printopia"
    regex(%r{/Printopia_(\d+(?:\.\d+)+)\.zip}i)
  end

  app "Printopia.app"

  uninstall launchctl: "com.decisivetactics.printopia-server",
            quit:      [
              "com.decisivetactics.printopia",
              "com.decisivetactics.printopia-server",
            ]

  zap trash: [
    "~/Library/Application Support/com.decisivetactics.printopia",
    "~/Library/Caches/com.decisivetactics.printopia",
    "~/Library/Preferences/com.decisivetactics.printopia.plist",
    "~/Library/Saved Application State/com.decisivetactics.printopia.savedState",
    "/Library/Application Support/com.decisivetactics.printopia",
    "/Library/Logs/Printopia",
    "/Users/Shared/._com.decisivetactics.printopia",
    "/Users/Shared/Printopia",
  ]
end
