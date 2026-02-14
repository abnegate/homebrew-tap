# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.4.0/claudear-macos-arm64.tar.gz"
      sha256 "4f28d2c6daed1b5f6ca50c7edb3f856a26d23c75db177094ec821f2940e7e42f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.4.0/claudear-linux-amd64.tar.gz"
      sha256 "54074bc166c6f63abfc71c5526086c7c3393dc44cc8ebf6c86dbea4b5447a5a7"
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
