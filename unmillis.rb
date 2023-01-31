class Unmillis < Formula
  desc "Converts millisecond UNIX timestamps to the more readable RFC3339 format"
  homepage "https://github.com/joar/unmillis"
  url "https://github.com/joar/unmillis/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "a57358172d0c1f77b53ec710b5be967bd1d91de3e07c39fb4380d45f01abfc0e"
  head "https://github.com/joar/unmillis.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    system "env", "UNMILLIS_GEN_MANPAGE_PATH=unmillis.1", "./target/release/unmillis"

    bin.install "target/release/unmillis"
    man1.install "unmillis.1"
  end

  test do
    system "#{bin}/unmillis", "1000"
  end
end