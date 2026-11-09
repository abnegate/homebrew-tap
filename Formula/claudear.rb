# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.57.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.1/claudear-macos-arm64.tar.gz"
      sha256 "a11b4bbedf02ee6bfb16021d872829769db171511cff02d88cf6009923abdd0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.1/claudear-linux-amd64.tar.gz"
      sha256 "c09eacb28af29b22c8c4b5fabbdfbca1c731be1b255b9d17a1a45e49b706bc9b"
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
