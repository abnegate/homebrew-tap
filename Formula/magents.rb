# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.14.2/magents-aarch64-apple-darwin.tar.gz"
      sha256 "22a5ac3f3d0f2f96b5ac575824e9348fe6d00689869fd5990ed2b22bf0b4d6cd"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.14.2/magents-x86_64-apple-darwin.tar.gz"
      sha256 "4a73b5e1fbf14a0acd1c83f4d4341cac0b592dba0fdc9f7cfa1e459252526f2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.14.2/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1884c1afd2e80aa1273104f40d090c372a814ffc34defafce063027973c62fd5"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.14.2/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9f209ab69274203f9f7e0dab1380f84348e30e8f6495a35898fe78bb26cf1b6f"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
