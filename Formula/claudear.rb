# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.15.0/claudear-macos-arm64.tar.gz"
      sha256 "e35b383501ba2eb6c6f66641e0dee5fd1381bcc3d8f1a361243582c497262c61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.15.0/claudear-linux-amd64.tar.gz"
      sha256 "ec4fe14877c17eb418a600c34ba142ab161d19e4879bb4ab11f95222277beb82"
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
