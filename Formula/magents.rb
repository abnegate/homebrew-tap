# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.11.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "3218eb2b3686cf5aeb970d533af88ca22d5e097faaa9532a8b72c1c7c446d29a"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.11.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "55d90f01f253e234550bd2b6cf73734fc1ccc0231790bcef0cf54c3ddb901c55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.11.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3763bbb859bf22feffefad3c1ecf44049815e9cdb89a66c92faa4276b3a4f36e"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.11.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8e82eeec03ac80d2574dd2640d95248778fe75344359bc99a8f68e9aff94129f"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
