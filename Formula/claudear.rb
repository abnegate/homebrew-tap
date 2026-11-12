# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.57.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.7/claudear-macos-arm64.tar.gz"
      sha256 "74e7f206e16728fb58978ceca9aaf4f6cd90cfea97f08fe4ba80585cbe4df03d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.7/claudear-linux-amd64.tar.gz"
      sha256 "739cf7a94e48efdb72d6c29c826ad7427bf1753d5e0a5c87be79c46716e1b902"
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
