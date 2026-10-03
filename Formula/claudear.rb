# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.55.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.55.0/claudear-macos-arm64.tar.gz"
      sha256 "9b5a328780c89acf9172f16aecc6b2f68bc9f54f1b2d5466f3f711706f145c5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.55.0/claudear-linux-amd64.tar.gz"
      sha256 "d87b413f6205f730546200ccebd3c1831fdac4a12229ddbde65c041412b273a1"
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
