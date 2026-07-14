# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.41.0/claudear-macos-arm64.tar.gz"
      sha256 "dfe64188ffca9bef0a95f4de9398678cb6a6d1c9bc6c942e531a9ca8a6827d7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.41.0/claudear-linux-amd64.tar.gz"
      sha256 "d5dcd0824f5cfd4e7ed8bc9e6f0fd44ac69d3cc523bd90ab5edf061152683d7a"
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
