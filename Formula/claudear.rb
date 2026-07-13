# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.40.0/claudear-macos-arm64.tar.gz"
      sha256 "2f4a6c5d875b2fd17130909367a2563b5fd0f507caf676b50ff395cd760b24e4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.40.0/claudear-linux-amd64.tar.gz"
      sha256 "fcbc73c7aeb59e0576a17d86af5c7392a280e4a6fb34ee74bc9f820f0a2db3cf"
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
