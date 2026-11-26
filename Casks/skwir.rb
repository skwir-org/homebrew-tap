# Skwir, a file manager for humans and agents (skwir.org): the Mac app of
# its release, the release's own zip. Written at each release by skwir's
# `just cask <tag>` (tools/package/cask.py), not by hand.
cask "skwir" do
  version "0.7.1"
  sha256 "5609c56009adad38407286e4253435daf57c4a8064113ca17677a57b5c1f300f"

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
  binary "#{appdir}/skwir.app/Contents/MacOS/skwir", target: "skw"

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

    skwir carries skwird, its index of names. A skwird Homebrew
    installs takes the carried one's place, and Homebrew updates it:
      brew install skwir-org/tap/skwird
  EOS
end
