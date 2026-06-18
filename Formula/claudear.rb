# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.30.0/claudear-macos-arm64.tar.gz"
      sha256 "ad98e3a257976020af599459e01ff2f898ccb5db97e4f91e6ca59ddba5201247"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.30.0/claudear-linux-amd64.tar.gz"
      sha256 "d77986df6ec9fed675ed01bf9f657d5f3aa594dd33926aa869d493f5b5410f9d"
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
