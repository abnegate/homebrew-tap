# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.57.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.0/claudear-macos-arm64.tar.gz"
      sha256 "27ac4247a1f378b5a4297118946ae5aad798c60fcb59ec25f37c08897e5dd9a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.57.0/claudear-linux-amd64.tar.gz"
      sha256 "6d3ff570fc27c4bfdf1cd14a0dd89be42167292a90d92588d1c9ac2f5a96b880"
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
