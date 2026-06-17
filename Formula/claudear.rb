# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.29.0/claudear-macos-arm64.tar.gz"
      sha256 "2d29e46442e21f25bfd2fc7313857b944da386e69227272b8f8db41fa6a02e53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.29.0/claudear-linux-amd64.tar.gz"
      sha256 "0b19a00e7fc4794c0e6bd13cdeb1f7ecf4d6a20d4fedc4919c0fc813c21ef489"
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
