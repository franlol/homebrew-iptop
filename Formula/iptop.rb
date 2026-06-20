class Iptop < Formula
  desc "htop for your network — real-time terminal IP traffic monitor"
  homepage "https://github.com/franlol/iptop"
  version "0.1.1"
  license "MIT"

  # macOS: Apple Silicon only (Intel Macs are not supported via this tap).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/franlol/iptop/releases/download/v0.1.1/iptop-v0.1.1-darwin-arm64.tar.gz"
      sha256 "355d707fca02c04d97153a485f673d499e5da24b38e05c3efc33c6ffa535ba2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/franlol/iptop/releases/download/v0.1.1/iptop-v0.1.1-linux-arm64.tar.gz"
      sha256 "663591231a6428e6ceddbb7519cf38c1b5860ec782431361f7502cfee8c96e04"
    end
    on_intel do
      url "https://github.com/franlol/iptop/releases/download/v0.1.1/iptop-v0.1.1-linux-x64.tar.gz"
      sha256 "35af78a63f027b8877dea251811bc29f5a1e9bb9a16afed6931f844be13b3705"
    end
  end

  def install
    bin.install "iptop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iptop --version")
  end
end
