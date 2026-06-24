# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.33.0/claudear-macos-arm64.tar.gz"
      sha256 "835baf431b8a99d522311503aef5cce7a6a93ef260d53b01abff203d478da10f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.33.0/claudear-linux-amd64.tar.gz"
      sha256 "17a22ac0f13aa13d2b7eb91e30d76d90cd5c7938d93f82e4b1a1f88cdaf6fbaf"
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
