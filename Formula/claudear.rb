# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.1.2/claudear-macos-arm64.tar.gz"
      sha256 "c9cd2d24bbfbd1d2d80770a611e807d024a0aca309d51c6b39c26fc057b1e9c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.1.2/claudear-linux-amd64.tar.gz"
      sha256 "8cdff0fbb4c8cd66e3a9ffd34decd2bf7ab95c90667129ea4a22488fcdd25bfa"
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
