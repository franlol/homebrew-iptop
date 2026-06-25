class Gbins < Formula
  desc "GTFOBins in your terminal — fuzzy-search and copy the exploit"
  homepage "https://github.com/franlol/gbins"
  version "0.1.0"
  license "MIT"

  # macOS: Apple Silicon only (Intel Macs are not supported via this tap).
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/franlol/gbins/releases/download/v0.1.0/gbins-v0.1.0-darwin-arm64.tar.gz"
      sha256 "38185ecbd37545c145eba6d2c5ec372eece3cfa85d5bac001a8413875a2cccf8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/franlol/gbins/releases/download/v0.1.0/gbins-v0.1.0-linux-arm64.tar.gz"
      sha256 "f94bfd5dadb88e342154bb01e9fd0a8b4d76d3fc6b9fd20137fb4396879b7d0a"
    end
    on_intel do
      url "https://github.com/franlol/gbins/releases/download/v0.1.0/gbins-v0.1.0-linux-x64.tar.gz"
      sha256 "d1b40446a56307fa45f272b95f4b454b52efa43269b619807bfc855a6a20fda6"
    end
  end

  def install
    bin.install "gbins"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gbins --version")
  end
end
