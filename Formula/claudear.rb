# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.43.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.43.0/claudear-macos-arm64.tar.gz"
      sha256 "a5b950cdd6dc200fd79c3125a094aadb4732c9720ac96d6c02612808b5b1e7bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.43.0/claudear-linux-amd64.tar.gz"
      sha256 "53185ec8a61c0bf44f2196e9a53c21dca9bc7120db9eb9bf87d347941331b627"
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
