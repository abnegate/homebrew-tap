# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.11.1/claudear-macos-arm64.tar.gz"
      sha256 "964b6116fe9e178c76dac75f414fc3976a3764062d14f6d88985e19f8b613634"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.11.1/claudear-linux-amd64.tar.gz"
      sha256 "0708b18ad1b6326c6286d50be95b9c3ff209e5b28d4b1a437ca91655a16a74dc"
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
