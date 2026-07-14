# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/abnegate/claudear"
  version "0.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/claudear/releases/download/v0.42.0/claudear-macos-arm64.tar.gz"
      sha256 "809cd4123e10c40cfd535a91ca5b48f4d2b93ec0f94ef9071a5cf098478eb67c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/claudear/releases/download/v0.42.0/claudear-linux-amd64.tar.gz"
      sha256 "0d90746586bf0a94d20b6f3e186c178a5b95387237003489e380bcf772aa5807"
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
