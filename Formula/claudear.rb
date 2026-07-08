# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.37.0/claudear-macos-arm64.tar.gz"
      sha256 "a3e3b3641dbf42000c4d5f1e947acd6d085a031f3654f7d3b20b9d3bf9fae017"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.37.0/claudear-linux-amd64.tar.gz"
      sha256 "4ae035966b2833f0f711dcc07b44df4d5f867002086ca9fb7944c827507664e1"
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
