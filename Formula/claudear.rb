# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.26.0/claudear-macos-arm64.tar.gz"
      sha256 "2fbc00be5fed3601db13b4dbf0fe13bb8d40cf10f4c4bb797dc7cd49e184e92c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.26.0/claudear-linux-amd64.tar.gz"
      sha256 "05d1ce6e35c1ed7ff2e949ababb99559efded167dbb71ca9b59ba5b4e9ea7f84"
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
