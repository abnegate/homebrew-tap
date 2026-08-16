# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.49.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.49.0/claudear-macos-arm64.tar.gz"
      sha256 "27a202810bf3b4e4fba25ede4e2caac4bac358861c1a6a8ffb24b4db38c4ec86"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.49.0/claudear-linux-amd64.tar.gz"
      sha256 "4fcec94c01d687a5ff7fc8edd39b42c17a764a12d192694dfab122ab14869586"
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
