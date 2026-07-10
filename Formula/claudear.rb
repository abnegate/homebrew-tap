# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.38.0/claudear-macos-arm64.tar.gz"
      sha256 "97aa18d9d3b7b6372aa62a0cf850193c49a4196b7c879fc63d87dbcd45d2acd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.38.0/claudear-linux-amd64.tar.gz"
      sha256 "a8f1c73fc0a7eb0b2857436d24b93ac7bf5414a0344b555ef2a9a69a2dade23e"
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
