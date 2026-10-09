# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.13.1/magents-aarch64-apple-darwin.tar.gz"
      sha256 "d7cada1f7f0aa32bd037394bd787d60b28730dc808e27e2f387459477a2dd48d"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.13.1/magents-x86_64-apple-darwin.tar.gz"
      sha256 "cb8b8ae4afa927fbfce685ba8dff47f4cb8d6d3f295cb98c15e242ae14af47f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.13.1/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c4eea2b0ff05ae964034349713994652243a6855e7f3e72cf7aca735ef784113"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.13.1/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0fa43f1fae879949e027a3be54fcca6e1961416fa6f1b726ecfb45a4bc31b980"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
