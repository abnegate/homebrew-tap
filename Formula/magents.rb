# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.7.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "05eb07a4a5eb841a5b4656c9566c245b93183d6c34c71bb842cf39d933c9f1e6"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.7.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "45f7c2883aa9c302d630dd133ca536724079707d5bdaf733ec9b9ee53ae14c73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.7.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eace706f4310e8d727d70a42c3ef7f158fab19e1bedc6b5763f7906281b241e6"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.7.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c2d3cda5d0ce710005793315d7de9633f588a1ddee503cd9ef255df1cc324a45"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
