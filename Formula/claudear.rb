# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.57.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.2/claudear-macos-arm64.tar.gz"
      sha256 "5f6df222106d98375a6338880c70e4d1872319fd4d10c1f8e65d9d574923c1fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.2/claudear-linux-amd64.tar.gz"
      sha256 "66b232e72b33f2b4cc0e65beb0c806c12d4ee6a6fd1b3d348d7290299ec31130"
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
