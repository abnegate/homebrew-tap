# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.9.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "e867d658feef395cd7690662bce5e7633fa4ac793b3d735674a64f615f0de6e9"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.9.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "a8f97583e17aefce393d32a2d4160f6cd68843e18cd8c0b86ffb3fe5f3f11a8a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.9.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9552ca499c7a0738277d704ff1c0bb310405915f8507fd6b09bf54b3de6e6cc1"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.9.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "38534841e545d90e542f43d1b945005b4b058cae5482f0feec7dae4c09bd4484"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
