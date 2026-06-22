class Iptop < Formula
  desc "htop for your network — real-time terminal IP traffic monitor"
  homepage "https://github.com/franlol/iptop"
  version "0.1.2"
  license "MIT"

  # macOS: Apple Silicon only (Intel Macs are not supported via this tap).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/franlol/iptop/releases/download/v0.1.2/iptop-v0.1.2-darwin-arm64.tar.gz"
      sha256 "e074f95e98c4ca1ea839f9a4b957f990ae9cb08244c325c540587177d0f40780"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/franlol/iptop/releases/download/v0.1.2/iptop-v0.1.2-linux-arm64.tar.gz"
      sha256 "f754c5da9531370e357dc61ee8bd15e771a276184e74fb71c151eca7f6be428a"
    end
    on_intel do
      url "https://github.com/franlol/iptop/releases/download/v0.1.2/iptop-v0.1.2-linux-x64.tar.gz"
      sha256 "51ede27a2f8b854f68787e099c17f1e73d386fed6d919acbf80b2c50660080d0"
    end
  end

  def install
    bin.install "iptop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iptop --version")
  end
end
