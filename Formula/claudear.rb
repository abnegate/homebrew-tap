# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.22.0/claudear-macos-arm64.tar.gz"
      sha256 "fa4f1637c270836720fca8684d9b73ab4cf5be848ff8fe9044c609f8e1e2b6bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.22.0/claudear-linux-amd64.tar.gz"
      sha256 "7bc9fe2ff4f95c18bb726b5789cae5cc1ddcde6703147bcad79f4a2977fec3ca"
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
