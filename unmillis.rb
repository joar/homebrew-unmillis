class Unmillis < Formula
  desc "Converts millisecond UNIX timestamps to the more readable RFC3339 format"
  homepage "https://github.com/joar/unmillis"
  url "https://github.com/joar/unmillis/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "cca4250c938f20a4a399265e47ac754fc7adf44fe4e3d4b0aed56710f5faf31e"
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