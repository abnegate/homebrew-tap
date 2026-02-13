# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.1.0/claudear-macos-arm64.tar.gz"
      sha256 "6b770301715da2f1f9fdad31d6212c2ba6a73abf770505c03d89692d5c87572b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.1.0/claudear-linux-amd64.tar.gz"
      sha256 "a19ae7d7e6a7ea68fac2074283ee623059ad56f8a30e71a5e7eeb7122f61df66"
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
