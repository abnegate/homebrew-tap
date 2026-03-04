# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.21.0/claudear-macos-arm64.tar.gz"
      sha256 "4ef219ccc846bd77dc735788e4141e2ed06f0dc5e785be695a6d85fdb0129d2c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.21.0/claudear-linux-amd64.tar.gz"
      sha256 "9fd508709e10ac528add0d0f3f853787b03875a90a0a0aaf0cf6afd05fa9f4f3"
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
