# Skwir, a file manager for humans and agents (skwir.org): the Mac app of
# its release, the release's own zip. Written at each release by skwir's
# `just cask <tag>` (tools/package/cask.py), not by hand.
cask "skwir" do
  version "0.7.0"
  sha256 "0d672e42d4dd06b6373eedfa42c4faa496b01a8d61ad06aca7244c301d1d21c5"

  url "https://github.com/skwir-org/skwir/releases/download/v#{version}/skwir-#{version}-macos-arm64.zip",
      verified: "github.com/skwir-org/skwir/"
  name "Skwir"
  desc "Browse, find and organize your files"
  homepage "https://skwir.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "skwir.app"
  binary "#{appdir}/skwir.app/Contents/MacOS/skwir"

  zap trash: [
    "~/Library/Application Support/skwir",
    "~/Library/Caches/skwir",
    "~/Library/Preferences/org.skwir.skwir.plist",
    "~/Library/Saved Application State/org.skwir.skwir.savedState",
  ]

  caveats <<~EOS
    skwir is signed ad hoc and not notarized by Apple, so macOS refuses
    its first start. Open it once, then choose Open Anyway beside skwir
    in System Settings > Privacy & Security.

    Homebrew loads this tap's casks once the tap is trusted:
      brew trust skwir-org/tap
  EOS
end
