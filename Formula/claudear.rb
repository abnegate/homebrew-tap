# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.7.0/claudear-macos-arm64.tar.gz"
      sha256 "5a4f2789cc928857ab65415d201d79162f6aefc22b65c3f9d59fa2e2b0bc8bd8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.7.0/claudear-linux-amd64.tar.gz"
      sha256 "0dd14e90dada4656bbf4887447ebdd6802c34bebfd7eb606d8a6fd64e23e3d77"
    end
  end

  def install
    bin.install "claudear-macos-arm64" => "claudear" if OS.mac? && Hardware::CPU.arm?
    bin.install "claudear-linux-amd64" => "claudear" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    system "#{bin}/claudear", "--version"
  end
end
