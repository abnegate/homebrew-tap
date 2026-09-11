# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.12.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "ad9e443ee270f4835d9348e0e5950186617a2760086b752d122f62c6cd800b6d"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.12.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "4e3887baa742ca1f7796a4ca6ee39847ff010c0c99327f68321814ee9efde107"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.12.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e51dd8cde6174c9e5affa4388852780851b4323b394d54b96a2cb6a25470ac2e"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.12.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9c7464a52314e9acd78af1d0e199b4aea6d62e5c9f503fab191acde80e4e8579"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
