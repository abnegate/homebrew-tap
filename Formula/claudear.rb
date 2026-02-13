# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.3.1/claudear-macos-arm64.tar.gz"
      sha256 "c32c5037b9734ab723ea3e9e25345026461ee2a6fdcb9b7f528b05a6f4c45c22"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.3.1/claudear-linux-amd64.tar.gz"
      sha256 "dcd363ae3acaa8513e5d2a295a9f6737db6a952d25c7e1811fdc71cbd1a07a62"
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
