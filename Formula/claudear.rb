# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.46.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.46.0/claudear-macos-arm64.tar.gz"
      sha256 "3ed805bfd4bbb1a0f9432eee36e782370b35bfe4df230351a8287c52f1cff279"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.46.0/claudear-linux-amd64.tar.gz"
      sha256 "6b1e72f0d90c6c606dafdc6af8a644c0cb8676d7966b65c459a94fcb7e1dcf81"
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
