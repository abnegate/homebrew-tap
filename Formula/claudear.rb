# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.47.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.47.0/claudear-macos-arm64.tar.gz"
      sha256 "6c21114fdf7ab53e821dbb463b2d8f5c45611fbaedbbd1d6a0907a9e078cbb5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.47.0/claudear-linux-amd64.tar.gz"
      sha256 "6f6d3497e02ad2c3f0c3d90b0ab17de47bb6580e18e343a6ede9ecdfffb46f58"
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
