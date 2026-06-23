cask "meeter" do
  version "1.6.0"
  sha256 "c19d4f94399178429377ad402d5c350aeb8bbce1d8bf698bea18c4c5376b5186"

  url "https://github.com/arielserafini/homebrew-tap/releases/download/v#{version}/Meeter-#{version}.zip"
  name "Meeter"
  desc "Native macOS wrapper for Google Meet"
  homepage "https://github.com/arielserafini/homebrew-tap"

  # First-party release; no upstream appcast, so check the tap's own GitHub releases.
  livecheck do
    url :url
    strategy :github_latest
  end

  app "Meeter.app"

  # Meeter is self-signed, not notarized. Homebrew tags downloads with com.apple.quarantine
  # (mimicking a browser), which would make Gatekeeper block first launch. Strip that tag so
  # the app opens normally. This runs as the installing user — no password / sudo required.
  # NOTE: this is intentionally disallowed in the official homebrew/cask tap; it's acceptable
  # only because this is a personal tap and you are choosing to trust this build.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Meeter.app"]
  end

  uninstall quit: "com.arielserafini.meeter"

  # Clears app state + the embedded WebKit profile (Google login cookies live here).
  zap trash: [
    "~/Library/Preferences/com.arielserafini.meeter.plist",
    "~/Library/Saved Application State/com.arielserafini.meeter.savedState",
    "~/Library/WebKit/com.arielserafini.meeter",
    "~/Library/Caches/com.arielserafini.meeter",
    "~/Library/HTTPStorages/com.arielserafini.meeter",
  ]
end
