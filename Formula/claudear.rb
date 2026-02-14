# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.5.0/claudear-macos-arm64.tar.gz"
      sha256 "b843b9cfd94a2a2abd0a819b47db040850372728f235604dde7be99aa13f5d3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.5.0/claudear-linux-amd64.tar.gz"
      sha256 "ff5fd21f080980bcff597148a606b8746970cd8e5b1f8c2c8ace3758ef07702c"
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
