# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.9.0/claudear-macos-arm64.tar.gz"
      sha256 "331605e69c89396f92ca5e78da09e5ba89556ad6f9cb232bebcd162f7a61f1d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.9.0/claudear-linux-amd64.tar.gz"
      sha256 "e0880124f67627fb88c0d35ddbcbf593dd474b4b5f7e8d2317f100bf9dd57f47"
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
