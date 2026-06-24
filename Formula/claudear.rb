# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.34.0/claudear-macos-arm64.tar.gz"
      sha256 "34a0b388e52b5783f258c9157856f6acff7688aac6d28a9f60a881a7a4dbcdf5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.34.0/claudear-linux-amd64.tar.gz"
      sha256 "7a9c7e7ecb1fc2abc406a1c530a5ecd3b8fd83899c778a8f55b63fd97c5d16fc"
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
