# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.14.0/claudear-macos-arm64.tar.gz"
      sha256 "601e2a402034ec4d8d302d0a6c579afbe70930a1d6f2020808e28d47ca30dc19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.14.0/claudear-linux-amd64.tar.gz"
      sha256 "2c3cfdcd44d88b38ec780f5f96009705b82b53126ad57ebdd7b8b21a93f917e4"
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
