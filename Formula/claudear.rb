# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.6.0/claudear-macos-arm64.tar.gz"
      sha256 "99e38af7ad0e37db37f44a91d5dd1f9fc8eac8cfce7500a5ec2bbef6d1de4712"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.6.0/claudear-linux-amd64.tar.gz"
      sha256 "5816fde255ff439dc18ecbd74feb3827144e59b78cd26b52f7dd134eefa34ed4"
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
