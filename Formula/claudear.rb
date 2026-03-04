# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.20.0/claudear-macos-arm64.tar.gz"
      sha256 "5257b0a513df092581118521d3ed12d4dde9e948b9bc12aa4d61e76554bdf099"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.20.0/claudear-linux-amd64.tar.gz"
      sha256 "7608202a8f9181989b262c20176a9a8272616ad6e353e3431b8c79d4da6b2c48"
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
