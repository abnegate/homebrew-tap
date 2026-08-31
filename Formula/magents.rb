# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.4.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "4312e075a84fd286b4874291bd419d4cd86b60aa638c8f803ebdb96ccdda3a9d"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.4.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "6d18f4030a43647eaccabb2e6080c24f4a5bd6d49558bb1f5471b13e918e32c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.4.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "118a78e7c75f86880a59f67a6d0f5deca28ed5522157806c3434b72890578dd3"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.4.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c24a63853170a27c38c6ff6da2a52b67aab5f614a7750b18f62f14cc6ecb17f0"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
