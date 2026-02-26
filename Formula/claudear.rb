# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.15.1/claudear-macos-arm64.tar.gz"
      sha256 "c0ad4a069fc8ae83203f85a9a969d3dff2fd1ac06c2c38234a788af2e805c840"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.15.1/claudear-linux-amd64.tar.gz"
      sha256 "b05e0875051f9a1687fb87719cba5ffbb15a9f572224874d6929207fa1711052"
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
