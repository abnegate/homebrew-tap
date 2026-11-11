# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.57.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.4/claudear-macos-arm64.tar.gz"
      sha256 "114a3028e905db0af2ffc034d38b09a86a06051ca10d2ab1d9380be80d539a6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.4/claudear-linux-amd64.tar.gz"
      sha256 "9739bf922fbfdc453b334c9d977fbc521386ecca0fe18219e7e70e1f0fe7567f"
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
