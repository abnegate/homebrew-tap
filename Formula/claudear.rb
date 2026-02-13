# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.3.0/claudear-macos-arm64.tar.gz"
      sha256 "7e7a7572544a763404a1f9cb2996b0d191361f5281ae311d5aef046d7aa56e2e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.3.0/claudear-linux-amd64.tar.gz"
      sha256 "b8898df73b9329eba7f9550473662ecc99a8d9b644607770e1faa6e02833bbc5"
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
