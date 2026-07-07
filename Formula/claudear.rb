# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.36.0/claudear-macos-arm64.tar.gz"
      sha256 "4e871417ef92c1811291865f7e181e77aeb0e737841cba29ede4f79feefbc85d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.36.0/claudear-linux-amd64.tar.gz"
      sha256 "70b55fe27e03e4ee6a8636e8637c2967e4b91ad5e15ddc37412f816574bf8001"
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
