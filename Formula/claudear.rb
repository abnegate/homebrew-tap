# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.54.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.54.0/claudear-macos-arm64.tar.gz"
      sha256 "730f7f563675e3f7ba1a547a4292446de6b9b1414bca58e4a8c1dcf07bf934c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.54.0/claudear-linux-amd64.tar.gz"
      sha256 "7f8997972ca4c63089d121f7ead4e53b841d2364a29005ddc3a010ce17794860"
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
