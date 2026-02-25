# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.13.0/claudear-macos-arm64.tar.gz"
      sha256 "fe96b45266aa691bc460dbe518dff8c8a58defbfe87b92ceee3155efcdfb8efb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.13.0/claudear-linux-amd64.tar.gz"
      sha256 "e9dacf37e7b4f90df918f0f4e6516de21586fc954e70fa917737bf8834e842d2"
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
