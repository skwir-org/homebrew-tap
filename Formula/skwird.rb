# skwird, an index of file names kept current by the system's change
# notifications, answered over a local socket (github.com/skwir-org/skwird).
# Built from its source: a release's,
#   brew install skwir-org/tap/skwird
# or its main branch's,
#   brew install --HEAD skwir-org/tap/skwird
class Skwird < Formula
  desc "Index of file names kept current, answered over a local socket"
  homepage "https://github.com/skwir-org/skwird"
  url "https://github.com/skwir-org/skwird/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ddb44c9ff571fdb4a0f647c97da66ca11616d0e86190a140ec452682c6e29a1f"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/skwir-org/skwird.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/skwird")
  end

  def caveats
    <<~EOS
      skwird starts itself when a client asks it first. To start your own
      engine at each login instead (a LaunchAgent of yours):
        skwird logon add

      The system service indexes every user's files and answers each what
      they could list (a LaunchDaemon, run as root):
        sudo skwird service add

      Without Full Disk Access, the folders macOS asks consent for (Desktop,
      Documents, Downloads and others) are not read, and said not covered.
      Give it in System Settings > Privacy & Security > Full Disk Access to:
        #{opt_bin}/skwird
      macOS ties that grant to the program's signature, which a build of
      your own changes: give it again after each upgrade.
    EOS
  end

  test do
    # An engine of the test's own: its folders in the test's, never yours.
    home = testpath/"home"
    (home/"notes.txt").write "x"
    ENV["HOME"] = home
    ENV["XDG_RUNTIME_DIR"] = testpath/"run"
    ENV["XDG_CACHE_HOME"] = testpath/"cache"
    ENV["XDG_STATE_HOME"] = testpath/"state"
    ENV["XDG_CONFIG_HOME"] = testpath/"config"
    # Gone two seconds after its last client.
    ENV["SKWIRD_IDLE"] = "2"
    mkdir_p testpath/"run"
    # Started by the first client, proven current, then asked.
    system bin/"skwird", "sync", home
    assert_match "notes.txt", shell_output("#{bin}/skwird find notes --in #{home}")
  end
end
