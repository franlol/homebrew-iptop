class Iptop < Formula
  desc "htop for your network — real-time terminal IP traffic monitor"
  homepage "https://github.com/franlol/iptop"
  version "0.1.0"
  license "MIT"

  # macOS: Apple Silicon only (Intel Macs are not supported via this tap).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/franlol/iptop/releases/download/v0.1.0/iptop-v0.1.0-darwin-arm64.tar.gz"
      sha256 "b8b81a97ffc5551e5f34244f5238488414257a63de169c0a90d3bc5b5082b106"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/franlol/iptop/releases/download/v0.1.0/iptop-v0.1.0-linux-arm64.tar.gz"
      sha256 "f37e2c8d505a130b449a08ec3166167a8386439aa6a967f89a797a3fa9a4ea1d"
    end
    on_intel do
      url "https://github.com/franlol/iptop/releases/download/v0.1.0/iptop-v0.1.0-linux-x64.tar.gz"
      sha256 "d3b6cb94c541831bebdd98c49333752c3c8fa0291099792fcce11b319d196ecf"
    end
  end

  def install
    bin.install "iptop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iptop --version")
  end
end
