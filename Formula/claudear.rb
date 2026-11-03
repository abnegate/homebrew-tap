# typed: false
# frozen_string_literal: true

class Claudear < Formula
  desc "High-performance watcher service that monitors issue trackers and spawns Claude Code agents to own resolution"
  homepage "https://github.com/appwrite/claudear"
  version "0.56.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appwrite/claudear/releases/download/v0.56.3/claudear-macos-arm64.tar.gz"
      sha256 "7f8b3d0793cc2844d689c3698bb7c5e6329adb5c3c2864822f82485c47799f40"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/appwrite/claudear/releases/download/v0.56.3/claudear-linux-amd64.tar.gz"
      sha256 "464e76cd289135c16a4506893aee93693bbbdfcd70ac13fe5baa40d3f67878c3"
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
