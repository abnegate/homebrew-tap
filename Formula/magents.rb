# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.8.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "f0cbefab41789db4e1797824d1dfe1ae3635e276637201b26cf96e9ea5a1e545"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.8.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "6552e74b227236deb2189e4d4fa61e7b37958ee4d6ea8b2fb3f8a81365fffdfd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.8.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0fca3dab836c51a5b4d17db493fd98bb69e9999d54fe05461f8c26d065ca6e8e"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.8.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c7bd3ae71eaa341836cac7895a0b3cf19e6ffb49dfadaa4f22ff9db33f429e0f"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
