# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.26.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.26.1/claudear-macos-arm64.tar.gz"
      sha256 "598bf7957b51b4bf1d7d83877352d2f3c8edefa0725b5be087818ed5e33dddbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.26.1/claudear-linux-amd64.tar.gz"
      sha256 "fa3e4f0779818888e77465da28de6c7372688d1c1af7d31bfd456aaf26b6d0b9"
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
