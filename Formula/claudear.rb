# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.19.0/claudear-macos-arm64.tar.gz"
      sha256 "4766e4e2d4d027cc2545e7443a49b811eeb3a2de28eb171e72bf4fccee9f5a3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.19.0/claudear-linux-amd64.tar.gz"
      sha256 "ecaf39d618cd35c18a84b92a79cdb51cac47ef896c9d94dfb20ae342a71794ce"
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
