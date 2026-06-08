# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.27.0/claudear-macos-arm64.tar.gz"
      sha256 "7f7a10276fb2a1f4d8a266676340d39c5a20740590a91c50db48e659f16e314b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.27.0/claudear-linux-amd64.tar.gz"
      sha256 "eb91376039900364ebc51ec9d7701f89c333f8abb7d764bcd30b1dd656fc47e4"
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
