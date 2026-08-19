# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.51.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.51.0/claudear-macos-arm64.tar.gz"
      sha256 "7dc7df85a65d061648c506ddfdeeab7667f6da2a96b708996161bc8b0785a9e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.51.0/claudear-linux-amd64.tar.gz"
      sha256 "4167d1df7274abdaad094cc57ddf6e2a7556ed9375dffc05d04e522f2ccc7112"
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
