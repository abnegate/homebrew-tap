# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.39.0/claudear-macos-arm64.tar.gz"
      sha256 "799bc9d525dc6084596e57bd8b0c349ff372c3fa41e6f81a9150dcc3a111fcbf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.39.0/claudear-linux-amd64.tar.gz"
      sha256 "0b696b425056aaa16b9fd249d1d45acd283fa072044f457d33a7f37b9827e71f"
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
