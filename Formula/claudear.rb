# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.52.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.52.0/claudear-macos-arm64.tar.gz"
      sha256 "80ec9d7aaaf7551671f3ba6eba0a7ffab5384934169a5fbb9660f9c4996d343a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.52.0/claudear-linux-amd64.tar.gz"
      sha256 "96f8f69f2ef5b10a2e11f601ee94cf549800800a24be324e9fa511273cf67dbc"
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
