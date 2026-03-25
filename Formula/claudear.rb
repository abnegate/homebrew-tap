# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.24.0/claudear-macos-arm64.tar.gz"
      sha256 "55d20d135e1fa1c295a34ec86529861c6e514ff152cfe11c8bfaaec6624f4ad2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.24.0/claudear-linux-amd64.tar.gz"
      sha256 "dbe0895f8c05b1c81f2d8c550c85ebf2c31ba03f359c5131465cae47e7d7ed4f"
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
