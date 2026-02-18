# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.10.1/claudear-macos-arm64.tar.gz"
      sha256 "9d448c8467148216e8a1ccc7578c71e593593fcfebddb4fb5f489d06ab686387"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.10.1/claudear-linux-amd64.tar.gz"
      sha256 "1b7ac81e7591263d4d84b39d911a3ac66729e63bfb3eb3941d48697a0db9ff77"
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
