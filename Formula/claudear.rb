# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.17.0/claudear-macos-arm64.tar.gz"
      sha256 "24b710935e0da4b25ceb4f72c7e7e5761c287bc1690c70939b6c8f774f6b1916"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.17.0/claudear-linux-amd64.tar.gz"
      sha256 "95846291187d9cdd7a45485cd3519bbf236dd6d1a3606189bd3642ef07046128"
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
