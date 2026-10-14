# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.14.1/magents-aarch64-apple-darwin.tar.gz"
      sha256 "2f2570646c16eef6bdabd23b9ecb7da52025b1567cce9ab5f94e6e84249ebd93"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.14.1/magents-x86_64-apple-darwin.tar.gz"
      sha256 "c4ec59794a3d06391738a369dc0f5a144175eb9863a669d442c0c08204c990ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.14.1/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "98b57116956c9a77b278e6b5c3779ba7420db115e2a9dbb56aa90448c6bf4e6f"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.14.1/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "028123684de9a7b8728615668c905841321cdb7fe109fd192de9720212a6daa9"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
