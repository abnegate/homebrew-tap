# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.56.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.56.0/claudear-macos-arm64.tar.gz"
      sha256 "adc2bb4b4ea869c26bc2e2215c89328ff62be0fcdf4e42e58b0cfe4a088c29f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.56.0/claudear-linux-amd64.tar.gz"
      sha256 "eb7c9c321992948903ff480976a1ad62321f2d0e7edfc2124b6cddc271834f3a"
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
