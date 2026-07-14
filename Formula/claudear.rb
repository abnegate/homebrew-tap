# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.44.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.44.0/claudear-macos-arm64.tar.gz"
      sha256 "a1f5d4d6d2dcafd749331fd6dababb32f347bf7a61bf99f6d615fa246563a7e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.44.0/claudear-linux-amd64.tar.gz"
      sha256 "b6cea7c6428e26b31c0c92a4b95e18dea77c401f17d544ede62d6fdcbb9d713b"
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
