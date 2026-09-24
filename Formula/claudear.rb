# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.53.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.53.0/claudear-macos-arm64.tar.gz"
      sha256 "e3cc36a13289e945f72783d01d0a9e3082e9c6921f3b145cb5a8b7beafde1a23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.53.0/claudear-linux-amd64.tar.gz"
      sha256 "0f2b19ed0d8d21c49fc5e47b07ddbf68bb356361fc8b29b76a76e5c92133b4fb"
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
