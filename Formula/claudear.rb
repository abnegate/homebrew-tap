# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.10.0/claudear-macos-arm64.tar.gz"
      sha256 "09163a9df14139f68845ea07ce796c1d381d3a96cfcf59c4b601056397e08c70"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.10.0/claudear-linux-amd64.tar.gz"
      sha256 "2ffc076935d94004dfffaa73aee728aa36405dc74a9aece045ab9b4d11b20d69"
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
