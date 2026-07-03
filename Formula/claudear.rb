# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.35.0/claudear-macos-arm64.tar.gz"
      sha256 "dc1d1c31e0ccab777e09032d9798c169db9004f8a13d9d447f8e01dab7427836"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.35.0/claudear-linux-amd64.tar.gz"
      sha256 "9354b5e6aace4c2fc252f5d6e1827a78404017aacc37007e6c2a122e9792e9f5"
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
