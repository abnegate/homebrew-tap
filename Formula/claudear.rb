# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.57.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.8/claudear-macos-arm64.tar.gz"
      sha256 "991e462f38e43a91d84098d25ece2c13d47434119feaf81cd6de7022e28785b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.8/claudear-linux-amd64.tar.gz"
      sha256 "a4009eca5c221287d55ee2d22cb2f4c0b1d1c212b8731cb64bb115b53e2cd046"
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
