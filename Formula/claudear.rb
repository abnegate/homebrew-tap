# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.32.0/claudear-macos-arm64.tar.gz"
      sha256 "6d2eb6a0fac35951f858ab0c0cfe3af3fd10a1b3cf08ca119e0eceb49840e39f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.32.0/claudear-linux-amd64.tar.gz"
      sha256 "0a40672d12157b93fbb848c8345da4c8a88c796261cce8808de6421a1ecf31a6"
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
