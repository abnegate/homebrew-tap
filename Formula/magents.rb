# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.10.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "69bd83c53f5b44f2e8a9c91201c78c2857aee283227397265c85715ba4f348c4"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.10.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "8e0412c322afeb38ac5fb45dee856f924266fe2a0b23cb0065d4cb64c3e5d69a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.10.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e4d7bfa3e8f3a7fbd4933fac21d16c5018fd26d424c4cba31c5b532289c6fce9"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.10.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "54d651139a03006c8c77286dd50a23870bb98214ae369890d0acdcc1bf02614d"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
